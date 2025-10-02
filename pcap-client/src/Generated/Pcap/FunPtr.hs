{-# LANGUAGE CApiFFI #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_HADDOCK prune #-}

module Generated.Pcap.FunPtr where

import qualified Foreign.C as FC
import qualified GHC.IO.Unsafe
import qualified GHC.Ptr as Ptr
import qualified HsBindgen.Runtime.Prelude
import Data.Void (Void)
import Generated.Pcap
import Prelude (IO)

$(HsBindgen.Runtime.Prelude.addCSource "#include <pcap.h>\n/* get_pcap_init_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_7c1b7ac86856321a (void)) (unsigned int arg1, char *arg2) { return &pcap_init; } \n/* get_pcap_lookupnet_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_e44fd6214e0629a6 (void)) (char const *arg1, bpf_u_int32 *arg2, bpf_u_int32 *arg3, char *arg4) { return &pcap_lookupnet; } \n/* get_pcap_create_ptr */ __attribute__ ((const)) pcap_t *(*hs_bindgen_debff78509f42533 (void)) (char const *arg1, char *arg2) { return &pcap_create; } \n/* get_pcap_set_snaplen_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_1db09793e4cb9451 (void)) (pcap_t *arg1, signed int arg2) { return &pcap_set_snaplen; } \n/* get_pcap_set_promisc_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_f56b96192dae3086 (void)) (pcap_t *arg1, signed int arg2) { return &pcap_set_promisc; } \n/* get_pcap_can_set_rfmon_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_aa8d2943c1502b03 (void)) (pcap_t *arg1) { return &pcap_can_set_rfmon; } \n/* get_pcap_set_rfmon_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_2bab3fae7112ffa8 (void)) (pcap_t *arg1, signed int arg2) { return &pcap_set_rfmon; } \n/* get_pcap_set_timeout_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_36898813a7ded8b4 (void)) (pcap_t *arg1, signed int arg2) { return &pcap_set_timeout; } \n/* get_pcap_set_tstamp_type_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_d7f5e6a3aa996c31 (void)) (pcap_t *arg1, signed int arg2) { return &pcap_set_tstamp_type; } \n/* get_pcap_set_immediate_mode_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_feb58d0f66ce0b37 (void)) (pcap_t *arg1, signed int arg2) { return &pcap_set_immediate_mode; } \n/* get_pcap_set_buffer_size_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_9b14b2982a6afc07 (void)) (pcap_t *arg1, signed int arg2) { return &pcap_set_buffer_size; } \n/* get_pcap_set_tstamp_precision_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_c6257c2e7f89c35e (void)) (pcap_t *arg1, signed int arg2) { return &pcap_set_tstamp_precision; } \n/* get_pcap_get_tstamp_precision_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_3da9896575292802 (void)) (pcap_t *arg1) { return &pcap_get_tstamp_precision; } \n/* get_pcap_activate_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_62983d89a5a522b8 (void)) (pcap_t *arg1) { return &pcap_activate; } \n/* get_pcap_list_tstamp_types_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_ad8c5ece9250d58e (void)) (pcap_t *arg1, signed int **arg2) { return &pcap_list_tstamp_types; } \n/* get_pcap_free_tstamp_types_ptr */ __attribute__ ((const)) void (*hs_bindgen_bed1bd0a4f0c003d (void)) (signed int *arg1) { return &pcap_free_tstamp_types; } \n/* get_pcap_tstamp_type_name_to_val_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_e2c170811032a339 (void)) (char const *arg1) { return &pcap_tstamp_type_name_to_val; } \n/* get_pcap_tstamp_type_val_to_name_ptr */ __attribute__ ((const)) char const *(*hs_bindgen_f7bc3be76ec31c83 (void)) (signed int arg1) { return &pcap_tstamp_type_val_to_name; } \n/* get_pcap_tstamp_type_val_to_description_ptr */ __attribute__ ((const)) char const *(*hs_bindgen_3cd8194a0b544cfe (void)) (signed int arg1) { return &pcap_tstamp_type_val_to_description; } \n/* get_pcap_set_protocol_linux_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_9532e143234c50d3 (void)) (pcap_t *arg1, signed int arg2) { return &pcap_set_protocol_linux; } \n/* get_pcap_fopen_offline_with_tstamp_precision_ptr */ __attribute__ ((const)) pcap_t *(*hs_bindgen_ff4b085392a36137 (void)) (FILE *arg1, u_int arg2, char *arg3) { return &pcap_fopen_offline_with_tstamp_precision; } \n/* get_pcap_fopen_offline_ptr */ __attribute__ ((const)) pcap_t *(*hs_bindgen_37fe9cbe3f481841 (void)) (FILE *arg1, char *arg2) { return &pcap_fopen_offline; } \n/* get_pcap_close_ptr */ __attribute__ ((const)) void (*hs_bindgen_0afa89fedf9ce7c7 (void)) (pcap_t *arg1) { return &pcap_close; } \n/* get_pcap_loop_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_2f5ac1526cadb9f2 (void)) (pcap_t *arg1, signed int arg2, pcap_handler arg3, u_char *arg4) { return &pcap_loop; } \n/* get_pcap_dispatch_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_b2d427220ca414c3 (void)) (pcap_t *arg1, signed int arg2, pcap_handler arg3, u_char *arg4) { return &pcap_dispatch; } \n/* get_pcap_next_ptr */ __attribute__ ((const)) u_char const *(*hs_bindgen_b4961f122a8bbdfe (void)) (pcap_t *arg1, struct pcap_pkthdr *arg2) { return &pcap_next; } \n/* get_pcap_next_ex_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_833db108f806795e (void)) (pcap_t *arg1, struct pcap_pkthdr **arg2, u_char const **arg3) { return &pcap_next_ex; } \n/* get_pcap_breakloop_ptr */ __attribute__ ((const)) void (*hs_bindgen_06aa5407028e454c (void)) (pcap_t *arg1) { return &pcap_breakloop; } \n/* get_pcap_stats_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_50953b9be5a5a998 (void)) (pcap_t *arg1, struct pcap_stat *arg2) { return &pcap_stats; } \n/* get_pcap_setfilter_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_208f1de05bac28c1 (void)) (pcap_t *arg1, struct bpf_program *arg2) { return &pcap_setfilter; } \n/* get_pcap_setdirection_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_dc2cc17b816c502a (void)) (pcap_t *arg1, pcap_direction_t arg2) { return &pcap_setdirection; } \n/* get_pcap_getnonblock_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_e339ea4a31d3bffa (void)) (pcap_t *arg1, char *arg2) { return &pcap_getnonblock; } \n/* get_pcap_setnonblock_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_8d966ff8382f6e4a (void)) (pcap_t *arg1, signed int arg2, char *arg3) { return &pcap_setnonblock; } \n/* get_pcap_inject_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_cdd6d3f4f973ef42 (void)) (pcap_t *arg1, void const *arg2, size_t arg3) { return &pcap_inject; } \n/* get_pcap_sendpacket_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_395d204dfa69283b (void)) (pcap_t *arg1, u_char const *arg2, signed int arg3) { return &pcap_sendpacket; } \n/* get_pcap_statustostr_ptr */ __attribute__ ((const)) char const *(*hs_bindgen_76832454f4b4f404 (void)) (signed int arg1) { return &pcap_statustostr; } \n/* get_pcap_strerror_ptr */ __attribute__ ((const)) char const *(*hs_bindgen_101f0fd627150576 (void)) (signed int arg1) { return &pcap_strerror; } \n/* get_pcap_geterr_ptr */ __attribute__ ((const)) char *(*hs_bindgen_6baae6d1131d2841 (void)) (pcap_t *arg1) { return &pcap_geterr; } \n/* get_pcap_perror_ptr */ __attribute__ ((const)) void (*hs_bindgen_c3264f7ecee1a4e1 (void)) (pcap_t *arg1, char const *arg2) { return &pcap_perror; } \n/* get_pcap_compile_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_0cb43f1a95434a9b (void)) (pcap_t *arg1, struct bpf_program *arg2, char const *arg3, signed int arg4, bpf_u_int32 arg5) { return &pcap_compile; } \n/* get_pcap_freecode_ptr */ __attribute__ ((const)) void (*hs_bindgen_d18d531694f2b835 (void)) (struct bpf_program *arg1) { return &pcap_freecode; } \n/* get_pcap_offline_filter_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_5bf4e2b19e19f25a (void)) (struct bpf_program const *arg1, struct pcap_pkthdr const *arg2, u_char const *arg3) { return &pcap_offline_filter; } \n/* get_pcap_datalink_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_61dfc5544c2fde78 (void)) (pcap_t *arg1) { return &pcap_datalink; } \n/* get_pcap_datalink_ext_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_1b2619df65b5b3ee (void)) (pcap_t *arg1) { return &pcap_datalink_ext; } \n/* get_pcap_list_datalinks_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_05e3d6319aa8f2a4 (void)) (pcap_t *arg1, signed int **arg2) { return &pcap_list_datalinks; } \n/* get_pcap_set_datalink_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_a8c6ba3a8d6d651d (void)) (pcap_t *arg1, signed int arg2) { return &pcap_set_datalink; } \n/* get_pcap_free_datalinks_ptr */ __attribute__ ((const)) void (*hs_bindgen_fc8b37ae1690f7f9 (void)) (signed int *arg1) { return &pcap_free_datalinks; } \n/* get_pcap_datalink_name_to_val_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_73d68e2612df3218 (void)) (char const *arg1) { return &pcap_datalink_name_to_val; } \n/* get_pcap_datalink_val_to_name_ptr */ __attribute__ ((const)) char const *(*hs_bindgen_884caae9390f3685 (void)) (signed int arg1) { return &pcap_datalink_val_to_name; } \n/* get_pcap_datalink_val_to_description_ptr */ __attribute__ ((const)) char const *(*hs_bindgen_931d101bba7a1a3e (void)) (signed int arg1) { return &pcap_datalink_val_to_description; } \n/* get_pcap_datalink_val_to_description_or_dlt_ptr */ __attribute__ ((const)) char const *(*hs_bindgen_792692e870ac4d7f (void)) (signed int arg1) { return &pcap_datalink_val_to_description_or_dlt; } \n/* get_pcap_snapshot_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_e0a8b93e6a9bdfa1 (void)) (pcap_t *arg1) { return &pcap_snapshot; } \n/* get_pcap_is_swapped_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_72cc7fd923e2ef61 (void)) (pcap_t *arg1) { return &pcap_is_swapped; } \n/* get_pcap_major_version_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_ec71d4a33c4444e9 (void)) (pcap_t *arg1) { return &pcap_major_version; } \n/* get_pcap_minor_version_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_e3018d0f6e09266e (void)) (pcap_t *arg1) { return &pcap_minor_version; } \n/* get_pcap_bufsize_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_1f3e7e82a1611ba2 (void)) (pcap_t *arg1) { return &pcap_bufsize; } \n/* get_pcap_file_ptr */ __attribute__ ((const)) FILE *(*hs_bindgen_2e081edce226c54d (void)) (pcap_t *arg1) { return &pcap_file; } \n/* get_pcap_fileno_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_ac33f3891a8e3080 (void)) (pcap_t *arg1) { return &pcap_fileno; } \n/* get_pcap_dump_open_ptr */ __attribute__ ((const)) pcap_dumper_t *(*hs_bindgen_5470e636c5bc7048 (void)) (pcap_t *arg1, char const *arg2) { return &pcap_dump_open; } \n/* get_pcap_dump_fopen_ptr */ __attribute__ ((const)) pcap_dumper_t *(*hs_bindgen_051c9cc3a951c89b (void)) (pcap_t *arg1, FILE *arg2) { return &pcap_dump_fopen; } \n/* get_pcap_dump_open_append_ptr */ __attribute__ ((const)) pcap_dumper_t *(*hs_bindgen_9e396a9a5d440076 (void)) (pcap_t *arg1, char const *arg2) { return &pcap_dump_open_append; } \n/* get_pcap_dump_file_ptr */ __attribute__ ((const)) FILE *(*hs_bindgen_fdf7af9a910a286d (void)) (pcap_dumper_t *arg1) { return &pcap_dump_file; } \n/* get_pcap_dump_ftell_ptr */ __attribute__ ((const)) signed long (*hs_bindgen_da20c4a6f44a9bc9 (void)) (pcap_dumper_t *arg1) { return &pcap_dump_ftell; } \n/* get_pcap_dump_ftell64_ptr */ __attribute__ ((const)) int64_t (*hs_bindgen_4927d639a70d7f33 (void)) (pcap_dumper_t *arg1) { return &pcap_dump_ftell64; } \n/* get_pcap_dump_flush_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_6876213450a757a5 (void)) (pcap_dumper_t *arg1) { return &pcap_dump_flush; } \n/* get_pcap_dump_close_ptr */ __attribute__ ((const)) void (*hs_bindgen_d07f05d261ad218d (void)) (pcap_dumper_t *arg1) { return &pcap_dump_close; } \n/* get_pcap_dump_ptr */ __attribute__ ((const)) void (*hs_bindgen_ff7ec52b14c62df5 (void)) (u_char *arg1, struct pcap_pkthdr const *arg2, u_char const *arg3) { return &pcap_dump; } \n/* get_pcap_findalldevs_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_50133d2a0332f6d8 (void)) (pcap_if_t **arg1, char *arg2) { return &pcap_findalldevs; } \n/* get_pcap_freealldevs_ptr */ __attribute__ ((const)) void (*hs_bindgen_472cbbaa41de590c (void)) (pcap_if_t *arg1) { return &pcap_freealldevs; } \n/* get_pcap_lib_version_ptr */ __attribute__ ((const)) char const *(*hs_bindgen_87738d2a0be678a8 (void)) (void) { return &pcap_lib_version; } \n/* get_pcap_get_selectable_fd_ptr */ __attribute__ ((const)) signed int (*hs_bindgen_daa57bba73ca0a86 (void)) (pcap_t *arg1) { return &pcap_get_selectable_fd; } \n/* get_pcap_get_required_select_timeout_ptr */ __attribute__ ((const)) struct timeval const *(*hs_bindgen_2c0c8181a1f9260c (void)) (pcap_t *arg1) { return &pcap_get_required_select_timeout; } \n")

foreign import ccall unsafe "hs_bindgen_7c1b7ac86856321a" hs_bindgen_7c1b7ac86856321a
  :: IO (Ptr.FunPtr (FC.CUInt -> (Ptr.Ptr FC.CChar) -> IO FC.CInt))

{-# NOINLINE pcap_init_ptr #-}

{-| __C declaration:__ @pcap_init@

    __defined at:__ @pcap\/pcap.h:435:14@

    __exported by:__ @pcap.h@
-}
pcap_init_ptr :: Ptr.FunPtr (FC.CUInt -> (Ptr.Ptr FC.CChar) -> IO FC.CInt)
pcap_init_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_7c1b7ac86856321a

foreign import ccall unsafe "hs_bindgen_e44fd6214e0629a6" hs_bindgen_e44fd6214e0629a6
  :: IO (Ptr.FunPtr ((Ptr.Ptr FC.CChar) -> (Ptr.Ptr Bpf_u_int32) -> (Ptr.Ptr Bpf_u_int32) -> (Ptr.Ptr FC.CChar) -> IO FC.CInt))

{-# NOINLINE pcap_lookupnet_ptr #-}

{-| __C declaration:__ @pcap_lookupnet@

    __defined at:__ @pcap\/pcap.h:447:14@

    __exported by:__ @pcap.h@
-}
pcap_lookupnet_ptr :: Ptr.FunPtr ((Ptr.Ptr FC.CChar) -> (Ptr.Ptr Bpf_u_int32) -> (Ptr.Ptr Bpf_u_int32) -> (Ptr.Ptr FC.CChar) -> IO FC.CInt)
pcap_lookupnet_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_e44fd6214e0629a6

foreign import ccall unsafe "hs_bindgen_debff78509f42533" hs_bindgen_debff78509f42533
  :: IO (Ptr.FunPtr ((Ptr.Ptr FC.CChar) -> (Ptr.Ptr FC.CChar) -> IO (Ptr.Ptr Pcap_t)))

{-# NOINLINE pcap_create_ptr #-}

{-| __C declaration:__ @pcap_create@

    __defined at:__ @pcap\/pcap.h:450:18@

    __exported by:__ @pcap.h@
-}
pcap_create_ptr :: Ptr.FunPtr ((Ptr.Ptr FC.CChar) -> (Ptr.Ptr FC.CChar) -> IO (Ptr.Ptr Pcap_t))
pcap_create_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_debff78509f42533

foreign import ccall unsafe "hs_bindgen_1db09793e4cb9451" hs_bindgen_1db09793e4cb9451
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt))

{-# NOINLINE pcap_set_snaplen_ptr #-}

{-| __C declaration:__ @pcap_set_snaplen@

    __defined at:__ @pcap\/pcap.h:453:14@

    __exported by:__ @pcap.h@
-}
pcap_set_snaplen_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt)
pcap_set_snaplen_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_1db09793e4cb9451

foreign import ccall unsafe "hs_bindgen_f56b96192dae3086" hs_bindgen_f56b96192dae3086
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt))

