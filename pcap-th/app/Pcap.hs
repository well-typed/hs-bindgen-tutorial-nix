-- {-# OPTIONS_GHC -ddump-splices #-}

{-# LANGUAGE CApiFFI #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Main where

import HsBindgen.TH
import HsBindgen.Runtime.Prelude qualified

import Control.Monad (unless)

import Foreign qualified
import Foreign.C qualified as C

import Optics ((&), (.~))

let headerHasPcap = BIf $ SelectHeader $ HeaderPathMatches "pcap.h"
    isDeprecated  = BIf $ SelectDecl     DeclDeprecated
    hasName       = BIf . SelectDecl   . DeclNameMatches
    isExcluded     =
        BOr (hasName "pcap_open")
      $ BOr (hasName "pcap_createsrcstr")
      $ BOr (hasName "pcap_parsesrcstr")
      $ BOr (hasName "pcap_findalldevs_ex")
      $ BOr (hasName "pcap_setsampling")
            (hasName "pcap_remoteact")
    selectP = BAnd headerHasPcap
            $ BAnd (BNot isDeprecated)
                   (BNot isExcluded)
    cfg :: Config
    cfg = def
      & #parsePredicate  .~ BTrue
      & #selectPredicate .~ selectP
      & #programSlicing  .~ EnableProgramSlicing
    cfgTH :: ConfigTH
    cfgTH = ConfigTH { safety = Safe }
 in withHsBindgen cfg cfgTH $ hashInclude "pcap.h"

main :: IO ()
main = do
  putStrLn "List of network devices found:"
  mapM_ (putStrLn . ("  - " ++)) =<< findAllDevNames

findAllDevNames :: IO [String]
findAllDevNames = Foreign.alloca $ \pcapIfTPtrPtr -> do
    Foreign.allocaBytes (fromIntegral pCAP_ERRBUF_SIZE) $ \errBuf -> do
      success <- pcap_findalldevs pcapIfTPtrPtr errBuf
      unless (success == 0) $ fail "find all devices failed"
    pcapIfTPtr <- Foreign.peek pcapIfTPtrPtr
    devNames <- aux [] pcapIfTPtr
    pcap_freealldevs pcapIfTPtr
    return devNames
  where
    aux :: [String] -> Foreign.Ptr Pcap_if_t -> IO [String]
    aux acc ptr
      | ptr == Foreign.nullPtr = return $ reverse acc
      | otherwise = do
          pcapIfT <- Foreign.peek ptr
          devName <- C.peekCString $ pcap_if_t_name pcapIfT
          aux (devName : acc) (pcap_if_t_next pcapIfT)
