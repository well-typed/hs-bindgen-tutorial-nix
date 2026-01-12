{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedRecordDot #-}

module Main where

import Control.Monad
import Data.Proxy (Proxy (..))
import Foreign (Ptr)
import Foreign qualified
import Foreign.C qualified as Foreign
import Generated.Wayland.Server.Core
import Generated.Wayland.Server.Core.Safe
import Generated.Wayland.Util
import Generated.Wayland.Util.Safe
import Generated.Wlr.Backend.Safe
import Generated.Wlr.Types.Output
import HsBindgen.Runtime.FunPtr
import HsBindgen.Runtime.HasCField

handler :: Wl_notify_func_t_Aux
handler = Wl_notify_func_t_Aux $ \_listenerPtr voidPtr -> do
  let output :: Foreign.Ptr Wlr_output
      output = Foreign.castPtr voidPtr
  outputDescription <-
    Foreign.peekCString =<< peekCField (Proxy @"wlr_output_description") output
  putStrLn $ "Detected output with description: " <> outputDescription

getListener :: IO (Ptr Wl_listener)
getListener = do
  let noList = Wl_list Foreign.nullPtr Foreign.nullPtr
  -- TODO: Highlight the higher-order API.
  funPtr <- Wl_notify_func_t <$> toFunPtr handler
  Foreign.new $ Wl_listener noList funPtr

failWhenNull :: String -> IO () -> Ptr a -> IO ()
failWhenNull what destructor p =
  when (p == Foreign.nullPtr) $ do
    destructor
    (error $ "failed to obtain resource: " <> what)

main :: IO ()
main = do
  eventLoop <- wl_event_loop_create
  failWhenNull "Event loop" (wl_event_loop_destroy eventLoop) eventLoop

  backend <- wlr_backend_autocreate eventLoop Foreign.nullPtr
  let destructor = wlr_backend_destroy backend >> wl_event_loop_destroy eventLoop
  failWhenNull "Backend" destructor backend

  listener <- getListener
  failWhenNull "Listener" (pure ()) listener

  -- TODO: Highlight the record-dot syntax (zero-copy) API.
  let newOutputSignal :: Ptr Wl_signal
      newOutputSignal = backend.wlr_backend_events.wlr_backend_events_new_output

  failWhenNull "New output signal" destructor newOutputSignal

  wl_signal_add newOutputSignal listener

  -- It is annoying that we have to free the list of listeners manually.
  let signalList :: Ptr Wl_list
      signalList = ptrToCField (Proxy @"wl_signal_listener_list") newOutputSignal
  prev :: Ptr Wl_list <- peekCField (Proxy @"wl_list_prev") signalList
  let destructorWithList = wl_list_remove prev >> destructor

  backendOk <- wlr_backend_start backend
  when (backendOk == 0) $ do
    destructorWithList
    error "failed to start backend"

  -- Not sure if this is necessary. I always detect exactly one fake monitor on
  -- X11.
  eventLoopOk <- wl_event_loop_dispatch eventLoop 0
  -- Also, interestingly, `wlr_backend_start` returns zero on error;
  -- `wl_event_loop_dispatch` returns non-zero on error.
  unless (eventLoopOk == 0) $ do
    destructorWithList
    error "failed to dispatch event loop"

  destructorWithList
