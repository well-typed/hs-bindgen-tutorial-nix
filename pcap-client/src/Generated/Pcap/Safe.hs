{-# LANGUAGE CApiFFI #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_HADDOCK prune #-}

module Generated.Pcap.Safe where

import qualified Foreign.C as FC
import qualified GHC.Ptr as Ptr
import qualified HsBindgen.Runtime.Prelude
import Data.Void (Void)
import Generated.Pcap
import Prelude (IO)

$(HsBindgen.Runtime.Prelude.addCSource "#include <pcap.h>\nsigned int hs_bindgen_edb7a1f53a842cb9 (unsigned int arg1, char *arg2) { return pcap_init(arg1, arg2); }\nsigned int hs_bindgen_e99751d688b27fd7 (char const *arg1, bpf_u_int32 *arg2, bpf_u_int32 *arg3, char *arg4) { return pcap_lookupnet(arg1, arg2, arg3, arg4); }\npcap_t *hs_bindgen_ecb9b849434400ca (char const *arg1, char *arg2) { return pcap_create(arg1, arg2); }\nsigned int hs_bindgen_1b920911d41c42a3 (pcap_t *arg1, signed int arg2) { return pcap_set_snaplen(arg1, arg2); }\nsigned int hs_bindgen_0609a5aef670ab3b (pcap_t *arg1, signed int arg2) { return pcap_set_promisc(arg1, arg2); }\nsigned int hs_bindgen_c39efdf1a800a4cd (pcap_t *arg1) { return pcap_can_set_rfmon(arg1); }\nsigned int hs_bindgen_86a370208a7e94aa (pcap_t *arg1, signed int arg2) { return pcap_set_rfmon(arg1, arg2); }\nsigned int hs_bindgen_9985fba951a0270d (pcap_t *arg1, signed int arg2) { return pcap_set_timeout(arg1, arg2); }\nsigned int hs_bindgen_3830aa2ff5148f40 (pcap_t *arg1, signed int arg2) { return pcap_set_tstamp_type(arg1, arg2); }\nsigned int hs_bindgen_a3a6b00ff39bb864 (pcap_t *arg1, signed int arg2) { return pcap_set_immediate_mode(arg1, arg2); }\nsigned int hs_bindgen_ba958c6c1d114d2a (pcap_t *arg1, signed int arg2) { return pcap_set_buffer_size(arg1, arg2); }\nsigned int hs_bindgen_e1c0a3ae52b97205 (pcap_t *arg1, signed int arg2) { return pcap_set_tstamp_precision(arg1, arg2); }\nsigned int hs_bindgen_9454b9335aa605f4 (pcap_t *arg1) { return pcap_get_tstamp_precision(arg1); }\nsigned int hs_bindgen_14b2af049fae6591 (pcap_t *arg1) { return pcap_activate(arg1); }\nsigned int hs_bindgen_b2c88dc4e8ccaaed (pcap_t *arg1, signed int **arg2) { return pcap_list_tstamp_types(arg1, arg2); }\nvoid hs_bindgen_a30cee0a68105ad5 (signed int *arg1) { pcap_free_tstamp_types(arg1); }\nsigned int hs_bindgen_0e6704db4b553e37 (char const *arg1) { return pcap_tstamp_type_name_to_val(arg1); }\nchar const *hs_bindgen_3f8b62137b97cc48 (signed int arg1) { return pcap_tstamp_type_val_to_name(arg1); }\nchar const *hs_bindgen_1794c25613264f0f (signed int arg1) { return pcap_tstamp_type_val_to_description(arg1); }\nsigned int hs_bindgen_8077a0dd2a8f37a6 (pcap_t *arg1, signed int arg2) { return pcap_set_protocol_linux(arg1, arg2); }\npcap_t *hs_bindgen_1442cd9e3bbbb1ec (FILE *arg1, u_int arg2, char *arg3) { return pcap_fopen_offline_with_tstamp_precision(arg1, arg2, arg3); }\npcap_t *hs_bindgen_7192fb5674730115 (FILE *arg1, char *arg2) { return pcap_fopen_offline(arg1, arg2); }\nvoid hs_bindgen_31ddeb378248bd28 (pcap_t *arg1) { pcap_close(arg1); }\nsigned int hs_bindgen_99821325b8f5de70 (pcap_t *arg1, signed int arg2, pcap_handler arg3, u_char *arg4) { return pcap_loop(arg1, arg2, arg3, arg4); }\nsigned int hs_bindgen_ba443f40cb125e21 (pcap_t *arg1, signed int arg2, pcap_handler arg3, u_char *arg4) { return pcap_dispatch(arg1, arg2, arg3, arg4); }\nu_char const *hs_bindgen_28f5a556e007db1f (pcap_t *arg1, struct pcap_pkthdr *arg2) { return pcap_next(arg1, arg2); }\nsigned int hs_bindgen_d91bac7465d8909b (pcap_t *arg1, struct pcap_pkthdr **arg2, u_char const **arg3) { return pcap_next_ex(arg1, arg2, arg3); }\nvoid hs_bindgen_fdc47d8ce5b07be3 (pcap_t *arg1) { pcap_breakloop(arg1); }\nsigned int hs_bindgen_b93f742678b0d86f (pcap_t *arg1, struct pcap_stat *arg2) { return pcap_stats(arg1, arg2); }\nsigned int hs_bindgen_00bfe50e6eaa4e55 (pcap_t *arg1, struct bpf_program *arg2) { return pcap_setfilter(arg1, arg2); }\nsigned int hs_bindgen_de26905735bed5fb (pcap_t *arg1, pcap_direction_t arg2) { return pcap_setdirection(arg1, arg2); }\nsigned int hs_bindgen_11e072f8ac1a0807 (pcap_t *arg1, char *arg2) { return pcap_getnonblock(arg1, arg2); }\nsigned int hs_bindgen_ff9adc945da2657a (pcap_t *arg1, signed int arg2, char *arg3) { return pcap_setnonblock(arg1, arg2, arg3); }\nsigned int hs_bindgen_6fbb078d25ddc76e (pcap_t *arg1, void const *arg2, size_t arg3) { return pcap_inject(arg1, arg2, arg3); }\nsigned int hs_bindgen_6db78db7eef66406 (pcap_t *arg1, u_char const *arg2, signed int arg3) { return pcap_sendpacket(arg1, arg2, arg3); }\nchar const *hs_bindgen_6dc329e6e65de0c5 (signed int arg1) { return pcap_statustostr(arg1); }\nchar const *hs_bindgen_2ed77f098820ec98 (signed int arg1) { return pcap_strerror(arg1); }\nchar *hs_bindgen_139fcaf277b3171c (pcap_t *arg1) { return pcap_geterr(arg1); }\nvoid hs_bindgen_09b623c3e8962d45 (pcap_t *arg1, char const *arg2) { pcap_perror(arg1, arg2); }\nsigned int hs_bindgen_7df49de69bcacbd4 (pcap_t *arg1, struct bpf_program *arg2, char const *arg3, signed int arg4, bpf_u_int32 arg5) { return pcap_compile(arg1, arg2, arg3, arg4, arg5); }\nvoid hs_bindgen_5484e0f3a8257092 (struct bpf_program *arg1) { pcap_freecode(arg1); }\nsigned int hs_bindgen_ce275ae708052d53 (struct bpf_program const *arg1, struct pcap_pkthdr const *arg2, u_char const *arg3) { return pcap_offline_filter(arg1, arg2, arg3); }\nsigned int hs_bindgen_6f763b387a4a2a41 (pcap_t *arg1) { return pcap_datalink(arg1); }\nsigned int hs_bindgen_286597931eefcb44 (pcap_t *arg1) { return pcap_datalink_ext(arg1); }\nsigned int hs_bindgen_304c75bea77cf483 (pcap_t *arg1, signed int **arg2) { return pcap_list_datalinks(arg1, arg2); }\nsigned int hs_bindgen_376d4f17a05c9780 (pcap_t *arg1, signed int arg2) { return pcap_set_datalink(arg1, arg2); }\nvoid hs_bindgen_17c7b71756aa2dc0 (signed int *arg1) { pcap_free_datalinks(arg1); }\nsigned int hs_bindgen_147f2d2ae20c1a43 (char const *arg1) { return pcap_datalink_name_to_val(arg1); }\nchar const *hs_bindgen_c05bed67e9190116 (signed int arg1) { return pcap_datalink_val_to_name(arg1); }\nchar const *hs_bindgen_50e47e7a9e41bb63 (signed int arg1) { return pcap_datalink_val_to_description(arg1); }\nchar const *hs_bindgen_73808a0d8769abe7 (signed int arg1) { return pcap_datalink_val_to_description_or_dlt(arg1); }\nsigned int hs_bindgen_7c036e5e0356c127 (pcap_t *arg1) { return pcap_snapshot(arg1); }\nsigned int hs_bindgen_88fc796ea4ee6d0f (pcap_t *arg1) { return pcap_is_swapped(arg1); }\nsigned int hs_bindgen_860354f47b19d6ea (pcap_t *arg1) { return pcap_major_version(arg1); }\nsigned int hs_bindgen_d730cccbceea4805 (pcap_t *arg1) { return pcap_minor_version(arg1); }\nsigned int hs_bindgen_1392739e6e030e38 (pcap_t *arg1) { return pcap_bufsize(arg1); }\nFILE *hs_bindgen_8ff8a775c042f209 (pcap_t *arg1) { return pcap_file(arg1); }\nsigned int hs_bindgen_9b2006a7b4ff75cd (pcap_t *arg1) { return pcap_fileno(arg1); }\npcap_dumper_t *hs_bindgen_65bdde3b2404206e (pcap_t *arg1, char const *arg2) { return pcap_dump_open(arg1, arg2); }\npcap_dumper_t *hs_bindgen_f6eedb2f45750a63 (pcap_t *arg1, FILE *arg2) { return pcap_dump_fopen(arg1, arg2); }\npcap_dumper_t *hs_bindgen_8e7b5e4d42896ac9 (pcap_t *arg1, char const *arg2) { return pcap_dump_open_append(arg1, arg2); }\nFILE *hs_bindgen_414b2666701f81cf (pcap_dumper_t *arg1) { return pcap_dump_file(arg1); }\nsigned long hs_bindgen_d6662193026fcaf9 (pcap_dumper_t *arg1) { return pcap_dump_ftell(arg1); }\nint64_t hs_bindgen_2939e1d9a5049528 (pcap_dumper_t *arg1) { return pcap_dump_ftell64(arg1); }\nsigned int hs_bindgen_3106d09bf10f988f (pcap_dumper_t *arg1) { return pcap_dump_flush(arg1); }\nvoid hs_bindgen_a974ef083eb79107 (pcap_dumper_t *arg1) { pcap_dump_close(arg1); }\nvoid hs_bindgen_945573599bb24ab5 (u_char *arg1, struct pcap_pkthdr const *arg2, u_char const *arg3) { pcap_dump(arg1, arg2, arg3); }\nsigned int hs_bindgen_dbc5429347bc6fb6 (pcap_if_t **arg1, char *arg2) { return pcap_findalldevs(arg1, arg2); }\nvoid hs_bindgen_7816685971531c8e (pcap_if_t *arg1) { pcap_freealldevs(arg1); }\nchar const *hs_bindgen_d19125a0d4e229f1 (void) { return pcap_lib_version(); }\nsigned int hs_bindgen_142551b3666a344d (pcap_t *arg1) { return pcap_get_selectable_fd(arg1); }\nstruct timeval const *hs_bindgen_aba29d1e95378732 (pcap_t *arg1) { return pcap_get_required_select_timeout(arg1); }\n")

{-| __C declaration:__ @pcap_init@

    __defined at:__ @pcap\/pcap.h:435:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_edb7a1f53a842cb9" pcap_init
  :: FC.CUInt
  -> Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_lookupnet@

    __defined at:__ @pcap\/pcap.h:447:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_e99751d688b27fd7" pcap_lookupnet
  :: Ptr.Ptr FC.CChar
  -> Ptr.Ptr Bpf_u_int32
  -> Ptr.Ptr Bpf_u_int32
  -> Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_create@

    __defined at:__ @pcap\/pcap.h:450:18@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_ecb9b849434400ca" pcap_create
  :: Ptr.Ptr FC.CChar
  -> Ptr.Ptr FC.CChar
  -> IO (Ptr.Ptr Pcap_t)

{-| __C declaration:__ @pcap_set_snaplen@

    __defined at:__ @pcap\/pcap.h:453:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_1b920911d41c42a3" pcap_set_snaplen
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_promisc@

    __defined at:__ @pcap\/pcap.h:456:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_0609a5aef670ab3b" pcap_set_promisc
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_can_set_rfmon@

    __defined at:__ @pcap\/pcap.h:459:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_c39efdf1a800a4cd" pcap_can_set_rfmon
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_rfmon@

    __defined at:__ @pcap\/pcap.h:462:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_86a370208a7e94aa" pcap_set_rfmon
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_timeout@

    __defined at:__ @pcap\/pcap.h:465:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_9985fba951a0270d" pcap_set_timeout
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_tstamp_type@

    __defined at:__ @pcap\/pcap.h:468:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_3830aa2ff5148f40" pcap_set_tstamp_type
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_immediate_mode@

    __defined at:__ @pcap\/pcap.h:471:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_a3a6b00ff39bb864" pcap_set_immediate_mode
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_buffer_size@

    __defined at:__ @pcap\/pcap.h:474:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_ba958c6c1d114d2a" pcap_set_buffer_size
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_tstamp_precision@

    __defined at:__ @pcap\/pcap.h:477:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_e1c0a3ae52b97205" pcap_set_tstamp_precision
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_get_tstamp_precision@

    __defined at:__ @pcap\/pcap.h:480:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_9454b9335aa605f4" pcap_get_tstamp_precision
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_activate@

    __defined at:__ @pcap\/pcap.h:483:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_14b2af049fae6591" pcap_activate
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_list_tstamp_types@

    __defined at:__ @pcap\/pcap.h:486:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_b2c88dc4e8ccaaed" pcap_list_tstamp_types
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr (Ptr.Ptr FC.CInt)
  -> IO FC.CInt

{-| __C declaration:__ @pcap_free_tstamp_types@

    __defined at:__ @pcap\/pcap.h:489:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_a30cee0a68105ad5" pcap_free_tstamp_types
  :: Ptr.Ptr FC.CInt
  -> IO ()

{-| __C declaration:__ @pcap_tstamp_type_name_to_val@

    __defined at:__ @pcap\/pcap.h:492:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_0e6704db4b553e37" pcap_tstamp_type_name_to_val
  :: Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_tstamp_type_val_to_name@

    __defined at:__ @pcap\/pcap.h:495:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_3f8b62137b97cc48" pcap_tstamp_type_val_to_name
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_tstamp_type_val_to_description@

    __defined at:__ @pcap\/pcap.h:498:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_1794c25613264f0f" pcap_tstamp_type_val_to_description
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_set_protocol_linux@

    __defined at:__ @pcap\/pcap.h:502:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_8077a0dd2a8f37a6" pcap_set_protocol_linux
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_fopen_offline_with_tstamp_precision@

    __defined at:__ @pcap\/pcap.h:604:20@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_1442cd9e3bbbb1ec" pcap_fopen_offline_with_tstamp_precision
  :: Ptr.Ptr HsBindgen.Runtime.Prelude.CFile
  -> U_int
  -> Ptr.Ptr FC.CChar
  -> IO (Ptr.Ptr Pcap_t)

{-| __C declaration:__ @pcap_fopen_offline@

    __defined at:__ @pcap\/pcap.h:607:20@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_7192fb5674730115" pcap_fopen_offline
  :: Ptr.Ptr HsBindgen.Runtime.Prelude.CFile
  -> Ptr.Ptr FC.CChar
  -> IO (Ptr.Ptr Pcap_t)

{-| __C declaration:__ @pcap_close@

    __defined at:__ @pcap\/pcap.h:611:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_31ddeb378248bd28" pcap_close
  :: Ptr.Ptr Pcap_t
  -> IO ()

{-| __C declaration:__ @pcap_loop@

    __defined at:__ @pcap\/pcap.h:614:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_99821325b8f5de70" pcap_loop
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> Pcap_handler
  -> Ptr.Ptr U_char
  -> IO FC.CInt

{-| __C declaration:__ @pcap_dispatch@

    __defined at:__ @pcap\/pcap.h:617:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_ba443f40cb125e21" pcap_dispatch
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> Pcap_handler
  -> Ptr.Ptr U_char
  -> IO FC.CInt

{-| __C declaration:__ @pcap_next@

    __defined at:__ @pcap\/pcap.h:620:24@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_28f5a556e007db1f" pcap_next
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr Pcap_pkthdr
  -> IO (Ptr.Ptr U_char)

{-| __C declaration:__ @pcap_next_ex@

    __defined at:__ @pcap\/pcap.h:623:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_d91bac7465d8909b" pcap_next_ex
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr (Ptr.Ptr Pcap_pkthdr)
  -> Ptr.Ptr (Ptr.Ptr U_char)
  -> IO FC.CInt

{-| __C declaration:__ @pcap_breakloop@

    __defined at:__ @pcap\/pcap.h:626:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_fdc47d8ce5b07be3" pcap_breakloop
  :: Ptr.Ptr Pcap_t
  -> IO ()

{-| __C declaration:__ @pcap_stats@

    __defined at:__ @pcap\/pcap.h:629:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_b93f742678b0d86f" pcap_stats
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr Pcap_stat
  -> IO FC.CInt

{-| __C declaration:__ @pcap_setfilter@

    __defined at:__ @pcap\/pcap.h:632:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_00bfe50e6eaa4e55" pcap_setfilter
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr Bpf_program
  -> IO FC.CInt

{-| __C declaration:__ @pcap_setdirection@

    __defined at:__ @pcap\/pcap.h:635:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_de26905735bed5fb" pcap_setdirection
  :: Ptr.Ptr Pcap_t
  -> Pcap_direction_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_getnonblock@

    __defined at:__ @pcap\/pcap.h:638:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_11e072f8ac1a0807" pcap_getnonblock
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_setnonblock@

    __defined at:__ @pcap\/pcap.h:641:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_ff9adc945da2657a" pcap_setnonblock
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_inject@

    __defined at:__ @pcap\/pcap.h:644:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_6fbb078d25ddc76e" pcap_inject
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr Void
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CInt

{-| __C declaration:__ @pcap_sendpacket@

    __defined at:__ @pcap\/pcap.h:647:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_6db78db7eef66406" pcap_sendpacket
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr U_char
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_statustostr@

    __defined at:__ @pcap\/pcap.h:650:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_6dc329e6e65de0c5" pcap_statustostr
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_strerror@

    __defined at:__ @pcap\/pcap.h:653:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_2ed77f098820ec98" pcap_strerror
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_geterr@

    __defined at:__ @pcap\/pcap.h:656:16@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_139fcaf277b3171c" pcap_geterr
  :: Ptr.Ptr Pcap_t
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_perror@

    __defined at:__ @pcap\/pcap.h:659:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_09b623c3e8962d45" pcap_perror
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr FC.CChar
  -> IO ()

{-| __C declaration:__ @pcap_compile@

    __defined at:__ @pcap\/pcap.h:662:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_7df49de69bcacbd4" pcap_compile
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr Bpf_program
  -> Ptr.Ptr FC.CChar
  -> FC.CInt
  -> Bpf_u_int32
  -> IO FC.CInt

{-| __C declaration:__ @pcap_freecode@

    __defined at:__ @pcap\/pcap.h:672:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_5484e0f3a8257092" pcap_freecode
  :: Ptr.Ptr Bpf_program
  -> IO ()

{-| __C declaration:__ @pcap_offline_filter@

    __defined at:__ @pcap\/pcap.h:675:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_ce275ae708052d53" pcap_offline_filter
  :: Ptr.Ptr Bpf_program
  -> Ptr.Ptr Pcap_pkthdr
  -> Ptr.Ptr U_char
  -> IO FC.CInt

{-| __C declaration:__ @pcap_datalink@

    __defined at:__ @pcap\/pcap.h:679:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_6f763b387a4a2a41" pcap_datalink
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_datalink_ext@

    __defined at:__ @pcap\/pcap.h:682:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_286597931eefcb44" pcap_datalink_ext
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_list_datalinks@

    __defined at:__ @pcap\/pcap.h:685:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_304c75bea77cf483" pcap_list_datalinks
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr (Ptr.Ptr FC.CInt)
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_datalink@

    __defined at:__ @pcap\/pcap.h:688:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_376d4f17a05c9780" pcap_set_datalink
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_free_datalinks@

    __defined at:__ @pcap\/pcap.h:691:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_17c7b71756aa2dc0" pcap_free_datalinks
  :: Ptr.Ptr FC.CInt
  -> IO ()

{-| __C declaration:__ @pcap_datalink_name_to_val@

    __defined at:__ @pcap\/pcap.h:694:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_147f2d2ae20c1a43" pcap_datalink_name_to_val
  :: Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_datalink_val_to_name@

    __defined at:__ @pcap\/pcap.h:697:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_c05bed67e9190116" pcap_datalink_val_to_name
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_datalink_val_to_description@

    __defined at:__ @pcap\/pcap.h:700:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_50e47e7a9e41bb63" pcap_datalink_val_to_description
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_datalink_val_to_description_or_dlt@

    __defined at:__ @pcap\/pcap.h:703:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_73808a0d8769abe7" pcap_datalink_val_to_description_or_dlt
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_snapshot@

    __defined at:__ @pcap\/pcap.h:706:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_7c036e5e0356c127" pcap_snapshot
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_is_swapped@

    __defined at:__ @pcap\/pcap.h:709:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_88fc796ea4ee6d0f" pcap_is_swapped
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_major_version@

    __defined at:__ @pcap\/pcap.h:712:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_860354f47b19d6ea" pcap_major_version
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_minor_version@

    __defined at:__ @pcap\/pcap.h:715:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_d730cccbceea4805" pcap_minor_version
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_bufsize@

    __defined at:__ @pcap\/pcap.h:718:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_1392739e6e030e38" pcap_bufsize
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_file@

    __defined at:__ @pcap\/pcap.h:722:16@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_8ff8a775c042f209" pcap_file
  :: Ptr.Ptr Pcap_t
  -> IO (Ptr.Ptr HsBindgen.Runtime.Prelude.CFile)

{-| __C declaration:__ @pcap_fileno@

    __defined at:__ @pcap\/pcap.h:737:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_9b2006a7b4ff75cd" pcap_fileno
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_dump_open@

    __defined at:__ @pcap\/pcap.h:745:25@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_65bdde3b2404206e" pcap_dump_open
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr FC.CChar
  -> IO (Ptr.Ptr Pcap_dumper_t)

{-| __C declaration:__ @pcap_dump_fopen@

    __defined at:__ @pcap\/pcap.h:770:27@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_f6eedb2f45750a63" pcap_dump_fopen
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CFile
     {- ^ __C declaration:__ @fp@
     -}
  -> IO (Ptr.Ptr Pcap_dumper_t)

{-| __C declaration:__ @pcap_dump_open_append@

    __defined at:__ @pcap\/pcap.h:774:25@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_8e7b5e4d42896ac9" pcap_dump_open_append
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr FC.CChar
  -> IO (Ptr.Ptr Pcap_dumper_t)

{-| __C declaration:__ @pcap_dump_file@

    __defined at:__ @pcap\/pcap.h:777:16@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_414b2666701f81cf" pcap_dump_file
  :: Ptr.Ptr Pcap_dumper_t
  -> IO (Ptr.Ptr HsBindgen.Runtime.Prelude.CFile)

{-| __C declaration:__ @pcap_dump_ftell@

    __defined at:__ @pcap\/pcap.h:780:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_d6662193026fcaf9" pcap_dump_ftell
  :: Ptr.Ptr Pcap_dumper_t
  -> IO FC.CLong

{-| __C declaration:__ @pcap_dump_ftell64@

    __defined at:__ @pcap\/pcap.h:783:18@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_2939e1d9a5049528" pcap_dump_ftell64
  :: Ptr.Ptr Pcap_dumper_t
  -> IO HsBindgen.Runtime.Prelude.Int64

{-| __C declaration:__ @pcap_dump_flush@

    __defined at:__ @pcap\/pcap.h:786:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_3106d09bf10f988f" pcap_dump_flush
  :: Ptr.Ptr Pcap_dumper_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_dump_close@

    __defined at:__ @pcap\/pcap.h:789:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_a974ef083eb79107" pcap_dump_close
  :: Ptr.Ptr Pcap_dumper_t
  -> IO ()

{-| __C declaration:__ @pcap_dump@

    __defined at:__ @pcap\/pcap.h:792:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_945573599bb24ab5" pcap_dump
  :: Ptr.Ptr U_char
  -> Ptr.Ptr Pcap_pkthdr
  -> Ptr.Ptr U_char
  -> IO ()

{-| __C declaration:__ @pcap_findalldevs@

    __defined at:__ @pcap\/pcap.h:795:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_dbc5429347bc6fb6" pcap_findalldevs
  :: Ptr.Ptr (Ptr.Ptr Pcap_if_t)
  -> Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_freealldevs@

    __defined at:__ @pcap\/pcap.h:798:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_7816685971531c8e" pcap_freealldevs
  :: Ptr.Ptr Pcap_if_t
  -> IO ()

{-| __C declaration:__ @pcap_lib_version@

    __defined at:__ @pcap\/pcap.h:816:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_d19125a0d4e229f1" pcap_lib_version
  :: IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_get_selectable_fd@

    __defined at:__ @pcap\/pcap.h:898:16@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_142551b3666a344d" pcap_get_selectable_fd
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_get_required_select_timeout@

    __defined at:__ @pcap\/pcap.h:901:34@

    __exported by:__ @pcap.h@
-}
foreign import ccall safe "hs_bindgen_aba29d1e95378732" pcap_get_required_select_timeout
  :: Ptr.Ptr Pcap_t
  -> IO (Ptr.Ptr Timeval)