{-# NOINLINE pcap_set_promisc_ptr #-}

{-| __C declaration:__ @pcap_set_promisc@

    __defined at:__ @pcap\/pcap.h:456:14@

    __exported by:__ @pcap.h@
-}
pcap_set_promisc_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt)
pcap_set_promisc_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_f56b96192dae3086

foreign import ccall unsafe "hs_bindgen_aa8d2943c1502b03" hs_bindgen_aa8d2943c1502b03
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt))

{-# NOINLINE pcap_can_set_rfmon_ptr #-}

{-| __C declaration:__ @pcap_can_set_rfmon@

    __defined at:__ @pcap\/pcap.h:459:14@

    __exported by:__ @pcap.h@
-}
pcap_can_set_rfmon_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt)
pcap_can_set_rfmon_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_aa8d2943c1502b03

foreign import ccall unsafe "hs_bindgen_2bab3fae7112ffa8" hs_bindgen_2bab3fae7112ffa8
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt))

{-# NOINLINE pcap_set_rfmon_ptr #-}

{-| __C declaration:__ @pcap_set_rfmon@

    __defined at:__ @pcap\/pcap.h:462:14@

    __exported by:__ @pcap.h@
-}
pcap_set_rfmon_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt)
pcap_set_rfmon_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_2bab3fae7112ffa8

