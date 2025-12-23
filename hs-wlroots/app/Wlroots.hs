module Main where

import Generated.Wlroots.Backend.Safe qualified as WlrS

main :: IO ()
main = do
  let _backend = WlrS.wlr_backend_autocreate
  print "TODO (Work in progress)"
