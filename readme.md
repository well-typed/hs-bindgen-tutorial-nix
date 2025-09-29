# Generation of Haskell bindings from C header files with `hs-bindgen`

In this tutorial, we will (A) automatically generate Haskell bindings for
[`libpcap`](https://github.com/the-tcpdump-group/libpcap), an interface to
various kernel packet capture mechanisms. Further, we will (B) use the generated
Haskell bindings to print the list of network devices available on the local
machine.

#### Step A: Generate bindings

First, we will generate bindings in two ways:
1. We use the `hs-bindgen` client with binary name `hs-bindgen-cli`. The client
   generates a set of modules exposing a Haskell interface to the translated C
   header files.
2. We use the `hs-bindgen` Template Haskell interface. With the Template Haskell
   interface, we can directly "#include" the C header files in our Haskell
   source code files.

#### Step B: Use bindings

Second, we will compile our program and link the object files to the shared
`libpcap` library object files which need to be available. That is, while Step A
only required the C header files, Step B requires a (compiled) _implementation_
of the interface defined in the C header files.

#### System environment, LLVM and Nix

`hs-bindgen` uses [`libclang`](https://clang.llvm.org/doxygen/index.html) to
parse and interpret C header files. `libclang` is a part of the Clang C language
family frontend, which we need to set up and connect to `hs-bindgen` so that
`hs-bindgen` can use the Clang installation available on the current machine.

Nix, the package manager and build system, takes care of setting up the Clang
toolchain, the `hs-bindgen` client, and the `hs-bindgen` Template Haskell
interface for us.

## Step A: Generate bindings

### `hs-bindgen-cli`

### TH example with default GHC and LLVM

## Step B:

# Advanced

## Specific versions of GHC and the LLVM toolchain

- TH example with custom GHC and LLVM

# Notes

<!-- TODO_PR: Correct this statement after deciding where we put Nix-related code. -->

> [!NOTE] Last update: September 29, 2025. We are maintaining a [separate Nix
> Flake](https://github.com/dschrempf/hs-bindgen-flake), which may have received
> updates in the meantime.