foreign import ccall unsafe "hs_bindgen_36898813a7ded8b4" hs_bindgen_36898813a7ded8b4
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt))

{-# NOINLINE pcap_set_timeout_ptr #-}

{-| __C declaration:__ @pcap_set_timeout@

    __defined at:__ @pcap\/pcap.h:465:14@

    __exported by:__ @pcap.h@
-}
pcap_set_timeout_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt)
pcap_set_timeout_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_36898813a7ded8b4

foreign import ccall unsafe "hs_bindgen_d7f5e6a3aa996c31" hs_bindgen_d7f5e6a3aa996c31
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt))

{-# NOINLINE pcap_set_tstamp_type_ptr #-}

{-| __C declaration:__ @pcap_set_tstamp_type@

    __defined at:__ @pcap\/pcap.h:468:14@

    __exported by:__ @pcap.h@
-}
pcap_set_tstamp_type_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt)
pcap_set_tstamp_type_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_d7f5e6a3aa996c31

foreign import ccall unsafe "hs_bindgen_feb58d0f66ce0b37" hs_bindgen_feb58d0f66ce0b37
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt))

{-# NOINLINE pcap_set_immediate_mode_ptr #-}

{-| __C declaration:__ @pcap_set_immediate_mode@

    __defined at:__ @pcap\/pcap.h:471:14@

    __exported by:__ @pcap.h@
-}
pcap_set_immediate_mode_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt)
pcap_set_immediate_mode_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_feb58d0f66ce0b37

foreign import ccall unsafe "hs_bindgen_9b14b2982a6afc07" hs_bindgen_9b14b2982a6afc07
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt))

{-# NOINLINE pcap_set_buffer_size_ptr #-}

{-| __C declaration:__ @pcap_set_buffer_size@

    __defined at:__ @pcap\/pcap.h:474:14@

    __exported by:__ @pcap.h@
-}
pcap_set_buffer_size_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt)
pcap_set_buffer_size_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_9b14b2982a6afc07

foreign import ccall unsafe "hs_bindgen_c6257c2e7f89c35e" hs_bindgen_c6257c2e7f89c35e
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt))

