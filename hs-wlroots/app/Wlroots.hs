{-# LANGUAGE DataKinds #-}

module Main where

import Control.Monad
import Data.Proxy (Proxy (..))
import Foreign qualified
import Foreign.C qualified as Foreign
import Generated.Wayland
import Generated.Wayland.Safe
import Generated.Wlroots.Backend
import Generated.Wlroots.Backend.Safe
import HsBindgen.Runtime.FunPtr
import HsBindgen.Runtime.HasCField

handler :: Wl_notify_func_t_Aux
handler = Wl_notify_func_t_Aux $ \_listenerPtr voidPtr -> do
  let output :: Foreign.Ptr Wlr_output
      output = Foreign.castPtr voidPtr
  outputDescription <-
    Foreign.peekCString =<< peekCField (Proxy @"wlr_output_description") output
  putStrLn $ "Detected output with description: " <> outputDescription

getListener :: IO (Foreign.Ptr Wl_listener)
getListener = do
  let noList = Wl_list Foreign.nullPtr Foreign.nullPtr
  funPtr <- Wl_notify_func_t <$> toFunPtr handler
  Foreign.new $ Wl_listener noList funPtr

main :: IO ()
main = do
  eventLoop <- wl_event_loop_create
  backend <- wlr_backend_autocreate eventLoop Foreign.nullPtr
  listener <- getListener

  let events :: Foreign.Ptr Wlr_backend_events
      events = ptrToCField (Proxy @"wlr_backend_events") backend

      newOutputSignal :: Foreign.Ptr Wl_signal
      newOutputSignal = ptrToCField (Proxy @"wlr_backend_events_new_output") events

  wl_signal_add newOutputSignal listener

  res <- wlr_backend_start backend
  when (res == 0) $ error "failed to start backend"

  -- Not sure if this is necessary. I always detect exactly one fake monitor on
  -- X11.
  void $ wl_event_loop_dispatch eventLoop 0
