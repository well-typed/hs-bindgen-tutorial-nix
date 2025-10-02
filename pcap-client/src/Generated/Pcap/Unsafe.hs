{-# LANGUAGE CApiFFI #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_HADDOCK prune #-}

module Generated.Pcap.Unsafe where

import qualified Foreign.C as FC
import qualified GHC.Ptr as Ptr
import qualified HsBindgen.Runtime.Prelude
import Data.Void (Void)
import Generated.Pcap
import Prelude (IO)

$(HsBindgen.Runtime.Prelude.addCSource "#include <pcap.h>\nsigned int hs_bindgen_e703e637ea845fa0 (unsigned int arg1, char *arg2) { return pcap_init(arg1, arg2); }\nsigned int hs_bindgen_7b98de6a3544c926 (char const *arg1, bpf_u_int32 *arg2, bpf_u_int32 *arg3, char *arg4) { return pcap_lookupnet(arg1, arg2, arg3, arg4); }\npcap_t *hs_bindgen_0e7fe14b35fcd33e (char const *arg1, char *arg2) { return pcap_create(arg1, arg2); }\nsigned int hs_bindgen_db130a3a10404ce0 (pcap_t *arg1, signed int arg2) { return pcap_set_snaplen(arg1, arg2); }\nsigned int hs_bindgen_34f09dce7c4842ad (pcap_t *arg1, signed int arg2) { return pcap_set_promisc(arg1, arg2); }\nsigned int hs_bindgen_6516581ca0809e4e (pcap_t *arg1) { return pcap_can_set_rfmon(arg1); }\nsigned int hs_bindgen_91d91580f724d08f (pcap_t *arg1, signed int arg2) { return pcap_set_rfmon(arg1, arg2); }\nsigned int hs_bindgen_66c36331e1ecdeb7 (pcap_t *arg1, signed int arg2) { return pcap_set_timeout(arg1, arg2); }\nsigned int hs_bindgen_478823a3bde4f17d (pcap_t *arg1, signed int arg2) { return pcap_set_tstamp_type(arg1, arg2); }\nsigned int hs_bindgen_a6a1a6eb1e64e45e (pcap_t *arg1, signed int arg2) { return pcap_set_immediate_mode(arg1, arg2); }\nsigned int hs_bindgen_5e249f0f7d16c1d8 (pcap_t *arg1, signed int arg2) { return pcap_set_buffer_size(arg1, arg2); }\nsigned int hs_bindgen_545eeda6e6273893 (pcap_t *arg1, signed int arg2) { return pcap_set_tstamp_precision(arg1, arg2); }\nsigned int hs_bindgen_b71f1cb3451ae1ae (pcap_t *arg1) { return pcap_get_tstamp_precision(arg1); }\nsigned int hs_bindgen_d5c43fa433cd5b52 (pcap_t *arg1) { return pcap_activate(arg1); }\nsigned int hs_bindgen_71978cdea916a6da (pcap_t *arg1, signed int **arg2) { return pcap_list_tstamp_types(arg1, arg2); }\nvoid hs_bindgen_25d07bc58896173a (signed int *arg1) { pcap_free_tstamp_types(arg1); }\nsigned int hs_bindgen_3eea4801c99f13d2 (char const *arg1) { return pcap_tstamp_type_name_to_val(arg1); }\nchar const *hs_bindgen_09b369560c247f5b (signed int arg1) { return pcap_tstamp_type_val_to_name(arg1); }\nchar const *hs_bindgen_6a141b2921268fbb (signed int arg1) { return pcap_tstamp_type_val_to_description(arg1); }\nsigned int hs_bindgen_1427c2982c5c3824 (pcap_t *arg1, signed int arg2) { return pcap_set_protocol_linux(arg1, arg2); }\npcap_t *hs_bindgen_44af3f48905a2a00 (FILE *arg1, u_int arg2, char *arg3) { return pcap_fopen_offline_with_tstamp_precision(arg1, arg2, arg3); }\npcap_t *hs_bindgen_2d286db7aab57c54 (FILE *arg1, char *arg2) { return pcap_fopen_offline(arg1, arg2); }\nvoid hs_bindgen_b481f473d5c53cf0 (pcap_t *arg1) { pcap_close(arg1); }\nsigned int hs_bindgen_2a219f9ddd145ce0 (pcap_t *arg1, signed int arg2, pcap_handler arg3, u_char *arg4) { return pcap_loop(arg1, arg2, arg3, arg4); }\nsigned int hs_bindgen_ca1b624e78182095 (pcap_t *arg1, signed int arg2, pcap_handler arg3, u_char *arg4) { return pcap_dispatch(arg1, arg2, arg3, arg4); }\nu_char const *hs_bindgen_68eeadcfca23a740 (pcap_t *arg1, struct pcap_pkthdr *arg2) { return pcap_next(arg1, arg2); }\nsigned int hs_bindgen_6435ee005fda3db5 (pcap_t *arg1, struct pcap_pkthdr **arg2, u_char const **arg3) { return pcap_next_ex(arg1, arg2, arg3); }\nvoid hs_bindgen_8f85879f819d1a59 (pcap_t *arg1) { pcap_breakloop(arg1); }\nsigned int hs_bindgen_35248b7d57b0ea2e (pcap_t *arg1, struct pcap_stat *arg2) { return pcap_stats(arg1, arg2); }\nsigned int hs_bindgen_a0320ea12634931d (pcap_t *arg1, struct bpf_program *arg2) { return pcap_setfilter(arg1, arg2); }\nsigned int hs_bindgen_c51ed080c9aed498 (pcap_t *arg1, pcap_direction_t arg2) { return pcap_setdirection(arg1, arg2); }\nsigned int hs_bindgen_7a38f8b9fc95ce91 (pcap_t *arg1, char *arg2) { return pcap_getnonblock(arg1, arg2); }\nsigned int hs_bindgen_2ace94e854eb91d0 (pcap_t *arg1, signed int arg2, char *arg3) { return pcap_setnonblock(arg1, arg2, arg3); }\nsigned int hs_bindgen_cc186e32f260d0b7 (pcap_t *arg1, void const *arg2, size_t arg3) { return pcap_inject(arg1, arg2, arg3); }\nsigned int hs_bindgen_dd6c3fde20ab2818 (pcap_t *arg1, u_char const *arg2, signed int arg3) { return pcap_sendpacket(arg1, arg2, arg3); }\nchar const *hs_bindgen_ed03d33be96c9acd (signed int arg1) { return pcap_statustostr(arg1); }\nchar const *hs_bindgen_660b458a445e12b0 (signed int arg1) { return pcap_strerror(arg1); }\nchar *hs_bindgen_4567c8e749f9dde2 (pcap_t *arg1) { return pcap_geterr(arg1); }\nvoid hs_bindgen_c722b81d0bbcb50f (pcap_t *arg1, char const *arg2) { pcap_perror(arg1, arg2); }\nsigned int hs_bindgen_6a50600acc6936e7 (pcap_t *arg1, struct bpf_program *arg2, char const *arg3, signed int arg4, bpf_u_int32 arg5) { return pcap_compile(arg1, arg2, arg3, arg4, arg5); }\nvoid hs_bindgen_2c07d83d4d9f196e (struct bpf_program *arg1) { pcap_freecode(arg1); }\nsigned int hs_bindgen_6975c0e764a61342 (struct bpf_program const *arg1, struct pcap_pkthdr const *arg2, u_char const *arg3) { return pcap_offline_filter(arg1, arg2, arg3); }\nsigned int hs_bindgen_82cb8c4a90d6cff4 (pcap_t *arg1) { return pcap_datalink(arg1); }\nsigned int hs_bindgen_fb267a93efc729ff (pcap_t *arg1) { return pcap_datalink_ext(arg1); }\nsigned int hs_bindgen_981ae784bd74f98a (pcap_t *arg1, signed int **arg2) { return pcap_list_datalinks(arg1, arg2); }\nsigned int hs_bindgen_b8acb1921bf5b53f (pcap_t *arg1, signed int arg2) { return pcap_set_datalink(arg1, arg2); }\nvoid hs_bindgen_d2e501d1b50907de (signed int *arg1) { pcap_free_datalinks(arg1); }\nsigned int hs_bindgen_a4eb6661dbc37714 (char const *arg1) { return pcap_datalink_name_to_val(arg1); }\nchar const *hs_bindgen_798b5cbc854fd556 (signed int arg1) { return pcap_datalink_val_to_name(arg1); }\nchar const *hs_bindgen_65a994522820c988 (signed int arg1) { return pcap_datalink_val_to_description(arg1); }\nchar const *hs_bindgen_9740b419d588d805 (signed int arg1) { return pcap_datalink_val_to_description_or_dlt(arg1); }\nsigned int hs_bindgen_f63c245fece37f0b (pcap_t *arg1) { return pcap_snapshot(arg1); }\nsigned int hs_bindgen_f4ed5266aa541a6c (pcap_t *arg1) { return pcap_is_swapped(arg1); }\nsigned int hs_bindgen_dd35c3ef2d7bc266 (pcap_t *arg1) { return pcap_major_version(arg1); }\nsigned int hs_bindgen_1e067f5961719b6b (pcap_t *arg1) { return pcap_minor_version(arg1); }\nsigned int hs_bindgen_2be4868308caf0ed (pcap_t *arg1) { return pcap_bufsize(arg1); }\nFILE *hs_bindgen_7920b7d5a05861de (pcap_t *arg1) { return pcap_file(arg1); }\nsigned int hs_bindgen_5b8367ffbec07529 (pcap_t *arg1) { return pcap_fileno(arg1); }\npcap_dumper_t *hs_bindgen_0980f84cfd79065f (pcap_t *arg1, char const *arg2) { return pcap_dump_open(arg1, arg2); }\npcap_dumper_t *hs_bindgen_ddaa043ae0f59ebe (pcap_t *arg1, FILE *arg2) { return pcap_dump_fopen(arg1, arg2); }\npcap_dumper_t *hs_bindgen_f7ff387882bfe855 (pcap_t *arg1, char const *arg2) { return pcap_dump_open_append(arg1, arg2); }\nFILE *hs_bindgen_8f58636412ff72b1 (pcap_dumper_t *arg1) { return pcap_dump_file(arg1); }\nsigned long hs_bindgen_19cfd43f1e5efc92 (pcap_dumper_t *arg1) { return pcap_dump_ftell(arg1); }\nint64_t hs_bindgen_bcf0ca4a90e8ca4d (pcap_dumper_t *arg1) { return pcap_dump_ftell64(arg1); }\nsigned int hs_bindgen_260bafba350fadb4 (pcap_dumper_t *arg1) { return pcap_dump_flush(arg1); }\nvoid hs_bindgen_2c2cc91d4496d1b1 (pcap_dumper_t *arg1) { pcap_dump_close(arg1); }\nvoid hs_bindgen_1c61bc818f5516b8 (u_char *arg1, struct pcap_pkthdr const *arg2, u_char const *arg3) { pcap_dump(arg1, arg2, arg3); }\nsigned int hs_bindgen_fa3d2b40d58aee94 (pcap_if_t **arg1, char *arg2) { return pcap_findalldevs(arg1, arg2); }\nvoid hs_bindgen_e0f46d008d62e0ad (pcap_if_t *arg1) { pcap_freealldevs(arg1); }\nchar const *hs_bindgen_1847ce5f4b312856 (void) { return pcap_lib_version(); }\nsigned int hs_bindgen_5358366084707a83 (pcap_t *arg1) { return pcap_get_selectable_fd(arg1); }\nstruct timeval const *hs_bindgen_6cbece482c4448f6 (pcap_t *arg1) { return pcap_get_required_select_timeout(arg1); }\n")

{-| __C declaration:__ @pcap_init@

    __defined at:__ @pcap\/pcap.h:435:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_e703e637ea845fa0" pcap_init
  :: FC.CUInt
  -> Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_lookupnet@

    __defined at:__ @pcap\/pcap.h:447:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_7b98de6a3544c926" pcap_lookupnet
  :: Ptr.Ptr FC.CChar
  -> Ptr.Ptr Bpf_u_int32
  -> Ptr.Ptr Bpf_u_int32
  -> Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_create@

    __defined at:__ @pcap\/pcap.h:450:18@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_0e7fe14b35fcd33e" pcap_create
  :: Ptr.Ptr FC.CChar
  -> Ptr.Ptr FC.CChar
  -> IO (Ptr.Ptr Pcap_t)

{-| __C declaration:__ @pcap_set_snaplen@

    __defined at:__ @pcap\/pcap.h:453:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_db130a3a10404ce0" pcap_set_snaplen
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_promisc@

    __defined at:__ @pcap\/pcap.h:456:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_34f09dce7c4842ad" pcap_set_promisc
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_can_set_rfmon@

    __defined at:__ @pcap\/pcap.h:459:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_6516581ca0809e4e" pcap_can_set_rfmon
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_rfmon@

    __defined at:__ @pcap\/pcap.h:462:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_91d91580f724d08f" pcap_set_rfmon
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_timeout@

    __defined at:__ @pcap\/pcap.h:465:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_66c36331e1ecdeb7" pcap_set_timeout
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_tstamp_type@

    __defined at:__ @pcap\/pcap.h:468:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_478823a3bde4f17d" pcap_set_tstamp_type
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_immediate_mode@

    __defined at:__ @pcap\/pcap.h:471:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_a6a1a6eb1e64e45e" pcap_set_immediate_mode
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_buffer_size@

    __defined at:__ @pcap\/pcap.h:474:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_5e249f0f7d16c1d8" pcap_set_buffer_size
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_tstamp_precision@

    __defined at:__ @pcap\/pcap.h:477:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_545eeda6e6273893" pcap_set_tstamp_precision
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_get_tstamp_precision@

    __defined at:__ @pcap\/pcap.h:480:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_b71f1cb3451ae1ae" pcap_get_tstamp_precision
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_activate@

    __defined at:__ @pcap\/pcap.h:483:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_d5c43fa433cd5b52" pcap_activate
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_list_tstamp_types@

    __defined at:__ @pcap\/pcap.h:486:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_71978cdea916a6da" pcap_list_tstamp_types
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr (Ptr.Ptr FC.CInt)
  -> IO FC.CInt

{-| __C declaration:__ @pcap_free_tstamp_types@

    __defined at:__ @pcap\/pcap.h:489:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_25d07bc58896173a" pcap_free_tstamp_types
  :: Ptr.Ptr FC.CInt
  -> IO ()

{-| __C declaration:__ @pcap_tstamp_type_name_to_val@

    __defined at:__ @pcap\/pcap.h:492:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_3eea4801c99f13d2" pcap_tstamp_type_name_to_val
  :: Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_tstamp_type_val_to_name@

    __defined at:__ @pcap\/pcap.h:495:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_09b369560c247f5b" pcap_tstamp_type_val_to_name
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_tstamp_type_val_to_description@

    __defined at:__ @pcap\/pcap.h:498:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_6a141b2921268fbb" pcap_tstamp_type_val_to_description
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_set_protocol_linux@

    __defined at:__ @pcap\/pcap.h:502:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_1427c2982c5c3824" pcap_set_protocol_linux
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_fopen_offline_with_tstamp_precision@

    __defined at:__ @pcap\/pcap.h:604:20@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_44af3f48905a2a00" pcap_fopen_offline_with_tstamp_precision
  :: Ptr.Ptr HsBindgen.Runtime.Prelude.CFile
  -> U_int
  -> Ptr.Ptr FC.CChar
  -> IO (Ptr.Ptr Pcap_t)

{-| __C declaration:__ @pcap_fopen_offline@

    __defined at:__ @pcap\/pcap.h:607:20@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_2d286db7aab57c54" pcap_fopen_offline
  :: Ptr.Ptr HsBindgen.Runtime.Prelude.CFile
  -> Ptr.Ptr FC.CChar
  -> IO (Ptr.Ptr Pcap_t)

{-| __C declaration:__ @pcap_close@

    __defined at:__ @pcap\/pcap.h:611:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_b481f473d5c53cf0" pcap_close
  :: Ptr.Ptr Pcap_t
  -> IO ()

{-| __C declaration:__ @pcap_loop@

    __defined at:__ @pcap\/pcap.h:614:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_2a219f9ddd145ce0" pcap_loop
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> Pcap_handler
  -> Ptr.Ptr U_char
  -> IO FC.CInt

{-| __C declaration:__ @pcap_dispatch@

    __defined at:__ @pcap\/pcap.h:617:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_ca1b624e78182095" pcap_dispatch
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> Pcap_handler
  -> Ptr.Ptr U_char
  -> IO FC.CInt

{-| __C declaration:__ @pcap_next@

    __defined at:__ @pcap\/pcap.h:620:24@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_68eeadcfca23a740" pcap_next
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr Pcap_pkthdr
  -> IO (Ptr.Ptr U_char)

{-| __C declaration:__ @pcap_next_ex@

    __defined at:__ @pcap\/pcap.h:623:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_6435ee005fda3db5" pcap_next_ex
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr (Ptr.Ptr Pcap_pkthdr)
  -> Ptr.Ptr (Ptr.Ptr U_char)
  -> IO FC.CInt

{-| __C declaration:__ @pcap_breakloop@

    __defined at:__ @pcap\/pcap.h:626:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_8f85879f819d1a59" pcap_breakloop
  :: Ptr.Ptr Pcap_t
  -> IO ()

{-| __C declaration:__ @pcap_stats@

    __defined at:__ @pcap\/pcap.h:629:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_35248b7d57b0ea2e" pcap_stats
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr Pcap_stat
  -> IO FC.CInt

{-| __C declaration:__ @pcap_setfilter@

    __defined at:__ @pcap\/pcap.h:632:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_a0320ea12634931d" pcap_setfilter
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr Bpf_program
  -> IO FC.CInt

{-| __C declaration:__ @pcap_setdirection@

    __defined at:__ @pcap\/pcap.h:635:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_c51ed080c9aed498" pcap_setdirection
  :: Ptr.Ptr Pcap_t
  -> Pcap_direction_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_getnonblock@

    __defined at:__ @pcap\/pcap.h:638:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_7a38f8b9fc95ce91" pcap_getnonblock
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_setnonblock@

    __defined at:__ @pcap\/pcap.h:641:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_2ace94e854eb91d0" pcap_setnonblock
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_inject@

    __defined at:__ @pcap\/pcap.h:644:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_cc186e32f260d0b7" pcap_inject
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr Void
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CInt

{-| __C declaration:__ @pcap_sendpacket@

    __defined at:__ @pcap\/pcap.h:647:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_dd6c3fde20ab2818" pcap_sendpacket
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr U_char
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_statustostr@

    __defined at:__ @pcap\/pcap.h:650:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_ed03d33be96c9acd" pcap_statustostr
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_strerror@

    __defined at:__ @pcap\/pcap.h:653:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_660b458a445e12b0" pcap_strerror
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_geterr@

    __defined at:__ @pcap\/pcap.h:656:16@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_4567c8e749f9dde2" pcap_geterr
  :: Ptr.Ptr Pcap_t
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_perror@

    __defined at:__ @pcap\/pcap.h:659:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_c722b81d0bbcb50f" pcap_perror
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr FC.CChar
  -> IO ()

{-| __C declaration:__ @pcap_compile@

    __defined at:__ @pcap\/pcap.h:662:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_6a50600acc6936e7" pcap_compile
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
foreign import ccall unsafe "hs_bindgen_2c07d83d4d9f196e" pcap_freecode
  :: Ptr.Ptr Bpf_program
  -> IO ()

{-| __C declaration:__ @pcap_offline_filter@

    __defined at:__ @pcap\/pcap.h:675:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_6975c0e764a61342" pcap_offline_filter
  :: Ptr.Ptr Bpf_program
  -> Ptr.Ptr Pcap_pkthdr
  -> Ptr.Ptr U_char
  -> IO FC.CInt

{-| __C declaration:__ @pcap_datalink@

    __defined at:__ @pcap\/pcap.h:679:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_82cb8c4a90d6cff4" pcap_datalink
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_datalink_ext@

    __defined at:__ @pcap\/pcap.h:682:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_fb267a93efc729ff" pcap_datalink_ext
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_list_datalinks@

    __defined at:__ @pcap\/pcap.h:685:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_981ae784bd74f98a" pcap_list_datalinks
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr (Ptr.Ptr FC.CInt)
  -> IO FC.CInt

{-| __C declaration:__ @pcap_set_datalink@

    __defined at:__ @pcap\/pcap.h:688:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_b8acb1921bf5b53f" pcap_set_datalink
  :: Ptr.Ptr Pcap_t
  -> FC.CInt
  -> IO FC.CInt

{-| __C declaration:__ @pcap_free_datalinks@

    __defined at:__ @pcap\/pcap.h:691:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_d2e501d1b50907de" pcap_free_datalinks
  :: Ptr.Ptr FC.CInt
  -> IO ()

{-| __C declaration:__ @pcap_datalink_name_to_val@

    __defined at:__ @pcap\/pcap.h:694:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_a4eb6661dbc37714" pcap_datalink_name_to_val
  :: Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_datalink_val_to_name@

    __defined at:__ @pcap\/pcap.h:697:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_798b5cbc854fd556" pcap_datalink_val_to_name
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_datalink_val_to_description@

    __defined at:__ @pcap\/pcap.h:700:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_65a994522820c988" pcap_datalink_val_to_description
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_datalink_val_to_description_or_dlt@

    __defined at:__ @pcap\/pcap.h:703:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_9740b419d588d805" pcap_datalink_val_to_description_or_dlt
  :: FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_snapshot@

    __defined at:__ @pcap\/pcap.h:706:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_f63c245fece37f0b" pcap_snapshot
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_is_swapped@

    __defined at:__ @pcap\/pcap.h:709:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_f4ed5266aa541a6c" pcap_is_swapped
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_major_version@

    __defined at:__ @pcap\/pcap.h:712:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_dd35c3ef2d7bc266" pcap_major_version
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_minor_version@

    __defined at:__ @pcap\/pcap.h:715:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_1e067f5961719b6b" pcap_minor_version
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_bufsize@

    __defined at:__ @pcap\/pcap.h:718:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_2be4868308caf0ed" pcap_bufsize
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_file@

    __defined at:__ @pcap\/pcap.h:722:16@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_7920b7d5a05861de" pcap_file
  :: Ptr.Ptr Pcap_t
  -> IO (Ptr.Ptr HsBindgen.Runtime.Prelude.CFile)

{-| __C declaration:__ @pcap_fileno@

    __defined at:__ @pcap\/pcap.h:737:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_5b8367ffbec07529" pcap_fileno
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_dump_open@

    __defined at:__ @pcap\/pcap.h:745:25@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_0980f84cfd79065f" pcap_dump_open
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr FC.CChar
  -> IO (Ptr.Ptr Pcap_dumper_t)

{-| __C declaration:__ @pcap_dump_fopen@

    __defined at:__ @pcap\/pcap.h:770:27@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_ddaa043ae0f59ebe" pcap_dump_fopen
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CFile
     {- ^ __C declaration:__ @fp@
     -}
  -> IO (Ptr.Ptr Pcap_dumper_t)

{-| __C declaration:__ @pcap_dump_open_append@

    __defined at:__ @pcap\/pcap.h:774:25@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_f7ff387882bfe855" pcap_dump_open_append
  :: Ptr.Ptr Pcap_t
  -> Ptr.Ptr FC.CChar
  -> IO (Ptr.Ptr Pcap_dumper_t)

{-| __C declaration:__ @pcap_dump_file@

    __defined at:__ @pcap\/pcap.h:777:16@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_8f58636412ff72b1" pcap_dump_file
  :: Ptr.Ptr Pcap_dumper_t
  -> IO (Ptr.Ptr HsBindgen.Runtime.Prelude.CFile)

{-| __C declaration:__ @pcap_dump_ftell@

    __defined at:__ @pcap\/pcap.h:780:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_19cfd43f1e5efc92" pcap_dump_ftell
  :: Ptr.Ptr Pcap_dumper_t
  -> IO FC.CLong

{-| __C declaration:__ @pcap_dump_ftell64@

    __defined at:__ @pcap\/pcap.h:783:18@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_bcf0ca4a90e8ca4d" pcap_dump_ftell64
  :: Ptr.Ptr Pcap_dumper_t
  -> IO HsBindgen.Runtime.Prelude.Int64

{-| __C declaration:__ @pcap_dump_flush@

    __defined at:__ @pcap\/pcap.h:786:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_260bafba350fadb4" pcap_dump_flush
  :: Ptr.Ptr Pcap_dumper_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_dump_close@

    __defined at:__ @pcap\/pcap.h:789:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_2c2cc91d4496d1b1" pcap_dump_close
  :: Ptr.Ptr Pcap_dumper_t
  -> IO ()

{-| __C declaration:__ @pcap_dump@

    __defined at:__ @pcap\/pcap.h:792:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_1c61bc818f5516b8" pcap_dump
  :: Ptr.Ptr U_char
  -> Ptr.Ptr Pcap_pkthdr
  -> Ptr.Ptr U_char
  -> IO ()

{-| __C declaration:__ @pcap_findalldevs@

    __defined at:__ @pcap\/pcap.h:795:14@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_fa3d2b40d58aee94" pcap_findalldevs
  :: Ptr.Ptr (Ptr.Ptr Pcap_if_t)
  -> Ptr.Ptr FC.CChar
  -> IO FC.CInt

{-| __C declaration:__ @pcap_freealldevs@

    __defined at:__ @pcap\/pcap.h:798:15@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_e0f46d008d62e0ad" pcap_freealldevs
  :: Ptr.Ptr Pcap_if_t
  -> IO ()

{-| __C declaration:__ @pcap_lib_version@

    __defined at:__ @pcap\/pcap.h:816:22@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_1847ce5f4b312856" pcap_lib_version
  :: IO (Ptr.Ptr FC.CChar)

{-| __C declaration:__ @pcap_get_selectable_fd@

    __defined at:__ @pcap\/pcap.h:898:16@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_5358366084707a83" pcap_get_selectable_fd
  :: Ptr.Ptr Pcap_t
  -> IO FC.CInt

{-| __C declaration:__ @pcap_get_required_select_timeout@

    __defined at:__ @pcap\/pcap.h:901:34@

    __exported by:__ @pcap.h@
-}
foreign import ccall unsafe "hs_bindgen_6cbece482c4448f6" pcap_get_required_select_timeout
  :: Ptr.Ptr Pcap_t
  -> IO (Ptr.Ptr Timeval)