{-# NOINLINE pcap_set_tstamp_precision_ptr #-}

{-| __C declaration:__ @pcap_set_tstamp_precision@

    __defined at:__ @pcap\/pcap.h:477:14@

    __exported by:__ @pcap.h@
-}
pcap_set_tstamp_precision_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt)
pcap_set_tstamp_precision_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_c6257c2e7f89c35e

foreign import ccall unsafe "hs_bindgen_3da9896575292802" hs_bindgen_3da9896575292802
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt))

{-# NOINLINE pcap_get_tstamp_precision_ptr #-}

{-| __C declaration:__ @pcap_get_tstamp_precision@

    __defined at:__ @pcap\/pcap.h:480:14@

    __exported by:__ @pcap.h@
-}
pcap_get_tstamp_precision_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt)
pcap_get_tstamp_precision_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_3da9896575292802

foreign import ccall unsafe "hs_bindgen_62983d89a5a522b8" hs_bindgen_62983d89a5a522b8
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt))

{-# NOINLINE pcap_activate_ptr #-}

{-| __C declaration:__ @pcap_activate@

    __defined at:__ @pcap\/pcap.h:483:14@

    __exported by:__ @pcap.h@
-}
pcap_activate_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt)
pcap_activate_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_62983d89a5a522b8

foreign import ccall unsafe "hs_bindgen_ad8c5ece9250d58e" hs_bindgen_ad8c5ece9250d58e
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr (Ptr.Ptr FC.CInt)) -> IO FC.CInt))

{-# NOINLINE pcap_list_tstamp_types_ptr #-}

{-| __C declaration:__ @pcap_list_tstamp_types@

    __defined at:__ @pcap\/pcap.h:486:14@

    __exported by:__ @pcap.h@
-}
pcap_list_tstamp_types_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr (Ptr.Ptr FC.CInt)) -> IO FC.CInt)
pcap_list_tstamp_types_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_ad8c5ece9250d58e

foreign import ccall unsafe "hs_bindgen_bed1bd0a4f0c003d" hs_bindgen_bed1bd0a4f0c003d
  :: IO (Ptr.FunPtr ((Ptr.Ptr FC.CInt) -> IO ()))

{-# NOINLINE pcap_free_tstamp_types_ptr #-}

{-| __C declaration:__ @pcap_free_tstamp_types@

    __defined at:__ @pcap\/pcap.h:489:15@

    __exported by:__ @pcap.h@
-}
pcap_free_tstamp_types_ptr :: Ptr.FunPtr ((Ptr.Ptr FC.CInt) -> IO ())
pcap_free_tstamp_types_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_bed1bd0a4f0c003d

foreign import ccall unsafe "hs_bindgen_e2c170811032a339" hs_bindgen_e2c170811032a339
  :: IO (Ptr.FunPtr ((Ptr.Ptr FC.CChar) -> IO FC.CInt))

{-# NOINLINE pcap_tstamp_type_name_to_val_ptr #-}

{-| __C declaration:__ @pcap_tstamp_type_name_to_val@

    __defined at:__ @pcap\/pcap.h:492:14@

    __exported by:__ @pcap.h@
-}
pcap_tstamp_type_name_to_val_ptr :: Ptr.FunPtr ((Ptr.Ptr FC.CChar) -> IO FC.CInt)
pcap_tstamp_type_name_to_val_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_e2c170811032a339

foreign import ccall unsafe "hs_bindgen_f7bc3be76ec31c83" hs_bindgen_f7bc3be76ec31c83
  :: IO (Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE pcap_tstamp_type_val_to_name_ptr #-}

{-| __C declaration:__ @pcap_tstamp_type_val_to_name@

    __defined at:__ @pcap\/pcap.h:495:22@

    __exported by:__ @pcap.h@
-}
pcap_tstamp_type_val_to_name_ptr :: Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar))
pcap_tstamp_type_val_to_name_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_f7bc3be76ec31c83

foreign import ccall unsafe "hs_bindgen_3cd8194a0b544cfe" hs_bindgen_3cd8194a0b544cfe
  :: IO (Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE pcap_tstamp_type_val_to_description_ptr #-}

{-| __C declaration:__ @pcap_tstamp_type_val_to_description@

    __defined at:__ @pcap\/pcap.h:498:22@

    __exported by:__ @pcap.h@
-}
pcap_tstamp_type_val_to_description_ptr :: Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar))
pcap_tstamp_type_val_to_description_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_3cd8194a0b544cfe

foreign import ccall unsafe "hs_bindgen_9532e143234c50d3" hs_bindgen_9532e143234c50d3
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt))

{-# NOINLINE pcap_set_protocol_linux_ptr #-}

{-| __C declaration:__ @pcap_set_protocol_linux@

    __defined at:__ @pcap\/pcap.h:502:14@

    __exported by:__ @pcap.h@
-}
pcap_set_protocol_linux_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt)
pcap_set_protocol_linux_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_9532e143234c50d3

foreign import ccall unsafe "hs_bindgen_ff4b085392a36137" hs_bindgen_ff4b085392a36137
  :: IO (Ptr.FunPtr ((Ptr.Ptr HsBindgen.Runtime.Prelude.CFile) -> U_int -> (Ptr.Ptr FC.CChar) -> IO (Ptr.Ptr Pcap_t)))

{-# NOINLINE pcap_fopen_offline_with_tstamp_precision_ptr #-}

{-| __C declaration:__ @pcap_fopen_offline_with_tstamp_precision@

    __defined at:__ @pcap\/pcap.h:604:20@

    __exported by:__ @pcap.h@
-}
pcap_fopen_offline_with_tstamp_precision_ptr :: Ptr.FunPtr ((Ptr.Ptr HsBindgen.Runtime.Prelude.CFile) -> U_int -> (Ptr.Ptr FC.CChar) -> IO (Ptr.Ptr Pcap_t))
pcap_fopen_offline_with_tstamp_precision_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_ff4b085392a36137

foreign import ccall unsafe "hs_bindgen_37fe9cbe3f481841" hs_bindgen_37fe9cbe3f481841
  :: IO (Ptr.FunPtr ((Ptr.Ptr HsBindgen.Runtime.Prelude.CFile) -> (Ptr.Ptr FC.CChar) -> IO (Ptr.Ptr Pcap_t)))

{-# NOINLINE pcap_fopen_offline_ptr #-}

{-| __C declaration:__ @pcap_fopen_offline@

    __defined at:__ @pcap\/pcap.h:607:20@

    __exported by:__ @pcap.h@
-}
pcap_fopen_offline_ptr :: Ptr.FunPtr ((Ptr.Ptr HsBindgen.Runtime.Prelude.CFile) -> (Ptr.Ptr FC.CChar) -> IO (Ptr.Ptr Pcap_t))
pcap_fopen_offline_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_37fe9cbe3f481841

foreign import ccall unsafe "hs_bindgen_0afa89fedf9ce7c7" hs_bindgen_0afa89fedf9ce7c7
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO ()))

{-# NOINLINE pcap_close_ptr #-}

{-| __C declaration:__ @pcap_close@

    __defined at:__ @pcap\/pcap.h:611:15@

    __exported by:__ @pcap.h@
-}
pcap_close_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO ())
pcap_close_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_0afa89fedf9ce7c7

