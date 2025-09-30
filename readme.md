# Generate Haskell bindings from C header files with `hs-bindgen`

In this tutorial, we will (A) automatically generate Haskell bindings for
[`libpcap`](https://github.com/the-tcpdump-group/libpcap), an interface to
various kernel packet capture mechanisms. Further, we will (B) use the generated
Haskell bindings to print the list of network devices available on the local
machine.

### Step A: Generate bindings

First, we will generate bindings in two ways:
1. We use the `hs-bindgen` client with binary name `hs-bindgen-cli`. The client
   generates a set of modules exposing a Haskell interface to the translated C
   header files.
2. We use the `hs-bindgen` Template Haskell interface. With the Template Haskell
   interface, we can directly "#include" the C header files in our Haskell
   source code files.

### Step B: Use bindings

Second, we will compile our program and link the object files to the shared
`libpcap` library object files which need to be available. That is, while Step A
only required the C header files, Step B requires a (compiled) _implementation_
of the interface defined in the C header files.

### System environment, LLVM and Nix

`hs-bindgen` uses [`libclang`](https://clang.llvm.org/doxygen/index.html) to
parse and interpret C header files. `libclang` is a part of the Clang C language
family frontend, which we need to set up and connect to `hs-bindgen` so that
`hs-bindgen` can use the Clang installation available on the current machine.

Nix, the package manager and build system, takes care of setting up the Clang
toolchain, the `hs-bindgen` client, and the `hs-bindgen` Template Haskell
interface for us. In particular, this tutorial contains a minimal Nix Flake
exposing `hs-bindgen` the client, and a `hs-bindgen` the Template Haskell
interface.

## Step A: Generate bindings

### Step A.1: The `hs-bindgen` client

#### Installation

Install the [Nix package manager](https://nixos.org/download/) and try to build
and run the client with

```sh
nix run .#hs-bindgen-cli -- --help | head -n 6
```

For example,
```
hs-bindgen - generate Haskell bindings from C headers

Usage: hs-bindgen [-v|--verbosity INT] [--log-as-info TRACE_ID]
                  [--log-as-warning TRACE_ID] [--log-as-error TRACE_ID]
                  [--log-as-error-warnings] [--log-enable-macro-warnings]
                  [--log-show-time] [--log-show-call-stack] COMMAND
```

The build uses the [default NixOS binary cache](https://cache.nixos.org/), but
some dependencies are `hs-bindgen`-specific and compilation will take a few
minutes. Nix uses the default version of GHC provided by Nixpkgs, and also takes
care of installing the default version of the required parts of the LLVM
toolchain.

> [!NOTE] At the time of writing (September 30, 2025), the default version of
> GHC is 9.8.4.

> [!NOTE] At the time of writing (September 30, 2025), this includes
> `llvmPackages.clang`, `llvmPackages.libclang`, and `llvmPackages.llvm`
> (version 19.1.7).

If you want to analyze how `hs-bindgen` finds the LLVM toolchain, see the
section [System environment](#system-environment).

If you want to use a specific version of GHC or the LLVM toolchain, [see the
relevant section below](#use-specific-versions-of-ghc-and-the-llvm-toolchain).

### TH example with default GHC and LLVM

## Step B: Build project using generated code

# Appendix

## System environment

### Client

The Nix Flake wraps the client `hs-bindgen-cli` so that it knows where the LLVM
toolchain is installed. We use a binary wrapper, and direct inspection of the
environment is cumbersome. However, we can use `hs-bindgen-cli` itself to report
the system environment it is picking up:

```sh
nix run .#hs-bindgen-cli -- info libclang -v4
```

For example,
```
[Info   ] [HsBindgen] [extra-clang-args] Picked up evironment variable BINDGEN_EXTRA_CLANG_ARGS; parsed 'libclang' arguments: ["-B/nix/store/82kmz7r96navanrc2fgckh2bamiqrgsw-gcc-14.3.0/lib/gcc/x86_64-unknown-linux-gnu/14.3.0","--gcc-toolchain=/nix/store/82kmz7r96navanrc2fgckh2bamiqrgsw-gcc-14.3.0","-B/nix/store/10mkp77lmqz8x2awd8hzv6pf7f7rkf6d-clang-19.1.7-lib/lib","-nostdlibinc","-resource-dir=/nix/store/fbfcll570w9vimfbh41f9b4rrwnp33f3-clang-wrapper-19.1.7/resource-root","-idirafter","/nix/store/gf3wh0x0rzb1dkx0wx1jvmipydwfzzd5-glibc-2.40-66-dev/include","-fmacro-prefix-map=/nix/store/gf3wh0x0rzb1dkx0wx1jvmipydwfzzd5-glibc-2.40-66-dev/include=/nix/store/eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee-glibc-2.40-66-dev/include","-frandom-seed=76bkkqxi8g"]
[Info   ] [HsBindgen] [builtin-include-dir] BINDGEN_BUILTIN_INCLUDE_DIR set: BuiltinIncDirDisable
```

In particular (see the [Clang command line argument
reference](https://clang.llvm.org/docs/ClangCommandLineReference.html)),
- `-B/nix/store/82kmz7r96navanrc2fgckh2bamiqrgsw-gcc-14.3.0/lib/gcc/x86_64-unknown-linux-gnu/14.3.0`,
  and `--gcc-toolchain=/nix/store/82kmz7r96navanrc2fgckh2bamiqrgsw-gcc-14.3.0`:
  Use and search GCC toolchain for executables, libraries, and data
  files.
- `-B/nix/store/10mkp77lmqz8x2awd8hzv6pf7f7rkf6d-clang-19.1.7-lib/lib`, and
  `-resource-dir=/nix/store/fbfcll570w9vimfbh41f9b4rrwnp33f3-clang-wrapper-19.1.7/resource-root`:
  Use and search the Clang toolchain for executables, libraries, and data files.
  The `resource-dir` is particularly important, because it contains the headers
  of the C standard library. We let `hs-bindgen` know that we specified the
  `resource-dir` directly, so that it does not have to perform heuristic search
  (`BINDGEN_BUILTIN_INCLUDE_DIR=disable` environment variable).
- `-nostdlibinc`: Disable standard system `#include` directories only.
- `-idirafter
  /nix/store/gf3wh0x0rzb1dkx0wx1jvmipydwfzzd5-glibc-2.40-66-dev/include`: Fall
  back to the `glibc` standard library headers.

Other options not discussed here:
  `-fmacro-prefix-map=/nix/store/gf3wh0x0rzb1dkx0wx1jvmipydwfzzd5-glibc-2.40-66-dev/include=/nix/store/eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee-glibc-2.40-66-dev/include`,
  and `-frandom-seed=76bkkqxi8g`.

## Use specific versions of GHC or the LLVM toolchain

- TH example with custom GHC and LLVM

# Notes

> [!NOTE] Last update: September 30, 2025. The [upstream Nix
> Flake](https://github.com/dschrempf/hs-bindgen-flake) may have received
> updates in the meantime.
