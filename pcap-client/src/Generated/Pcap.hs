{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TypeFamilies #-}

module Generated.Pcap where

import qualified C.Expr.HostPlatform as C
import qualified Data.Bits as Bits
import qualified Data.Ix as Ix
import qualified Data.List.NonEmpty
import qualified Foreign as F
import qualified Foreign.C as FC
import qualified GHC.Ptr as Ptr
import qualified HsBindgen.Runtime.CEnum
import qualified HsBindgen.Runtime.ConstantArray
import qualified Text.Read
import Data.Bits (FiniteBits)
import Prelude ((<*>), (>>), Bounded, Enum, Eq, IO, Int, Integral, Num, Ord, Read, Real, Show, pure, showsPrec)

{-| __C declaration:__ @sa_family_t@

    __defined at:__ @bits\/sockaddr.h:28:28@

    __exported by:__ @pcap.h@
-}
newtype Sa_family_t = Sa_family_t
  { un_Sa_family_t :: FC.CUShort
  }
  deriving stock (Eq, Ord, Read, Show)
  deriving newtype (F.Storable, Bits.Bits, Bounded, Enum, FiniteBits, Integral, Ix.Ix, Num, Real)

{-| __C declaration:__ @__u_char@

    __defined at:__ @bits\/types.h:31:23@

    __exported by:__ @pcap.h@
-}
newtype C__U_char = C__U_char
  { un_C__U_char :: FC.CUChar
  }
  deriving stock (Eq, Ord, Read, Show)
  deriving newtype (F.Storable, Bits.Bits, Bounded, Enum, FiniteBits, Integral, Ix.Ix, Num, Real)

{-| __C declaration:__ @__u_short@

    __defined at:__ @bits\/types.h:32:28@

    __exported by:__ @pcap.h@
-}
newtype C__U_short = C__U_short
  { un_C__U_short :: FC.CUShort
  }
  deriving stock (Eq, Ord, Read, Show)
  deriving newtype (F.Storable, Bits.Bits, Bounded, Enum, FiniteBits, Integral, Ix.Ix, Num, Real)

{-| __C declaration:__ @__u_int@

    __defined at:__ @bits\/types.h:33:22@

    __exported by:__ @pcap.h@
-}
newtype C__U_int = C__U_int
  { un_C__U_int :: FC.CUInt
  }
  deriving stock (Eq, Ord, Read, Show)
  deriving newtype (F.Storable, Bits.Bits, Bounded, Enum, FiniteBits, Integral, Ix.Ix, Num, Real)

{-| __C declaration:__ @__time_t@

    __defined at:__ @bits\/types.h:160:26@

    __exported by:__ @pcap.h@
-}
newtype C__Time_t = C__Time_t
  { un_C__Time_t :: FC.CLong
  }
  deriving stock (Eq, Ord, Read, Show)
  deriving newtype (F.Storable, Bits.Bits, Bounded, Enum, FiniteBits, Integral, Ix.Ix, Num, Real)

{-| __C declaration:__ @__suseconds_t@

    __defined at:__ @bits\/types.h:162:31@

    __exported by:__ @pcap.h@
-}
newtype C__Suseconds_t = C__Suseconds_t
  { un_C__Suseconds_t :: FC.CLong
  }
  deriving stock (Eq, Ord, Read, Show)
  deriving newtype (F.Storable, Bits.Bits, Bounded, Enum, FiniteBits, Integral, Ix.Ix, Num, Real)

{-| __C declaration:__ @timeval@

    __defined at:__ @bits\/types\/struct_timeval.h:8:8@

    __exported by:__ @pcap.h@
-}
data Timeval = Timeval
  { timeval_tv_sec :: C__Time_t
    {- ^ __C declaration:__ @tv_sec@

         __defined at:__ @bits\/types\/struct_timeval.h:14:12@

         __exported by:__ @pcap.h@
    -}
  , timeval_tv_usec :: C__Suseconds_t
    {- ^ __C declaration:__ @tv_usec@

         __defined at:__ @bits\/types\/struct_timeval.h:15:17@

         __exported by:__ @pcap.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable Timeval where

  sizeOf = \_ -> (16 :: Int)

  alignment = \_ -> (8 :: Int)

  peek =
    \ptr0 ->
          pure Timeval
      <*> F.peekByteOff ptr0 (0 :: Int)
      <*> F.peekByteOff ptr0 (8 :: Int)

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          Timeval timeval_tv_sec2 timeval_tv_usec3 ->
               F.pokeByteOff ptr0 (0 :: Int) timeval_tv_sec2
            >> F.pokeByteOff ptr0 (8 :: Int) timeval_tv_usec3

{-| __C declaration:__ @u_char@

    __defined at:__ @sys\/types.h:33:18@

    __exported by:__ @pcap.h@
-}
newtype U_char = U_char
  { un_U_char :: C__U_char
  }
  deriving stock (Eq, Ord, Read, Show)
  deriving newtype (F.Storable, Bits.Bits, Bounded, Enum, FiniteBits, Integral, Ix.Ix, Num, Real)

{-| __C declaration:__ @u_short@

    __defined at:__ @sys\/types.h:34:19@

    __exported by:__ @pcap.h@
-}
newtype U_short = U_short
  { un_U_short :: C__U_short
  }
  deriving stock (Eq, Ord, Read, Show)
  deriving newtype (F.Storable, Bits.Bits, Bounded, Enum, FiniteBits, Integral, Ix.Ix, Num, Real)

{-| __C declaration:__ @u_int@

    __defined at:__ @sys\/types.h:35:17@

    __exported by:__ @pcap.h@
-}
newtype U_int = U_int
  { un_U_int :: C__U_int
  }
  deriving stock (Eq, Ord, Read, Show)
  deriving newtype (F.Storable, Bits.Bits, Bounded, Enum, FiniteBits, Integral, Ix.Ix, Num, Real)

{-| __C declaration:__ @sockaddr@

    __defined at:__ @bits\/socket.h:184:39@

    __exported by:__ @pcap.h@
-}
data Sockaddr = Sockaddr
  { sockaddr_sa_family :: Sa_family_t
    {- ^ __C declaration:__ @sa_family@

         __defined at:__ @bits\/socket.h:186:5@

         __exported by:__ @pcap.h@
    -}
  , sockaddr_sa_data :: (HsBindgen.Runtime.ConstantArray.ConstantArray 14) FC.CChar
    {- ^ __C declaration:__ @sa_data@

         __defined at:__ @bits\/socket.h:187:10@

         __exported by:__ @pcap.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable Sockaddr where

  sizeOf = \_ -> (16 :: Int)

  alignment = \_ -> (2 :: Int)

  peek =
    \ptr0 ->
          pure Sockaddr
      <*> F.peekByteOff ptr0 (0 :: Int)
      <*> F.peekByteOff ptr0 (2 :: Int)

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          Sockaddr sockaddr_sa_family2 sockaddr_sa_data3 ->
               F.pokeByteOff ptr0 (0 :: Int) sockaddr_sa_family2
            >> F.pokeByteOff ptr0 (2 :: Int) sockaddr_sa_data3

{-| __C declaration:__ @bpf_int32@

    __defined at:__ @pcap\/bpf.h:96:13@

    __exported by:__ @pcap.h@
-}
newtype Bpf_int32 = Bpf_int32
  { un_Bpf_int32 :: FC.CInt
  }
  deriving stock (Eq, Ord, Read, Show)
  deriving newtype (F.Storable, Bits.Bits, Bounded, Enum, FiniteBits, Integral, Ix.Ix, Num, Real)

{-| __C declaration:__ @bpf_u_int32@

    __defined at:__ @pcap\/bpf.h:97:15@

    __exported by:__ @pcap.h@
-}
newtype Bpf_u_int32 = Bpf_u_int32
  { un_Bpf_u_int32 :: U_int
  }
  deriving stock (Eq, Ord, Read, Show)
  deriving newtype (F.Storable, Bits.Bits, Bounded, Enum, FiniteBits, Integral, Ix.Ix, Num, Real)

{-| __C declaration:__ @bpf_insn@

    __defined at:__ @pcap\/bpf.h:244:8@

    __exported by:__ @pcap.h@
-}
data Bpf_insn = Bpf_insn
  { bpf_insn_code :: U_short
    {- ^ __C declaration:__ @code@

         __defined at:__ @pcap\/bpf.h:245:10@

         __exported by:__ @pcap.h@
    -}
  , bpf_insn_jt :: U_char
    {- ^ __C declaration:__ @jt@

         __defined at:__ @pcap\/bpf.h:246:9@

         __exported by:__ @pcap.h@
    -}
  , bpf_insn_jf :: U_char
    {- ^ __C declaration:__ @jf@

         __defined at:__ @pcap\/bpf.h:247:9@

         __exported by:__ @pcap.h@
    -}
  , bpf_insn_k :: Bpf_u_int32
    {- ^ __C declaration:__ @k@

         __defined at:__ @pcap\/bpf.h:248:14@

         __exported by:__ @pcap.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable Bpf_insn where

  sizeOf = \_ -> (8 :: Int)

  alignment = \_ -> (4 :: Int)

  peek =
    \ptr0 ->
          pure Bpf_insn
      <*> F.peekByteOff ptr0 (0 :: Int)
      <*> F.peekByteOff ptr0 (2 :: Int)
      <*> F.peekByteOff ptr0 (3 :: Int)
      <*> F.peekByteOff ptr0 (4 :: Int)

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          Bpf_insn bpf_insn_code2 bpf_insn_jt3 bpf_insn_jf4 bpf_insn_k5 ->
               F.pokeByteOff ptr0 (0 :: Int) bpf_insn_code2
            >> F.pokeByteOff ptr0 (2 :: Int) bpf_insn_jt3
            >> F.pokeByteOff ptr0 (3 :: Int) bpf_insn_jf4
            >> F.pokeByteOff ptr0 (4 :: Int) bpf_insn_k5

{-| __C declaration:__ @bpf_program@

    __defined at:__ @pcap\/bpf.h:116:8@

    __exported by:__ @pcap.h@
-}
data Bpf_program = Bpf_program
  { bpf_program_bf_len :: U_int
    {- ^ __C declaration:__ @bf_len@

         __defined at:__ @pcap\/bpf.h:117:8@

         __exported by:__ @pcap.h@
    -}
  , bpf_program_bf_insns :: Ptr.Ptr Bpf_insn
    {- ^ __C declaration:__ @bf_insns@

         __defined at:__ @pcap\/bpf.h:118:19@

         __exported by:__ @pcap.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable Bpf_program where

  sizeOf = \_ -> (16 :: Int)

  alignment = \_ -> (8 :: Int)

  peek =
    \ptr0 ->
          pure Bpf_program
      <*> F.peekByteOff ptr0 (0 :: Int)
      <*> F.peekByteOff ptr0 (8 :: Int)

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          Bpf_program bpf_program_bf_len2 bpf_program_bf_insns3 ->
               F.pokeByteOff ptr0 (0 :: Int) bpf_program_bf_len2
            >> F.pokeByteOff ptr0 (8 :: Int) bpf_program_bf_insns3

{-| __C declaration:__ @PCAP_VERSION_MAJOR@

    __defined at:__ @pcap\/pcap.h:149:9@

    __exported by:__ @pcap.h@
-}
pCAP_VERSION_MAJOR :: FC.CInt
pCAP_VERSION_MAJOR = (2 :: FC.CInt)

{-| __C declaration:__ @PCAP_VERSION_MINOR@

    __defined at:__ @pcap\/pcap.h:150:9@

    __exported by:__ @pcap.h@
-}
pCAP_VERSION_MINOR :: FC.CInt
pCAP_VERSION_MINOR = (4 :: FC.CInt)

{-| __C declaration:__ @PCAP_ERRBUF_SIZE@

    __defined at:__ @pcap\/pcap.h:152:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERRBUF_SIZE :: FC.CInt
pCAP_ERRBUF_SIZE = (256 :: FC.CInt)

{-| __C declaration:__ @pcap_t@

    __defined at:__ @pcap\/pcap.h:163:16@

    __exported by:__ @pcap.h@
-}
data Pcap_t

{-| __C declaration:__ @pcap_dumper_t@

    __defined at:__ @pcap\/pcap.h:164:16@

    __exported by:__ @pcap.h@
-}
data Pcap_dumper_t

{-| __C declaration:__ @pcap_addr@

    __defined at:__ @pcap\/pcap.h:370:8@

    __exported by:__ @pcap.h@
-}
data Pcap_addr = Pcap_addr
  { pcap_addr_next :: Ptr.Ptr Pcap_addr
    {- ^ __C declaration:__ @next@

         __defined at:__ @pcap\/pcap.h:371:20@

         __exported by:__ @pcap.h@
    -}
  , pcap_addr_addr :: Ptr.Ptr Sockaddr
    {- ^ __C declaration:__ @addr@

         __defined at:__ @pcap\/pcap.h:372:19@

         __exported by:__ @pcap.h@
    -}
  , pcap_addr_netmask :: Ptr.Ptr Sockaddr
    {- ^ __C declaration:__ @netmask@

         __defined at:__ @pcap\/pcap.h:373:19@

         __exported by:__ @pcap.h@
    -}
  , pcap_addr_broadaddr :: Ptr.Ptr Sockaddr
    {- ^ __C declaration:__ @broadaddr@

         __defined at:__ @pcap\/pcap.h:374:19@

         __exported by:__ @pcap.h@
    -}
  , pcap_addr_dstaddr :: Ptr.Ptr Sockaddr
    {- ^ __C declaration:__ @dstaddr@

         __defined at:__ @pcap\/pcap.h:375:19@

         __exported by:__ @pcap.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable Pcap_addr where

  sizeOf = \_ -> (40 :: Int)

  alignment = \_ -> (8 :: Int)

  peek =
    \ptr0 ->
          pure Pcap_addr
      <*> F.peekByteOff ptr0 (0 :: Int)
      <*> F.peekByteOff ptr0 (8 :: Int)
      <*> F.peekByteOff ptr0 (16 :: Int)
      <*> F.peekByteOff ptr0 (24 :: Int)
      <*> F.peekByteOff ptr0 (32 :: Int)

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          Pcap_addr
            pcap_addr_next2
            pcap_addr_addr3
            pcap_addr_netmask4
            pcap_addr_broadaddr5
            pcap_addr_dstaddr6 ->
                 F.pokeByteOff ptr0 (0 :: Int) pcap_addr_next2
              >> F.pokeByteOff ptr0 (8 :: Int) pcap_addr_addr3
              >> F.pokeByteOff ptr0 (16 :: Int) pcap_addr_netmask4
              >> F.pokeByteOff ptr0 (24 :: Int) pcap_addr_broadaddr5
              >> F.pokeByteOff ptr0 (32 :: Int) pcap_addr_dstaddr6

{-| __C declaration:__ @pcap_if_t@

    __defined at:__ @pcap\/pcap.h:349:8@

    __exported by:__ @pcap.h@
-}
data Pcap_if_t = Pcap_if_t
  { pcap_if_t_next :: Ptr.Ptr Pcap_if_t
    {- ^ __C declaration:__ @next@

         __defined at:__ @pcap\/pcap.h:350:18@

         __exported by:__ @pcap.h@
    -}
  , pcap_if_t_name :: Ptr.Ptr FC.CChar
    {- ^ __C declaration:__ @name@

         __defined at:__ @pcap\/pcap.h:351:8@

         __exported by:__ @pcap.h@
    -}
  , pcap_if_t_description :: Ptr.Ptr FC.CChar
    {- ^ __C declaration:__ @description@

         __defined at:__ @pcap\/pcap.h:352:8@

         __exported by:__ @pcap.h@
    -}
  , pcap_if_t_addresses :: Ptr.Ptr Pcap_addr
    {- ^ __C declaration:__ @addresses@

         __defined at:__ @pcap\/pcap.h:353:20@

         __exported by:__ @pcap.h@
    -}
  , pcap_if_t_flags :: Bpf_u_int32
    {- ^ __C declaration:__ @flags@

         __defined at:__ @pcap\/pcap.h:354:14@

         __exported by:__ @pcap.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable Pcap_if_t where

  sizeOf = \_ -> (40 :: Int)

  alignment = \_ -> (8 :: Int)

  peek =
    \ptr0 ->
          pure Pcap_if_t
      <*> F.peekByteOff ptr0 (0 :: Int)
      <*> F.peekByteOff ptr0 (8 :: Int)
      <*> F.peekByteOff ptr0 (16 :: Int)
      <*> F.peekByteOff ptr0 (24 :: Int)
      <*> F.peekByteOff ptr0 (32 :: Int)

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          Pcap_if_t
            pcap_if_t_next2
            pcap_if_t_name3
            pcap_if_t_description4
            pcap_if_t_addresses5
            pcap_if_t_flags6 ->
                 F.pokeByteOff ptr0 (0 :: Int) pcap_if_t_next2
              >> F.pokeByteOff ptr0 (8 :: Int) pcap_if_t_name3
              >> F.pokeByteOff ptr0 (16 :: Int) pcap_if_t_description4
              >> F.pokeByteOff ptr0 (24 :: Int) pcap_if_t_addresses5
              >> F.pokeByteOff ptr0 (32 :: Int) pcap_if_t_flags6

{-| __C declaration:__ @pcap_addr_t@

    __defined at:__ @pcap\/pcap.h:166:26@

    __exported by:__ @pcap.h@
-}
newtype Pcap_addr_t = Pcap_addr_t
  { un_Pcap_addr_t :: Pcap_addr
  }
  deriving stock (Eq, Show)
  deriving newtype (F.Storable)

{-| __C declaration:__ @pcap_file_header@

    __defined at:__ @pcap\/pcap.h:207:8@

    __exported by:__ @pcap.h@
-}
data Pcap_file_header = Pcap_file_header
  { pcap_file_header_magic :: Bpf_u_int32
    {- ^ __C declaration:__ @magic@

         __defined at:__ @pcap\/pcap.h:208:14@

         __exported by:__ @pcap.h@
    -}
  , pcap_file_header_version_major :: U_short
    {- ^ __C declaration:__ @version_major@

         __defined at:__ @pcap\/pcap.h:209:10@

         __exported by:__ @pcap.h@
    -}
  , pcap_file_header_version_minor :: U_short
    {- ^ __C declaration:__ @version_minor@

         __defined at:__ @pcap\/pcap.h:210:10@

         __exported by:__ @pcap.h@
    -}
  , pcap_file_header_thiszone :: Bpf_int32
    {- ^ __C declaration:__ @thiszone@

         __defined at:__ @pcap\/pcap.h:211:12@

         __exported by:__ @pcap.h@
    -}
  , pcap_file_header_sigfigs :: Bpf_u_int32
    {- ^ __C declaration:__ @sigfigs@

         __defined at:__ @pcap\/pcap.h:212:14@

         __exported by:__ @pcap.h@
    -}
  , pcap_file_header_snaplen :: Bpf_u_int32
    {- ^ __C declaration:__ @snaplen@

         __defined at:__ @pcap\/pcap.h:213:14@

         __exported by:__ @pcap.h@
    -}
  , pcap_file_header_linktype :: Bpf_u_int32
    {- ^ __C declaration:__ @linktype@

         __defined at:__ @pcap\/pcap.h:214:14@

         __exported by:__ @pcap.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable Pcap_file_header where

  sizeOf = \_ -> (24 :: Int)

  alignment = \_ -> (4 :: Int)

  peek =
    \ptr0 ->
          pure Pcap_file_header
      <*> F.peekByteOff ptr0 (0 :: Int)
      <*> F.peekByteOff ptr0 (4 :: Int)
      <*> F.peekByteOff ptr0 (6 :: Int)
      <*> F.peekByteOff ptr0 (8 :: Int)
      <*> F.peekByteOff ptr0 (12 :: Int)
      <*> F.peekByteOff ptr0 (16 :: Int)
      <*> F.peekByteOff ptr0 (20 :: Int)

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          Pcap_file_header
            pcap_file_header_magic2
            pcap_file_header_version_major3
            pcap_file_header_version_minor4
            pcap_file_header_thiszone5
            pcap_file_header_sigfigs6
            pcap_file_header_snaplen7
            pcap_file_header_linktype8 ->
                 F.pokeByteOff ptr0 (0 :: Int) pcap_file_header_magic2
              >> F.pokeByteOff ptr0 (4 :: Int) pcap_file_header_version_major3
              >> F.pokeByteOff ptr0 (6 :: Int) pcap_file_header_version_minor4
              >> F.pokeByteOff ptr0 (8 :: Int) pcap_file_header_thiszone5
              >> F.pokeByteOff ptr0 (12 :: Int) pcap_file_header_sigfigs6
              >> F.pokeByteOff ptr0 (16 :: Int) pcap_file_header_snaplen7
              >> F.pokeByteOff ptr0 (20 :: Int) pcap_file_header_linktype8

{-| __C declaration:__ @LT_LINKTYPE@

    __defined at:__ @pcap\/pcap.h:268:9@

    __exported by:__ @pcap.h@
-}
lT_LINKTYPE :: forall a0. (C.Bitwise a0) FC.CInt => a0 -> (C.BitsRes a0) FC.CInt
lT_LINKTYPE = \x0 -> (C..&.) x0 (65535 :: FC.CInt)

{-| __C declaration:__ @LT_LINKTYPE_EXT@

    __defined at:__ @pcap\/pcap.h:269:9@

    __exported by:__ @pcap.h@
-}
lT_LINKTYPE_EXT :: forall a0. (C.Bitwise a0) FC.CInt => a0 -> (C.BitsRes a0) FC.CInt
lT_LINKTYPE_EXT =
  \x0 -> (C..&.) x0 (4294901760 :: FC.CInt)

{-| __C declaration:__ @LT_RESERVED1@

    __defined at:__ @pcap\/pcap.h:270:9@

    __exported by:__ @pcap.h@
-}
lT_RESERVED1 :: forall a0. (C.Bitwise a0) FC.CInt => a0 -> (C.BitsRes a0) FC.CInt
lT_RESERVED1 =
  \x0 -> (C..&.) x0 (67043328 :: FC.CInt)

{-| __C declaration:__ @LT_FCS_LENGTH_PRESENT@

    __defined at:__ @pcap\/pcap.h:271:9@

    __exported by:__ @pcap.h@
-}
lT_FCS_LENGTH_PRESENT :: forall a0. (C.Bitwise a0) FC.CInt => a0 -> (C.BitsRes a0) FC.CInt
lT_FCS_LENGTH_PRESENT =
  \x0 -> (C..&.) x0 (67108864 :: FC.CInt)

{-| __C declaration:__ @LT_FCS_LENGTH@

    __defined at:__ @pcap\/pcap.h:272:9@

    __exported by:__ @pcap.h@
-}
lT_FCS_LENGTH :: forall a0. (C.Bitwise a0) FC.CInt => (C.Shift ((C.BitsRes a0) FC.CInt)) FC.CInt => a0 -> C.ShiftRes ((C.BitsRes a0) FC.CInt)
lT_FCS_LENGTH =
  \x0 ->
    (C.>>) ((C..&.) x0 (4026531840 :: FC.CInt)) (28 :: FC.CInt)

{-| __C declaration:__ @LT_FCS_DATALINK_EXT@

    __defined at:__ @pcap\/pcap.h:273:9@

    __exported by:__ @pcap.h@
-}
lT_FCS_DATALINK_EXT :: forall a0. (C.Bitwise a0) FC.CInt => (C.Bitwise (C.ShiftRes ((C.BitsRes a0) FC.CInt))) FC.CInt => (C.Shift ((C.BitsRes a0) FC.CInt)) FC.CInt => a0 -> (C.BitsRes (C.ShiftRes ((C.BitsRes a0) FC.CInt))) FC.CInt
lT_FCS_DATALINK_EXT =
  \x0 ->
    (C..|.) ((C.<<) ((C..&.) x0 (15 :: FC.CInt)) (28 :: FC.CInt)) (67108864 :: FC.CInt)

{-| __defined at:__ @pcap\/pcap.h:275:9@

    __exported by:__ @pcap.h@
-}
newtype Pcap_direction_t = Pcap_direction_t
  { un_Pcap_direction_t :: FC.CUInt
  }
  deriving stock (Eq, Ord)

instance F.Storable Pcap_direction_t where

  sizeOf = \_ -> (4 :: Int)

  alignment = \_ -> (4 :: Int)

  peek =
    \ptr0 ->
          pure Pcap_direction_t
      <*> F.peekByteOff ptr0 (0 :: Int)

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          Pcap_direction_t un_Pcap_direction_t2 ->
            F.pokeByteOff ptr0 (0 :: Int) un_Pcap_direction_t2

instance HsBindgen.Runtime.CEnum.CEnum Pcap_direction_t where

  type CEnumZ Pcap_direction_t = FC.CUInt

  toCEnum = Pcap_direction_t

  fromCEnum = un_Pcap_direction_t

  declaredValues =
    \_ ->
      HsBindgen.Runtime.CEnum.declaredValuesFromList [ (0, Data.List.NonEmpty.singleton "PCAP_D_INOUT")
                                                     , (1, Data.List.NonEmpty.singleton "PCAP_D_IN")
                                                     , (2, Data.List.NonEmpty.singleton "PCAP_D_OUT")
                                                     ]

  showsUndeclared =
    HsBindgen.Runtime.CEnum.showsWrappedUndeclared "Pcap_direction_t"

  readPrecUndeclared =
    HsBindgen.Runtime.CEnum.readPrecWrappedUndeclared "Pcap_direction_t"

  isDeclared = HsBindgen.Runtime.CEnum.seqIsDeclared

  mkDeclared = HsBindgen.Runtime.CEnum.seqMkDeclared

instance HsBindgen.Runtime.CEnum.SequentialCEnum Pcap_direction_t where

  minDeclaredValue = PCAP_D_INOUT

  maxDeclaredValue = PCAP_D_OUT

instance Show Pcap_direction_t where

  showsPrec = HsBindgen.Runtime.CEnum.showsCEnum

instance Read Pcap_direction_t where

  readPrec = HsBindgen.Runtime.CEnum.readPrecCEnum

  readList = Text.Read.readListDefault

  readListPrec = Text.Read.readListPrecDefault

{-| __C declaration:__ @PCAP_D_INOUT@

    __defined at:__ @pcap\/pcap.h:276:8@

    __exported by:__ @pcap.h@
-}
pattern PCAP_D_INOUT :: Pcap_direction_t
pattern PCAP_D_INOUT = Pcap_direction_t 0

{-| __C declaration:__ @PCAP_D_IN@

    __defined at:__ @pcap\/pcap.h:277:8@

    __exported by:__ @pcap.h@
-}
pattern PCAP_D_IN :: Pcap_direction_t
pattern PCAP_D_IN = Pcap_direction_t 1

{-| __C declaration:__ @PCAP_D_OUT@

    __defined at:__ @pcap\/pcap.h:278:8@

    __exported by:__ @pcap.h@
-}
pattern PCAP_D_OUT :: Pcap_direction_t
pattern PCAP_D_OUT = Pcap_direction_t 2

{-| __C declaration:__ @pcap_pkthdr@

    __defined at:__ @pcap\/pcap.h:293:8@

    __exported by:__ @pcap.h@
-}
data Pcap_pkthdr = Pcap_pkthdr
  { pcap_pkthdr_ts :: Timeval
    {- ^ __C declaration:__ @ts@

         __defined at:__ @pcap\/pcap.h:294:17@

         __exported by:__ @pcap.h@
    -}
  , pcap_pkthdr_caplen :: Bpf_u_int32
    {- ^ __C declaration:__ @caplen@

         __defined at:__ @pcap\/pcap.h:295:14@

         __exported by:__ @pcap.h@
    -}
  , pcap_pkthdr_len :: Bpf_u_int32
    {- ^ __C declaration:__ @len@

         __defined at:__ @pcap\/pcap.h:296:14@

         __exported by:__ @pcap.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable Pcap_pkthdr where

  sizeOf = \_ -> (24 :: Int)

  alignment = \_ -> (8 :: Int)

  peek =
    \ptr0 ->
          pure Pcap_pkthdr
      <*> F.peekByteOff ptr0 (0 :: Int)
      <*> F.peekByteOff ptr0 (16 :: Int)
      <*> F.peekByteOff ptr0 (20 :: Int)

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          Pcap_pkthdr pcap_pkthdr_ts2 pcap_pkthdr_caplen3 pcap_pkthdr_len4 ->
               F.pokeByteOff ptr0 (0 :: Int) pcap_pkthdr_ts2
            >> F.pokeByteOff ptr0 (16 :: Int) pcap_pkthdr_caplen3
            >> F.pokeByteOff ptr0 (20 :: Int) pcap_pkthdr_len4

{-| __C declaration:__ @pcap_stat@

    __defined at:__ @pcap\/pcap.h:302:8@

    __exported by:__ @pcap.h@
-}
data Pcap_stat = Pcap_stat
  { pcap_stat_ps_recv :: U_int
    {- ^ __C declaration:__ @ps_recv@

         __defined at:__ @pcap\/pcap.h:303:8@

         __exported by:__ @pcap.h@
    -}
  , pcap_stat_ps_drop :: U_int
    {- ^ __C declaration:__ @ps_drop@

         __defined at:__ @pcap\/pcap.h:304:8@

         __exported by:__ @pcap.h@
    -}
  , pcap_stat_ps_ifdrop :: U_int
    {- ^ __C declaration:__ @ps_ifdrop@

         __defined at:__ @pcap\/pcap.h:305:8@

         __exported by:__ @pcap.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable Pcap_stat where

  sizeOf = \_ -> (12 :: Int)

  alignment = \_ -> (4 :: Int)

  peek =
    \ptr0 ->
          pure Pcap_stat
      <*> F.peekByteOff ptr0 (0 :: Int)
      <*> F.peekByteOff ptr0 (4 :: Int)
      <*> F.peekByteOff ptr0 (8 :: Int)

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          Pcap_stat pcap_stat_ps_recv2 pcap_stat_ps_drop3 pcap_stat_ps_ifdrop4 ->
               F.pokeByteOff ptr0 (0 :: Int) pcap_stat_ps_recv2
            >> F.pokeByteOff ptr0 (4 :: Int) pcap_stat_ps_drop3
            >> F.pokeByteOff ptr0 (8 :: Int) pcap_stat_ps_ifdrop4

{-| __C declaration:__ @PCAP_IF_LOOPBACK@

    __defined at:__ @pcap\/pcap.h:357:9@

    __exported by:__ @pcap.h@
-}
pCAP_IF_LOOPBACK :: FC.CInt
pCAP_IF_LOOPBACK = (1 :: FC.CInt)

{-| __C declaration:__ @PCAP_IF_UP@

    __defined at:__ @pcap\/pcap.h:358:9@

    __exported by:__ @pcap.h@
-}
pCAP_IF_UP :: FC.CInt
pCAP_IF_UP = (2 :: FC.CInt)

{-| __C declaration:__ @PCAP_IF_RUNNING@

    __defined at:__ @pcap\/pcap.h:359:9@

    __exported by:__ @pcap.h@
-}
pCAP_IF_RUNNING :: FC.CInt
pCAP_IF_RUNNING = (4 :: FC.CInt)

{-| __C declaration:__ @PCAP_IF_WIRELESS@

    __defined at:__ @pcap\/pcap.h:360:9@

    __exported by:__ @pcap.h@
-}
pCAP_IF_WIRELESS :: FC.CInt
pCAP_IF_WIRELESS = (8 :: FC.CInt)

{-| __C declaration:__ @PCAP_IF_CONNECTION_STATUS@

    __defined at:__ @pcap\/pcap.h:361:9@

    __exported by:__ @pcap.h@
-}
pCAP_IF_CONNECTION_STATUS :: FC.CInt
pCAP_IF_CONNECTION_STATUS = (48 :: FC.CInt)

{-| __C declaration:__ @PCAP_IF_CONNECTION_STATUS_UNKNOWN@

    __defined at:__ @pcap\/pcap.h:362:9@

    __exported by:__ @pcap.h@
-}
pCAP_IF_CONNECTION_STATUS_UNKNOWN :: FC.CInt
pCAP_IF_CONNECTION_STATUS_UNKNOWN = (0 :: FC.CInt)

{-| __C declaration:__ @PCAP_IF_CONNECTION_STATUS_CONNECTED@

    __defined at:__ @pcap\/pcap.h:363:9@

    __exported by:__ @pcap.h@
-}
pCAP_IF_CONNECTION_STATUS_CONNECTED :: FC.CInt
pCAP_IF_CONNECTION_STATUS_CONNECTED = (16 :: FC.CInt)

{-| __C declaration:__ @PCAP_IF_CONNECTION_STATUS_DISCONNECTED@

    __defined at:__ @pcap\/pcap.h:364:9@

    __exported by:__ @pcap.h@
-}
pCAP_IF_CONNECTION_STATUS_DISCONNECTED :: FC.CInt
pCAP_IF_CONNECTION_STATUS_DISCONNECTED =
  (32 :: FC.CInt)

{-| __C declaration:__ @PCAP_IF_CONNECTION_STATUS_NOT_APPLICABLE@

    __defined at:__ @pcap\/pcap.h:365:9@

    __exported by:__ @pcap.h@
-}
pCAP_IF_CONNECTION_STATUS_NOT_APPLICABLE :: FC.CInt
pCAP_IF_CONNECTION_STATUS_NOT_APPLICABLE =
  (48 :: FC.CInt)

{-| Auxiliary type used by 'Pcap_handler'

__defined at:__ @pcap\/pcap.h:378:16@

__exported by:__ @pcap.h@
-}
newtype Pcap_handler_Deref = Pcap_handler_Deref
  { un_Pcap_handler_Deref :: (Ptr.Ptr U_char) -> (Ptr.Ptr Pcap_pkthdr) -> (Ptr.Ptr U_char) -> IO ()
  }

{-| __C declaration:__ @pcap_handler@

    __defined at:__ @pcap\/pcap.h:378:16@

    __exported by:__ @pcap.h@
-}
newtype Pcap_handler = Pcap_handler
  { un_Pcap_handler :: Ptr.FunPtr Pcap_handler_Deref
  }
  deriving stock (Eq, Ord, Show)
  deriving newtype (F.Storable)

{-| __C declaration:__ @PCAP_ERROR@

    __defined at:__ @pcap\/pcap.h:387:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERROR :: FC.CInt
pCAP_ERROR = C.negate (1 :: FC.CInt)

{-| __C declaration:__ @PCAP_ERROR_BREAK@

    __defined at:__ @pcap\/pcap.h:388:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERROR_BREAK :: FC.CInt
pCAP_ERROR_BREAK = C.negate (2 :: FC.CInt)

{-| __C declaration:__ @PCAP_ERROR_NOT_ACTIVATED@

    __defined at:__ @pcap\/pcap.h:389:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERROR_NOT_ACTIVATED :: FC.CInt
pCAP_ERROR_NOT_ACTIVATED = C.negate (3 :: FC.CInt)

{-| __C declaration:__ @PCAP_ERROR_ACTIVATED@

    __defined at:__ @pcap\/pcap.h:390:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERROR_ACTIVATED :: FC.CInt
pCAP_ERROR_ACTIVATED = C.negate (4 :: FC.CInt)

{-| __C declaration:__ @PCAP_ERROR_NO_SUCH_DEVICE@

    __defined at:__ @pcap\/pcap.h:391:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERROR_NO_SUCH_DEVICE :: FC.CInt
pCAP_ERROR_NO_SUCH_DEVICE = C.negate (5 :: FC.CInt)

{-| __C declaration:__ @PCAP_ERROR_RFMON_NOTSUP@

    __defined at:__ @pcap\/pcap.h:392:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERROR_RFMON_NOTSUP :: FC.CInt
pCAP_ERROR_RFMON_NOTSUP = C.negate (6 :: FC.CInt)

{-| __C declaration:__ @PCAP_ERROR_NOT_RFMON@

    __defined at:__ @pcap\/pcap.h:393:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERROR_NOT_RFMON :: FC.CInt
pCAP_ERROR_NOT_RFMON = C.negate (7 :: FC.CInt)

{-| __C declaration:__ @PCAP_ERROR_PERM_DENIED@

    __defined at:__ @pcap\/pcap.h:394:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERROR_PERM_DENIED :: FC.CInt
pCAP_ERROR_PERM_DENIED = C.negate (8 :: FC.CInt)

{-| __C declaration:__ @PCAP_ERROR_IFACE_NOT_UP@

    __defined at:__ @pcap\/pcap.h:395:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERROR_IFACE_NOT_UP :: FC.CInt
pCAP_ERROR_IFACE_NOT_UP = C.negate (9 :: FC.CInt)

{-| __C declaration:__ @PCAP_ERROR_CANTSET_TSTAMP_TYPE@

    __defined at:__ @pcap\/pcap.h:396:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERROR_CANTSET_TSTAMP_TYPE :: FC.CInt
pCAP_ERROR_CANTSET_TSTAMP_TYPE =
  C.negate (10 :: FC.CInt)

{-| __C declaration:__ @PCAP_ERROR_PROMISC_PERM_DENIED@

    __defined at:__ @pcap\/pcap.h:397:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERROR_PROMISC_PERM_DENIED :: FC.CInt
pCAP_ERROR_PROMISC_PERM_DENIED =
  C.negate (11 :: FC.CInt)

{-| __C declaration:__ @PCAP_ERROR_TSTAMP_PRECISION_NOTSUP@

    __defined at:__ @pcap\/pcap.h:398:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERROR_TSTAMP_PRECISION_NOTSUP :: FC.CInt
pCAP_ERROR_TSTAMP_PRECISION_NOTSUP =
  C.negate (12 :: FC.CInt)

{-| __C declaration:__ @PCAP_ERROR_CAPTURE_NOTSUP@

    __defined at:__ @pcap\/pcap.h:399:9@

    __exported by:__ @pcap.h@
-}
pCAP_ERROR_CAPTURE_NOTSUP :: FC.CInt
pCAP_ERROR_CAPTURE_NOTSUP = C.negate (13 :: FC.CInt)

{-| __C declaration:__ @PCAP_WARNING@

    __defined at:__ @pcap\/pcap.h:406:9@

    __exported by:__ @pcap.h@
-}
pCAP_WARNING :: FC.CInt
pCAP_WARNING = (1 :: FC.CInt)

{-| __C declaration:__ @PCAP_WARNING_PROMISC_NOTSUP@

    __defined at:__ @pcap\/pcap.h:407:9@

    __exported by:__ @pcap.h@
-}
pCAP_WARNING_PROMISC_NOTSUP :: FC.CInt
pCAP_WARNING_PROMISC_NOTSUP = (2 :: FC.CInt)

{-| __C declaration:__ @PCAP_WARNING_TSTAMP_TYPE_NOTSUP@

    __defined at:__ @pcap\/pcap.h:408:9@

    __exported by:__ @pcap.h@
-}
pCAP_WARNING_TSTAMP_TYPE_NOTSUP :: FC.CInt
pCAP_WARNING_TSTAMP_TYPE_NOTSUP = (3 :: FC.CInt)

{-| __C declaration:__ @PCAP_NETMASK_UNKNOWN@

    __defined at:__ @pcap\/pcap.h:414:9@

    __exported by:__ @pcap.h@
-}
pCAP_NETMASK_UNKNOWN :: FC.CInt
pCAP_NETMASK_UNKNOWN = (4294967295 :: FC.CInt)

{-| __C declaration:__ @PCAP_CHAR_ENC_LOCAL@

    __defined at:__ @pcap\/pcap.h:431:9@

    __exported by:__ @pcap.h@
-}
pCAP_CHAR_ENC_LOCAL :: FC.CUInt
pCAP_CHAR_ENC_LOCAL = (0 :: FC.CUInt)

{-| __C declaration:__ @PCAP_CHAR_ENC_UTF_8@

    __defined at:__ @pcap\/pcap.h:432:9@

    __exported by:__ @pcap.h@
-}
pCAP_CHAR_ENC_UTF_8 :: FC.CUInt
pCAP_CHAR_ENC_UTF_8 = (1 :: FC.CUInt)

{-| __C declaration:__ @PCAP_TSTAMP_HOST_LOWPREC@

    __defined at:__ @pcap\/pcap.h:548:9@

    __exported by:__ @pcap.h@
-}
pCAP_TSTAMP_HOST_LOWPREC :: FC.CInt
pCAP_TSTAMP_HOST_LOWPREC = (1 :: FC.CInt)

{-| __C declaration:__ @PCAP_TSTAMP_HOST_HIPREC@

    __defined at:__ @pcap\/pcap.h:549:9@

    __exported by:__ @pcap.h@
-}
pCAP_TSTAMP_HOST_HIPREC :: FC.CInt
pCAP_TSTAMP_HOST_HIPREC = (2 :: FC.CInt)

{-| __C declaration:__ @PCAP_TSTAMP_ADAPTER@

    __defined at:__ @pcap\/pcap.h:550:9@

    __exported by:__ @pcap.h@
-}
pCAP_TSTAMP_ADAPTER :: FC.CInt
pCAP_TSTAMP_ADAPTER = (3 :: FC.CInt)

{-| __C declaration:__ @PCAP_TSTAMP_ADAPTER_UNSYNCED@

    __defined at:__ @pcap\/pcap.h:551:9@

    __exported by:__ @pcap.h@
-}
pCAP_TSTAMP_ADAPTER_UNSYNCED :: FC.CInt
pCAP_TSTAMP_ADAPTER_UNSYNCED = (4 :: FC.CInt)

{-| __C declaration:__ @PCAP_TSTAMP_HOST_HIPREC_UNSYNCED@

    __defined at:__ @pcap\/pcap.h:552:9@

    __exported by:__ @pcap.h@
-}
pCAP_TSTAMP_HOST_HIPREC_UNSYNCED :: FC.CInt
pCAP_TSTAMP_HOST_HIPREC_UNSYNCED = (5 :: FC.CInt)

{-| __C declaration:__ @PCAP_TSTAMP_PRECISION_NANO@

    __defined at:__ @pcap\/pcap.h:561:9@

    __exported by:__ @pcap.h@
-}
pCAP_TSTAMP_PRECISION_NANO :: FC.CInt
pCAP_TSTAMP_PRECISION_NANO = (1 :: FC.CInt)

{-| __C declaration:__ @PCAP_BUF_SIZE@

    __defined at:__ @pcap\/pcap.h:919:9@

    __exported by:__ @pcap.h@
-}
pCAP_BUF_SIZE :: FC.CInt
pCAP_BUF_SIZE = (1024 :: FC.CInt)

{-| __C declaration:__ @PCAP_SRC_FILE@

    __defined at:__ @pcap\/pcap.h:924:9@

    __exported by:__ @pcap.h@
-}
pCAP_SRC_FILE :: FC.CInt
pCAP_SRC_FILE = (2 :: FC.CInt)

{-| __C declaration:__ @PCAP_SRC_IFLOCAL@

    __defined at:__ @pcap\/pcap.h:925:9@

    __exported by:__ @pcap.h@
-}
pCAP_SRC_IFLOCAL :: FC.CInt
pCAP_SRC_IFLOCAL = (3 :: FC.CInt)

{-| __C declaration:__ @PCAP_SRC_IFREMOTE@

    __defined at:__ @pcap\/pcap.h:926:9@

    __exported by:__ @pcap.h@
-}
pCAP_SRC_IFREMOTE :: FC.CInt
pCAP_SRC_IFREMOTE = (4 :: FC.CInt)

{-| __C declaration:__ @PCAP_SRC_FILE_STRING@

    __defined at:__ @pcap\/pcap.h:972:9@

    __exported by:__ @pcap.h@
-}
pCAP_SRC_FILE_STRING :: ((,) (Ptr.Ptr FC.CChar)) Int
pCAP_SRC_FILE_STRING =
  ((Ptr.Ptr "file://"#, 7) :: FC.CStringLen)

{-| __C declaration:__ @PCAP_SRC_IF_STRING@

    __defined at:__ @pcap\/pcap.h:979:9@

    __exported by:__ @pcap.h@
-}
pCAP_SRC_IF_STRING :: ((,) (Ptr.Ptr FC.CChar)) Int
pCAP_SRC_IF_STRING =
  ((Ptr.Ptr "rpcap://"#, 8) :: FC.CStringLen)

{-| __C declaration:__ @PCAP_OPENFLAG_PROMISCUOUS@

    __defined at:__ @pcap\/pcap.h:988:9@

    __exported by:__ @pcap.h@
-}
pCAP_OPENFLAG_PROMISCUOUS :: FC.CInt
pCAP_OPENFLAG_PROMISCUOUS = (1 :: FC.CInt)

{-| __C declaration:__ @PCAP_OPENFLAG_DATATX_UDP@

    __defined at:__ @pcap\/pcap.h:1002:9@

    __exported by:__ @pcap.h@
-}
pCAP_OPENFLAG_DATATX_UDP :: FC.CInt
pCAP_OPENFLAG_DATATX_UDP = (2 :: FC.CInt)

{-| __C declaration:__ @PCAP_OPENFLAG_NOCAPTURE_RPCAP@

    __defined at:__ @pcap\/pcap.h:1016:9@

    __exported by:__ @pcap.h@
-}
pCAP_OPENFLAG_NOCAPTURE_RPCAP :: FC.CInt
pCAP_OPENFLAG_NOCAPTURE_RPCAP = (4 :: FC.CInt)

{-| __C declaration:__ @PCAP_OPENFLAG_NOCAPTURE_LOCAL@

    __defined at:__ @pcap\/pcap.h:1027:9@

    __exported by:__ @pcap.h@
-}
pCAP_OPENFLAG_NOCAPTURE_LOCAL :: FC.CInt
pCAP_OPENFLAG_NOCAPTURE_LOCAL = (8 :: FC.CInt)

{-| __C declaration:__ @PCAP_OPENFLAG_MAX_RESPONSIVENESS@

    __defined at:__ @pcap\/pcap.h:1043:9@

    __exported by:__ @pcap.h@
-}
pCAP_OPENFLAG_MAX_RESPONSIVENESS :: FC.CInt
pCAP_OPENFLAG_MAX_RESPONSIVENESS = (16 :: FC.CInt)

{-| __C declaration:__ @RPCAP_RMTAUTH_PWD@

    __defined at:__ @pcap\/pcap.h:1072:9@

    __exported by:__ @pcap.h@
-}
rPCAP_RMTAUTH_PWD :: FC.CInt
rPCAP_RMTAUTH_PWD = (1 :: FC.CInt)

{-| __C declaration:__ @pcap_rmtauth@

    __defined at:__ @pcap\/pcap.h:1087:8@

    __exported by:__ @pcap.h@
-}
data Pcap_rmtauth = Pcap_rmtauth
  { pcap_rmtauth_type :: FC.CInt
    {- ^ __C declaration:__ @type@

         __defined at:__ @pcap\/pcap.h:1097:6@

         __exported by:__ @pcap.h@
    -}
  , pcap_rmtauth_username :: Ptr.Ptr FC.CChar
    {- ^ __C declaration:__ @username@

         __defined at:__ @pcap\/pcap.h:1105:8@

         __exported by:__ @pcap.h@
    -}
  , pcap_rmtauth_password :: Ptr.Ptr FC.CChar
    {- ^ __C declaration:__ @password@

         __defined at:__ @pcap\/pcap.h:1113:8@

         __exported by:__ @pcap.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable Pcap_rmtauth where

  sizeOf = \_ -> (24 :: Int)

  alignment = \_ -> (8 :: Int)

  peek =
    \ptr0 ->
          pure Pcap_rmtauth
      <*> F.peekByteOff ptr0 (0 :: Int)
      <*> F.peekByteOff ptr0 (8 :: Int)
      <*> F.peekByteOff ptr0 (16 :: Int)

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          Pcap_rmtauth pcap_rmtauth_type2 pcap_rmtauth_username3 pcap_rmtauth_password4 ->
               F.pokeByteOff ptr0 (0 :: Int) pcap_rmtauth_type2
            >> F.pokeByteOff ptr0 (8 :: Int) pcap_rmtauth_username3
            >> F.pokeByteOff ptr0 (16 :: Int) pcap_rmtauth_password4

{-| __C declaration:__ @PCAP_SAMP_1_EVERY_N@

    __defined at:__ @pcap\/pcap.h:1194:9@

    __exported by:__ @pcap.h@
-}
pCAP_SAMP_1_EVERY_N :: FC.CInt
pCAP_SAMP_1_EVERY_N = (1 :: FC.CInt)

{-| __C declaration:__ @PCAP_SAMP_FIRST_AFTER_N_MS@

    __defined at:__ @pcap\/pcap.h:1205:9@

    __exported by:__ @pcap.h@
-}
pCAP_SAMP_FIRST_AFTER_N_MS :: FC.CInt
pCAP_SAMP_FIRST_AFTER_N_MS = (2 :: FC.CInt)

{-| __C declaration:__ @pcap_samp@

    __defined at:__ @pcap\/pcap.h:1219:8@

    __exported by:__ @pcap.h@
-}
data Pcap_samp = Pcap_samp
  { pcap_samp_method :: FC.CInt
    {- ^ __C declaration:__ @method@

         __defined at:__ @pcap\/pcap.h:1224:6@

         __exported by:__ @pcap.h@
    -}
  , pcap_samp_value :: FC.CInt
    {- ^ __C declaration:__ @value@

         __defined at:__ @pcap\/pcap.h:1230:6@

         __exported by:__ @pcap.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable Pcap_samp where

  sizeOf = \_ -> (8 :: Int)

  alignment = \_ -> (4 :: Int)

  peek =
    \ptr0 ->
          pure Pcap_samp
      <*> F.peekByteOff ptr0 (0 :: Int)
      <*> F.peekByteOff ptr0 (4 :: Int)

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          Pcap_samp pcap_samp_method2 pcap_samp_value3 ->
               F.pokeByteOff ptr0 (0 :: Int) pcap_samp_method2
            >> F.pokeByteOff ptr0 (4 :: Int) pcap_samp_value3

{-| __C declaration:__ @RPCAP_HOSTLIST_SIZE@

    __defined at:__ @pcap\/pcap.h:1244:9@

    __exported by:__ @pcap.h@
-}
rPCAP_HOSTLIST_SIZE :: FC.CInt
rPCAP_HOSTLIST_SIZE = (1024 :: FC.CInt)