foreign import ccall unsafe "hs_bindgen_2f5ac1526cadb9f2" hs_bindgen_2f5ac1526cadb9f2
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> Pcap_handler -> (Ptr.Ptr U_char) -> IO FC.CInt))

{-# NOINLINE pcap_loop_ptr #-}

{-| __C declaration:__ @pcap_loop@

    __defined at:__ @pcap\/pcap.h:614:14@

    __exported by:__ @pcap.h@
-}
pcap_loop_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> Pcap_handler -> (Ptr.Ptr U_char) -> IO FC.CInt)
pcap_loop_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_2f5ac1526cadb9f2

foreign import ccall unsafe "hs_bindgen_b2d427220ca414c3" hs_bindgen_b2d427220ca414c3
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> Pcap_handler -> (Ptr.Ptr U_char) -> IO FC.CInt))

{-# NOINLINE pcap_dispatch_ptr #-}

{-| __C declaration:__ @pcap_dispatch@

    __defined at:__ @pcap\/pcap.h:617:14@

    __exported by:__ @pcap.h@
-}
pcap_dispatch_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> Pcap_handler -> (Ptr.Ptr U_char) -> IO FC.CInt)
pcap_dispatch_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_b2d427220ca414c3

foreign import ccall unsafe "hs_bindgen_b4961f122a8bbdfe" hs_bindgen_b4961f122a8bbdfe
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr Pcap_pkthdr) -> IO (Ptr.Ptr U_char)))

{-# NOINLINE pcap_next_ptr #-}

{-| __C declaration:__ @pcap_next@

    __defined at:__ @pcap\/pcap.h:620:24@

    __exported by:__ @pcap.h@
-}
pcap_next_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr Pcap_pkthdr) -> IO (Ptr.Ptr U_char))
pcap_next_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_b4961f122a8bbdfe

foreign import ccall unsafe "hs_bindgen_833db108f806795e" hs_bindgen_833db108f806795e
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr (Ptr.Ptr Pcap_pkthdr)) -> (Ptr.Ptr (Ptr.Ptr U_char)) -> IO FC.CInt))

{-# NOINLINE pcap_next_ex_ptr #-}

{-| __C declaration:__ @pcap_next_ex@

    __defined at:__ @pcap\/pcap.h:623:14@

    __exported by:__ @pcap.h@
-}
pcap_next_ex_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr (Ptr.Ptr Pcap_pkthdr)) -> (Ptr.Ptr (Ptr.Ptr U_char)) -> IO FC.CInt)
pcap_next_ex_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_833db108f806795e

foreign import ccall unsafe "hs_bindgen_06aa5407028e454c" hs_bindgen_06aa5407028e454c
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO ()))

{-# NOINLINE pcap_breakloop_ptr #-}

{-| __C declaration:__ @pcap_breakloop@

    __defined at:__ @pcap\/pcap.h:626:15@

    __exported by:__ @pcap.h@
-}
pcap_breakloop_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO ())
pcap_breakloop_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_06aa5407028e454c

foreign import ccall unsafe "hs_bindgen_50953b9be5a5a998" hs_bindgen_50953b9be5a5a998
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr Pcap_stat) -> IO FC.CInt))

{-# NOINLINE pcap_stats_ptr #-}

{-| __C declaration:__ @pcap_stats@

    __defined at:__ @pcap\/pcap.h:629:14@

    __exported by:__ @pcap.h@
-}
pcap_stats_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr Pcap_stat) -> IO FC.CInt)
pcap_stats_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_50953b9be5a5a998

foreign import ccall unsafe "hs_bindgen_208f1de05bac28c1" hs_bindgen_208f1de05bac28c1
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr Bpf_program) -> IO FC.CInt))

{-# NOINLINE pcap_setfilter_ptr #-}

{-| __C declaration:__ @pcap_setfilter@

    __defined at:__ @pcap\/pcap.h:632:14@

    __exported by:__ @pcap.h@
-}
pcap_setfilter_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr Bpf_program) -> IO FC.CInt)
pcap_setfilter_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_208f1de05bac28c1

foreign import ccall unsafe "hs_bindgen_dc2cc17b816c502a" hs_bindgen_dc2cc17b816c502a
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> Pcap_direction_t -> IO FC.CInt))

{-# NOINLINE pcap_setdirection_ptr #-}

{-| __C declaration:__ @pcap_setdirection@

    __defined at:__ @pcap\/pcap.h:635:14@

    __exported by:__ @pcap.h@
-}
pcap_setdirection_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> Pcap_direction_t -> IO FC.CInt)
pcap_setdirection_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_dc2cc17b816c502a

foreign import ccall unsafe "hs_bindgen_e339ea4a31d3bffa" hs_bindgen_e339ea4a31d3bffa
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr FC.CChar) -> IO FC.CInt))

{-# NOINLINE pcap_getnonblock_ptr #-}

{-| __C declaration:__ @pcap_getnonblock@

    __defined at:__ @pcap\/pcap.h:638:14@

    __exported by:__ @pcap.h@
-}
pcap_getnonblock_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr FC.CChar) -> IO FC.CInt)
pcap_getnonblock_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_e339ea4a31d3bffa

foreign import ccall unsafe "hs_bindgen_8d966ff8382f6e4a" hs_bindgen_8d966ff8382f6e4a
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> (Ptr.Ptr FC.CChar) -> IO FC.CInt))

{-# NOINLINE pcap_setnonblock_ptr #-}

{-| __C declaration:__ @pcap_setnonblock@

    __defined at:__ @pcap\/pcap.h:641:14@

    __exported by:__ @pcap.h@
-}
pcap_setnonblock_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> (Ptr.Ptr FC.CChar) -> IO FC.CInt)
pcap_setnonblock_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_8d966ff8382f6e4a

foreign import ccall unsafe "hs_bindgen_cdd6d3f4f973ef42" hs_bindgen_cdd6d3f4f973ef42
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr Void) -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CInt))

{-# NOINLINE pcap_inject_ptr #-}

{-| __C declaration:__ @pcap_inject@

    __defined at:__ @pcap\/pcap.h:644:14@

    __exported by:__ @pcap.h@
-}
pcap_inject_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr Void) -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CInt)
pcap_inject_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_cdd6d3f4f973ef42

foreign import ccall unsafe "hs_bindgen_395d204dfa69283b" hs_bindgen_395d204dfa69283b
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr U_char) -> FC.CInt -> IO FC.CInt))

{-# NOINLINE pcap_sendpacket_ptr #-}

{-| __C declaration:__ @pcap_sendpacket@

    __defined at:__ @pcap\/pcap.h:647:14@

    __exported by:__ @pcap.h@
-}
pcap_sendpacket_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr U_char) -> FC.CInt -> IO FC.CInt)
pcap_sendpacket_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_395d204dfa69283b

foreign import ccall unsafe "hs_bindgen_76832454f4b4f404" hs_bindgen_76832454f4b4f404
  :: IO (Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE pcap_statustostr_ptr #-}

{-| __C declaration:__ @pcap_statustostr@

    __defined at:__ @pcap\/pcap.h:650:22@

    __exported by:__ @pcap.h@
-}
pcap_statustostr_ptr :: Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar))
pcap_statustostr_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_76832454f4b4f404

foreign import ccall unsafe "hs_bindgen_101f0fd627150576" hs_bindgen_101f0fd627150576
  :: IO (Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE pcap_strerror_ptr #-}

{-| __C declaration:__ @pcap_strerror@

    __defined at:__ @pcap\/pcap.h:653:22@

    __exported by:__ @pcap.h@
-}
pcap_strerror_ptr :: Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar))
pcap_strerror_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_101f0fd627150576

foreign import ccall unsafe "hs_bindgen_6baae6d1131d2841" hs_bindgen_6baae6d1131d2841
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE pcap_geterr_ptr #-}

{-| __C declaration:__ @pcap_geterr@

    __defined at:__ @pcap\/pcap.h:656:16@

    __exported by:__ @pcap.h@
-}
pcap_geterr_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO (Ptr.Ptr FC.CChar))
pcap_geterr_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_6baae6d1131d2841

foreign import ccall unsafe "hs_bindgen_c3264f7ecee1a4e1" hs_bindgen_c3264f7ecee1a4e1
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr FC.CChar) -> IO ()))

{-# NOINLINE pcap_perror_ptr #-}

{-| __C declaration:__ @pcap_perror@

    __defined at:__ @pcap\/pcap.h:659:15@

    __exported by:__ @pcap.h@
-}
pcap_perror_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr FC.CChar) -> IO ())
pcap_perror_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_c3264f7ecee1a4e1

foreign import ccall unsafe "hs_bindgen_0cb43f1a95434a9b" hs_bindgen_0cb43f1a95434a9b
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr Bpf_program) -> (Ptr.Ptr FC.CChar) -> FC.CInt -> Bpf_u_int32 -> IO FC.CInt))

{-# NOINLINE pcap_compile_ptr #-}

{-| __C declaration:__ @pcap_compile@

    __defined at:__ @pcap\/pcap.h:662:14@

    __exported by:__ @pcap.h@
-}
pcap_compile_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr Bpf_program) -> (Ptr.Ptr FC.CChar) -> FC.CInt -> Bpf_u_int32 -> IO FC.CInt)
pcap_compile_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_0cb43f1a95434a9b

foreign import ccall unsafe "hs_bindgen_d18d531694f2b835" hs_bindgen_d18d531694f2b835
  :: IO (Ptr.FunPtr ((Ptr.Ptr Bpf_program) -> IO ()))

{-# NOINLINE pcap_freecode_ptr #-}

{-| __C declaration:__ @pcap_freecode@

    __defined at:__ @pcap\/pcap.h:672:15@

    __exported by:__ @pcap.h@
-}
pcap_freecode_ptr :: Ptr.FunPtr ((Ptr.Ptr Bpf_program) -> IO ())
pcap_freecode_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_d18d531694f2b835

foreign import ccall unsafe "hs_bindgen_5bf4e2b19e19f25a" hs_bindgen_5bf4e2b19e19f25a
  :: IO (Ptr.FunPtr ((Ptr.Ptr Bpf_program) -> (Ptr.Ptr Pcap_pkthdr) -> (Ptr.Ptr U_char) -> IO FC.CInt))

{-# NOINLINE pcap_offline_filter_ptr #-}

{-| __C declaration:__ @pcap_offline_filter@

    __defined at:__ @pcap\/pcap.h:675:14@

    __exported by:__ @pcap.h@
-}
pcap_offline_filter_ptr :: Ptr.FunPtr ((Ptr.Ptr Bpf_program) -> (Ptr.Ptr Pcap_pkthdr) -> (Ptr.Ptr U_char) -> IO FC.CInt)
pcap_offline_filter_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_5bf4e2b19e19f25a

foreign import ccall unsafe "hs_bindgen_61dfc5544c2fde78" hs_bindgen_61dfc5544c2fde78
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt))

{-# NOINLINE pcap_datalink_ptr #-}

{-| __C declaration:__ @pcap_datalink@

    __defined at:__ @pcap\/pcap.h:679:14@

    __exported by:__ @pcap.h@
-}
pcap_datalink_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt)
pcap_datalink_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_61dfc5544c2fde78

foreign import ccall unsafe "hs_bindgen_1b2619df65b5b3ee" hs_bindgen_1b2619df65b5b3ee
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt))

{-# NOINLINE pcap_datalink_ext_ptr #-}

{-| __C declaration:__ @pcap_datalink_ext@

    __defined at:__ @pcap\/pcap.h:682:14@

    __exported by:__ @pcap.h@
-}
pcap_datalink_ext_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt)
pcap_datalink_ext_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_1b2619df65b5b3ee

foreign import ccall unsafe "hs_bindgen_05e3d6319aa8f2a4" hs_bindgen_05e3d6319aa8f2a4
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr (Ptr.Ptr FC.CInt)) -> IO FC.CInt))

{-# NOINLINE pcap_list_datalinks_ptr #-}

{-| __C declaration:__ @pcap_list_datalinks@

    __defined at:__ @pcap\/pcap.h:685:14@

    __exported by:__ @pcap.h@
-}
pcap_list_datalinks_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr (Ptr.Ptr FC.CInt)) -> IO FC.CInt)
pcap_list_datalinks_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_05e3d6319aa8f2a4

foreign import ccall unsafe "hs_bindgen_a8c6ba3a8d6d651d" hs_bindgen_a8c6ba3a8d6d651d
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt))

{-# NOINLINE pcap_set_datalink_ptr #-}

{-| __C declaration:__ @pcap_set_datalink@

    __defined at:__ @pcap\/pcap.h:688:14@

    __exported by:__ @pcap.h@
-}
pcap_set_datalink_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> FC.CInt -> IO FC.CInt)
pcap_set_datalink_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_a8c6ba3a8d6d651d

foreign import ccall unsafe "hs_bindgen_fc8b37ae1690f7f9" hs_bindgen_fc8b37ae1690f7f9
  :: IO (Ptr.FunPtr ((Ptr.Ptr FC.CInt) -> IO ()))

{-# NOINLINE pcap_free_datalinks_ptr #-}

{-| __C declaration:__ @pcap_free_datalinks@

    __defined at:__ @pcap\/pcap.h:691:15@

    __exported by:__ @pcap.h@
-}
pcap_free_datalinks_ptr :: Ptr.FunPtr ((Ptr.Ptr FC.CInt) -> IO ())
pcap_free_datalinks_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_fc8b37ae1690f7f9

foreign import ccall unsafe "hs_bindgen_73d68e2612df3218" hs_bindgen_73d68e2612df3218
  :: IO (Ptr.FunPtr ((Ptr.Ptr FC.CChar) -> IO FC.CInt))

{-# NOINLINE pcap_datalink_name_to_val_ptr #-}

{-| __C declaration:__ @pcap_datalink_name_to_val@

    __defined at:__ @pcap\/pcap.h:694:14@

    __exported by:__ @pcap.h@
-}
pcap_datalink_name_to_val_ptr :: Ptr.FunPtr ((Ptr.Ptr FC.CChar) -> IO FC.CInt)
pcap_datalink_name_to_val_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_73d68e2612df3218

foreign import ccall unsafe "hs_bindgen_884caae9390f3685" hs_bindgen_884caae9390f3685
  :: IO (Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE pcap_datalink_val_to_name_ptr #-}

{-| __C declaration:__ @pcap_datalink_val_to_name@

    __defined at:__ @pcap\/pcap.h:697:22@

    __exported by:__ @pcap.h@
-}
pcap_datalink_val_to_name_ptr :: Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar))
pcap_datalink_val_to_name_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_884caae9390f3685

foreign import ccall unsafe "hs_bindgen_931d101bba7a1a3e" hs_bindgen_931d101bba7a1a3e
  :: IO (Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE pcap_datalink_val_to_description_ptr #-}

{-| __C declaration:__ @pcap_datalink_val_to_description@

    __defined at:__ @pcap\/pcap.h:700:22@

    __exported by:__ @pcap.h@
-}
pcap_datalink_val_to_description_ptr :: Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar))
pcap_datalink_val_to_description_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_931d101bba7a1a3e

foreign import ccall unsafe "hs_bindgen_792692e870ac4d7f" hs_bindgen_792692e870ac4d7f
  :: IO (Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE pcap_datalink_val_to_description_or_dlt_ptr #-}

{-| __C declaration:__ @pcap_datalink_val_to_description_or_dlt@

    __defined at:__ @pcap\/pcap.h:703:22@

    __exported by:__ @pcap.h@
-}
pcap_datalink_val_to_description_or_dlt_ptr :: Ptr.FunPtr (FC.CInt -> IO (Ptr.Ptr FC.CChar))
pcap_datalink_val_to_description_or_dlt_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_792692e870ac4d7f

foreign import ccall unsafe "hs_bindgen_e0a8b93e6a9bdfa1" hs_bindgen_e0a8b93e6a9bdfa1
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt))

{-# NOINLINE pcap_snapshot_ptr #-}

{-| __C declaration:__ @pcap_snapshot@

    __defined at:__ @pcap\/pcap.h:706:14@

    __exported by:__ @pcap.h@
-}
pcap_snapshot_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt)
pcap_snapshot_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_e0a8b93e6a9bdfa1

foreign import ccall unsafe "hs_bindgen_72cc7fd923e2ef61" hs_bindgen_72cc7fd923e2ef61
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt))

{-# NOINLINE pcap_is_swapped_ptr #-}

{-| __C declaration:__ @pcap_is_swapped@

    __defined at:__ @pcap\/pcap.h:709:14@

    __exported by:__ @pcap.h@
-}
pcap_is_swapped_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt)
pcap_is_swapped_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_72cc7fd923e2ef61

foreign import ccall unsafe "hs_bindgen_ec71d4a33c4444e9" hs_bindgen_ec71d4a33c4444e9
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt))

{-# NOINLINE pcap_major_version_ptr #-}

{-| __C declaration:__ @pcap_major_version@

    __defined at:__ @pcap\/pcap.h:712:14@

    __exported by:__ @pcap.h@
-}
pcap_major_version_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt)
pcap_major_version_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_ec71d4a33c4444e9

foreign import ccall unsafe "hs_bindgen_e3018d0f6e09266e" hs_bindgen_e3018d0f6e09266e
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt))

{-# NOINLINE pcap_minor_version_ptr #-}

{-| __C declaration:__ @pcap_minor_version@

    __defined at:__ @pcap\/pcap.h:715:14@

    __exported by:__ @pcap.h@
-}
pcap_minor_version_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt)
pcap_minor_version_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_e3018d0f6e09266e

foreign import ccall unsafe "hs_bindgen_1f3e7e82a1611ba2" hs_bindgen_1f3e7e82a1611ba2
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt))

{-# NOINLINE pcap_bufsize_ptr #-}

{-| __C declaration:__ @pcap_bufsize@

    __defined at:__ @pcap\/pcap.h:718:14@

    __exported by:__ @pcap.h@
-}
pcap_bufsize_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt)
pcap_bufsize_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_1f3e7e82a1611ba2

foreign import ccall unsafe "hs_bindgen_2e081edce226c54d" hs_bindgen_2e081edce226c54d
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO (Ptr.Ptr HsBindgen.Runtime.Prelude.CFile)))

{-# NOINLINE pcap_file_ptr #-}

{-| __C declaration:__ @pcap_file@

    __defined at:__ @pcap\/pcap.h:722:16@

    __exported by:__ @pcap.h@
-}
pcap_file_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO (Ptr.Ptr HsBindgen.Runtime.Prelude.CFile))
pcap_file_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_2e081edce226c54d

foreign import ccall unsafe "hs_bindgen_ac33f3891a8e3080" hs_bindgen_ac33f3891a8e3080
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt))

{-# NOINLINE pcap_fileno_ptr #-}

{-| __C declaration:__ @pcap_fileno@

    __defined at:__ @pcap\/pcap.h:737:14@

    __exported by:__ @pcap.h@
-}
pcap_fileno_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt)
pcap_fileno_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_ac33f3891a8e3080

foreign import ccall unsafe "hs_bindgen_5470e636c5bc7048" hs_bindgen_5470e636c5bc7048
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr FC.CChar) -> IO (Ptr.Ptr Pcap_dumper_t)))

{-# NOINLINE pcap_dump_open_ptr #-}

{-| __C declaration:__ @pcap_dump_open@

    __defined at:__ @pcap\/pcap.h:745:25@

    __exported by:__ @pcap.h@
-}
pcap_dump_open_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr FC.CChar) -> IO (Ptr.Ptr Pcap_dumper_t))
pcap_dump_open_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_5470e636c5bc7048

foreign import ccall unsafe "hs_bindgen_051c9cc3a951c89b" hs_bindgen_051c9cc3a951c89b
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CFile) -> IO (Ptr.Ptr Pcap_dumper_t)))

{-# NOINLINE pcap_dump_fopen_ptr #-}

{-| __C declaration:__ @pcap_dump_fopen@

    __defined at:__ @pcap\/pcap.h:770:27@

    __exported by:__ @pcap.h@
-}
pcap_dump_fopen_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CFile) -> IO (Ptr.Ptr Pcap_dumper_t))
pcap_dump_fopen_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_051c9cc3a951c89b

foreign import ccall unsafe "hs_bindgen_9e396a9a5d440076" hs_bindgen_9e396a9a5d440076
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr FC.CChar) -> IO (Ptr.Ptr Pcap_dumper_t)))

{-# NOINLINE pcap_dump_open_append_ptr #-}

{-| __C declaration:__ @pcap_dump_open_append@

    __defined at:__ @pcap\/pcap.h:774:25@

    __exported by:__ @pcap.h@
-}
pcap_dump_open_append_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> (Ptr.Ptr FC.CChar) -> IO (Ptr.Ptr Pcap_dumper_t))
pcap_dump_open_append_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_9e396a9a5d440076

foreign import ccall unsafe "hs_bindgen_fdf7af9a910a286d" hs_bindgen_fdf7af9a910a286d
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_dumper_t) -> IO (Ptr.Ptr HsBindgen.Runtime.Prelude.CFile)))

{-# NOINLINE pcap_dump_file_ptr #-}

{-| __C declaration:__ @pcap_dump_file@

    __defined at:__ @pcap\/pcap.h:777:16@

    __exported by:__ @pcap.h@
-}
pcap_dump_file_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_dumper_t) -> IO (Ptr.Ptr HsBindgen.Runtime.Prelude.CFile))
pcap_dump_file_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_fdf7af9a910a286d

foreign import ccall unsafe "hs_bindgen_da20c4a6f44a9bc9" hs_bindgen_da20c4a6f44a9bc9
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_dumper_t) -> IO FC.CLong))

{-# NOINLINE pcap_dump_ftell_ptr #-}

{-| __C declaration:__ @pcap_dump_ftell@

    __defined at:__ @pcap\/pcap.h:780:15@

    __exported by:__ @pcap.h@
-}
pcap_dump_ftell_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_dumper_t) -> IO FC.CLong)
pcap_dump_ftell_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_da20c4a6f44a9bc9

foreign import ccall unsafe "hs_bindgen_4927d639a70d7f33" hs_bindgen_4927d639a70d7f33
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_dumper_t) -> IO HsBindgen.Runtime.Prelude.Int64))

{-# NOINLINE pcap_dump_ftell64_ptr #-}

{-| __C declaration:__ @pcap_dump_ftell64@

    __defined at:__ @pcap\/pcap.h:783:18@

    __exported by:__ @pcap.h@
-}
pcap_dump_ftell64_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_dumper_t) -> IO HsBindgen.Runtime.Prelude.Int64)
pcap_dump_ftell64_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_4927d639a70d7f33

foreign import ccall unsafe "hs_bindgen_6876213450a757a5" hs_bindgen_6876213450a757a5
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_dumper_t) -> IO FC.CInt))

{-# NOINLINE pcap_dump_flush_ptr #-}

{-| __C declaration:__ @pcap_dump_flush@

    __defined at:__ @pcap\/pcap.h:786:14@

    __exported by:__ @pcap.h@
-}
pcap_dump_flush_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_dumper_t) -> IO FC.CInt)
pcap_dump_flush_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_6876213450a757a5

foreign import ccall unsafe "hs_bindgen_d07f05d261ad218d" hs_bindgen_d07f05d261ad218d
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_dumper_t) -> IO ()))

{-# NOINLINE pcap_dump_close_ptr #-}

{-| __C declaration:__ @pcap_dump_close@

    __defined at:__ @pcap\/pcap.h:789:15@

    __exported by:__ @pcap.h@
-}
pcap_dump_close_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_dumper_t) -> IO ())
pcap_dump_close_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_d07f05d261ad218d

foreign import ccall unsafe "hs_bindgen_ff7ec52b14c62df5" hs_bindgen_ff7ec52b14c62df5
  :: IO (Ptr.FunPtr ((Ptr.Ptr U_char) -> (Ptr.Ptr Pcap_pkthdr) -> (Ptr.Ptr U_char) -> IO ()))

{-# NOINLINE pcap_dump_ptr #-}

{-| __C declaration:__ @pcap_dump@

    __defined at:__ @pcap\/pcap.h:792:15@

    __exported by:__ @pcap.h@
-}
pcap_dump_ptr :: Ptr.FunPtr ((Ptr.Ptr U_char) -> (Ptr.Ptr Pcap_pkthdr) -> (Ptr.Ptr U_char) -> IO ())
pcap_dump_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_ff7ec52b14c62df5

foreign import ccall unsafe "hs_bindgen_50133d2a0332f6d8" hs_bindgen_50133d2a0332f6d8
  :: IO (Ptr.FunPtr ((Ptr.Ptr (Ptr.Ptr Pcap_if_t)) -> (Ptr.Ptr FC.CChar) -> IO FC.CInt))

{-# NOINLINE pcap_findalldevs_ptr #-}

{-| __C declaration:__ @pcap_findalldevs@

    __defined at:__ @pcap\/pcap.h:795:14@

    __exported by:__ @pcap.h@
-}
pcap_findalldevs_ptr :: Ptr.FunPtr ((Ptr.Ptr (Ptr.Ptr Pcap_if_t)) -> (Ptr.Ptr FC.CChar) -> IO FC.CInt)
pcap_findalldevs_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_50133d2a0332f6d8

foreign import ccall unsafe "hs_bindgen_472cbbaa41de590c" hs_bindgen_472cbbaa41de590c
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_if_t) -> IO ()))

{-# NOINLINE pcap_freealldevs_ptr #-}

{-| __C declaration:__ @pcap_freealldevs@

    __defined at:__ @pcap\/pcap.h:798:15@

    __exported by:__ @pcap.h@
-}
pcap_freealldevs_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_if_t) -> IO ())
pcap_freealldevs_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_472cbbaa41de590c

foreign import ccall unsafe "hs_bindgen_87738d2a0be678a8" hs_bindgen_87738d2a0be678a8
  :: IO (Ptr.FunPtr (IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE pcap_lib_version_ptr #-}

{-| __C declaration:__ @pcap_lib_version@

    __defined at:__ @pcap\/pcap.h:816:22@

    __exported by:__ @pcap.h@
-}
pcap_lib_version_ptr :: Ptr.FunPtr (IO (Ptr.Ptr FC.CChar))
pcap_lib_version_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_87738d2a0be678a8

foreign import ccall unsafe "hs_bindgen_daa57bba73ca0a86" hs_bindgen_daa57bba73ca0a86
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt))

{-# NOINLINE pcap_get_selectable_fd_ptr #-}

{-| __C declaration:__ @pcap_get_selectable_fd@

    __defined at:__ @pcap\/pcap.h:898:16@

    __exported by:__ @pcap.h@
-}
pcap_get_selectable_fd_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO FC.CInt)
pcap_get_selectable_fd_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_daa57bba73ca0a86

foreign import ccall unsafe "hs_bindgen_2c0c8181a1f9260c" hs_bindgen_2c0c8181a1f9260c
  :: IO (Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO (Ptr.Ptr Timeval)))

{-# NOINLINE pcap_get_required_select_timeout_ptr #-}

{-| __C declaration:__ @pcap_get_required_select_timeout@

    __defined at:__ @pcap\/pcap.h:901:34@

    __exported by:__ @pcap.h@
-}
pcap_get_required_select_timeout_ptr :: Ptr.FunPtr ((Ptr.Ptr Pcap_t) -> IO (Ptr.Ptr Timeval))
pcap_get_required_select_timeout_ptr =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_2c0c8181a1f9260c
