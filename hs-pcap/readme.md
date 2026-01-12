# Generate Haskell bindings for `libpcap` with `hs-bindgen`

## Introduction

In this tutorial, we showcase the automatic generation of Haskell bindings with
[`hs-bindgen`](https://github.com/well-typed/hs-bindgen) for [`libpcap`](https://github.com/the-tcpdump-group/libpcap). `libpcap` is an interface to various
kernel packet capture mechanisms. Below, we present two methods to generate
Haskell bindings and use the generated bindings to print the list of network
devices available on the local machine.

We use the [Nix package manager](https://nixos.org/download/) to manage installation of `hs-bindgen` and
other system dependencies.

### Overview of Method A: Command line client

First, we [generate bindings using the `hs-bindgen` client](#method-a-command-line-client) with binary name
`hs-bindgen-cli`. The client generates a set of modules exposing a Haskell
interface to the translated C header files.

We compile our program, linking the resulting object files to the shared
`libpcap` library which needs to be available. That is, while generating the
bindings only requires the C header files to be available, using the generated
bindings requires a (compiled) _implementation_ of the interface defined in the
C header files.

### Overview of Method B: Template-Haskell interface

The [`hs-bindgen` Template-Haskell interface](#method-b-template-haskell-interface) allows direct inclusion (a'la
`#include`) of C header files into our Haskell source code files. We rebuild the
same application developed [using the `hs-bindgen` client](#overview-of-method-a-command-line-client) with the
`hs-bindgen` Template-Haskell interface.

### System environment, LLVM and Nix

`hs-bindgen` uses [`libclang`](https://clang.llvm.org/doxygen/index.html) to parse and interpret C header files.
`libclang` is a part of the [LLVM compiler infrastructure](https://llvm.org/), which we need to
set up and connect to `hs-bindgen`.

Nix, the package manager and build system, takes care of setting up the Clang
toolchain, the `hs-bindgen` client, and the `hs-bindgen` Template-Haskell
interface for us. In particular, this tutorial contains self-contained [Nix
Flakes](https://nix.dev/manual/nix/latest/command-ref/new-cli/nix3-flake.html) exposing the `hs-bindgen` the client, and `hs-bindgen` the
Template-Haskell interface, respectively. These Nix Flakes only export outputs
provided by the [`hs-bindgen` Nix Flake](https://github.com/well-typed/hs-bindgen) which we maintain alongside
`hs-bindgen`. You should use this upstream Nix Flake directly in your future
projects, if you decide to use the Nix package manager to manage your
`hs-bindgen` installation.

## Method A: Command line client

### Installation

Install the [Nix package manager](https://nixos.org/download/), [enable Nix Flakes](https://wiki.nixos.org/wiki/Flakes#Setup), and try to build
and run the client with

```console
$ nix run ./hs-pcap-client#hs-bindgen-cli -- --help | head -n 6

hs-bindgen - generate Haskell bindings from C headers

Usage: hs-bindgen [-v|--verbosity INT] [--log-as-info TRACE_ID]
                  [--log-as-warning TRACE_ID] [--log-as-error TRACE_ID]
                  [--log-as-error-warnings] [--log-enable-macro-warnings]
                  [--log-show-time] [--log-show-call-stack] COMMAND
```

The build uses the [default NixOS binary cache](https://cache.nixos.org/), but some dependencies are
`hs-bindgen`-specific and compilation will take a few minutes. The
`hs-bindgen-cli` package derivation uses the default version of GHC provided by
Nixpkgs, and also takes care of installing the default version of the required
parts of the Clang toolchain.

> [!NOTE]
> At the time of writing (January 8, 2026),
> - the default version of GHC is 9.10.3;
> - the Clang toolchain includes version 21.1.7 of packages
>   `llvmPackages.clang`, `llvmPackages.libclang`, and `llvmPackages.llvm`.

> [!TIP]
> - If you are interested in how `hs-bindgen` finds included headers, see the
>   [`hs-bindgen` manual section on includes](https://github.com/well-typed/hs-bindgen/blob/main/manual/LowLevel/Includes.md).
> - If you want to analyze how `hs-bindgen` finds the Clang toolchain, see
>  Section [System environment](#system-environment) of this tutorial.
> - If you want to use a specific version of GHC or the Clang toolchain, [see
>   the relevant section below](#use-specific-versions-of-the-ghc-or-clang-toolchains).

### Whet your appetite!

We have [prepared a small project](./hs-pcap-client) that generates bindings for `libpcap` and
uses them to list the network devices found on your machine. Change your current
working directory to this sub-project,

```console
$ cd hs-pcap-client
```

Run the the application

```console
$ nix run
```

This should print a list of network devices found on your machine.

> [!NOTE]
> We did not check in the generated bindings! The derivation generates the
> bindings during the build process. That is, you can run the application
> without manually generating bindings yourself!

### Generate bindings

A Nix development shell provides access to the Haskell toolchain, the
`hs-bindgen` client, the Clang toolchain, and the `libpcap` library (header
files and compiled shared object files). The simplified, relevant code from [the
Nix Flake](./hs-pcap-client/flake.nix) is:

```nix
# Apply the overlay provided by the upstream Nix Flake.
pkgs = import inputs.nixpkgs {
  inherit system;
  overlays = [ hs-bindgen.overlays.default ];
};

# Collect the dependencies for the `pcap` client project.
hs-pcap-client = haskell.lib.compose.generateBindings ./generate-bindings
  (haskellPackages.callCabal2nix "hs-pcap-client" ./. { });

...

devShells.default = haskellPackges.shellFor {
  packages = _: [ hs-pcap-client ];
  nativeBuildInputs = [
    ...

    # `hs-bindgen` client.
    pkgs.hs-bindgen-cli

    # Connect `hs-bindgen` to the Clang toolchain and `libpcap`.
    pkgs.hsBindgenHook
  ];
};
```

The [overlay provided by the `hs-bindgen` Nix Flake](https://github.com/well-typed/hs-bindgen/blob/main/nix/overlay/default.nix):
- Adds `hs-bindgen` relevant packages to the Haskell package sets (i.e.,
`haskell.packages.ghc*`). In particular, it also adds [`libclang-bindings`](https://github.com/well-typed/libclang),
which is not yet available on Hackage nor in Nixpkgs.
- Provides [the function `generateBindings`](https://github.com/well-typed/hs-bindgen/blob/main/nix/hs-bindgen-lib.nix) in the `haskell.lib.compose`
  attribute set. The function `generateBindings` executes the provided binding
  generation script during build.
- Provides the `hs-bindgen-cli` as well as `hsBindgenHook` packages.

Interestingly, [`hsBindgenHook`](#hs-bindgen-hook) picks up `libpcap`, which is defined as a
dependency in the Cabal file. Enter the development shell

```console
$ nix develop
```

Let's analyze the environment set up by [`hsBindgenHook`](#hs-bindgen-hook):

```console
$ echo $BINDGEN_EXTRA_CLANG_ARGS
...
-isystem /nix/store/0crnzrvmjwvsn2z13v82w71k9nvwafbd-libpcap-1.10.5/include
...
```

The environment variable `BINDGEN_EXTRA_CLANG_ARGS` is used by `hs-bindgen` and
forwarded to `libclang`. For details, see [the `hs-bindgen` manual section on
Clang options](https://github.com/well-typed/hs-bindgen/blob/main/manual/LowLevel/ClangOptions.md).

Then, generate bindings with the provided script:

```console
$ ./generate-bindings
```

The [`generate-bindings` script](./hs-pcap-client/generate-bindings) is well documented, please have a look at
the different command line flags. In particular, analyze the parse and select
flags which determine the set of translated declarations. In the following, we
will highlight some selected command line flags:

- __`--unique-id`__: C does not have explicit namespaces but only maintains
  separate declaration spaces (e.g, `struct foo` vs `foo`). We use a unique
  identifier to discriminate global C identifiers, ensuring that bindings do not
  clash. This is also relevant when libraries have common dependencies, and
  external binding specifications are not used.
- [__Parse and select predicates__](https://github.com/well-typed/hs-bindgen/blob/main/manual/LowLevel/ParsingSelectingAndProgramSlicing.md): Parse predicates determine the
  declarations `hs-bindgen` tries to parse and reify; select predicates
  determine the declarations to translate.
- __`--select-by-header-path`__: Select all declarations in header files with
  file paths matching the provided Perl-compatible regular expression. By
  default, `hs-bindgen` selects all declarations in the provided main header
  file. However, the main header `pcap.h` does not declare anything but only
  imports sub-headers, so we need to provide this option.
- __`--enable-program-slicing`__: Do not only select declarations that match the
  select predicate but all transitive dependencies.

We generated the script using an iterative procedure, adding and removing
command line flags as required. The script should generate several files in
folder `./src/Generated/` that you are encouraged to inspect. In particular, we
separate bindings into modules exposing different binding categories. For
example. `./src/Generated/Pcap.hs` exposes types, whereas
`./src/Generated/Pcap/Safe.hs` and `./src/Generated/Pcap/Unsafe.hs` expose
[`safe` and `unsafe` versions of foreign imports](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/ffi.html). The `Safe` and `Unsafe`
modules export the same identifiers, and the user has to choose one of them, or
import them qualified.

> [!TIP]
> There is an [excellent Haskell Unfoldr episode](https://www.youtube.com/watch?v=IMrBTx7aYjs&list=PLD8gywOEY4HaG5VSrKVnHxCptlJv2GAn7&index=36) about safe and unsafe
> foreign function imports.

### Compile and run `hs-pcap-client` project

After generating the bindings, compile and run the test application using
standard commands. We have prepared a [Cabal package](./hs-pcap-client/hs-pcap-client.cabal):

```console
$ cabal build
```

Have a look at the [application code `./app/Pcap.hs`](./hs-pcap-client/app/Pcap.hs).

Building the project requires the `libpcap` shared object files which are
provided by Nix,

```console
$ echo $NIX_CFLAGS_COMPILE
...
-isystem /nix/store/0crnzrvmjwvsn2z13v82w71k9nvwafbd-libpcap-1.10.5/include
...
```

`NIX_CFLAGS_COMPILE` is a Nix-specific environment variable. The wrapper for the
C compiler provided by Nix uses `NIX_CFLAGS_COMPILE` to inject extra C compiler
flags.

You can also set the `package.<name>.extra-include-dirs` and
`package.<name>.extra-lib-dirs` stanzas in your `cabal.project` or
`cabal.project.local` files.

On my machine, running the program produces the following output:

```console
$ cabal run
List of network devices found on your machine:
  - wlp0s20f3
  - any
  - lo
  - enp0s13f0u3u4u4
  - nflog
  - nfqueue
```

### Access documentation

We use the types and Doxygen comments to create documentation for the generated
bindings. The Haskell pipeline implemented in Nix builds documentation by
default, which can be accessed quite easily. Create a symlink `result-doc` to
the documentation:

```console
$ nix build .#hs-pcap-client.doc
```

On my machine, the path to the documentation is

```console
result-doc/share/doc/hs-pcap-client-0.1.0.0/html/index.html
```

`libpcap` does not provide Doxygen comments, and the documentation only contains
type signatures and location information; but even so, the documentation is
already quite useful.

### Create and inspect include graph

`hs-bindgen` can also create include graphs for you. In particular, we can
create and visualize the include graph for `libpcap`. To this end,execute

```console
$ ./generate-include-graph
```

![Include graph](./hs-pcap-client/pcap.svg)

Include graphs can be tremendously helpful while adapting the command line flags
to parse and select the desired declarations. For a more involved example of how
to create and use include graphs, see the [`wlroots` tutorial](../hs-wlroots).

## Method B: Template-Haskell interface

The Template-Haskell (TH) interface of `hs-bindgen` allows direct inclusion
(a'la `#include`) of C header files into Haskell source code. Thereby,
`hs-bindgen` generates Haskell bindings to the C header files at compile time.
This has the advantage that the user does not need to perform additional
compilation steps, but can directly use the generated bindings. Also, changes to
the C header files directly propagate into the Haskell source code, and there is
no need to manage additional files containing the generated bindings.

In TH mode, it may be harder for you to tune the `hs-bindgen` configuration,
especially when translating C libraries that require detailed configuration.
Also, the generated bindings are less readily available, and we need compiler
flags to observe them (see the Section [Inspect generated bindings](#inspect-generated-bindings) below).

### Inspect and compile the application

Change your current working directory to the `hs-pcap-th` sub-project using the TH
interface of `hs-bindgen`,

```console
$ cd hs-pcap-th
```

Build and run the application,

```console
$ nix run
```

The output should be the same list of network devices as before.

The provided Nix development shell is similar to the one from `hs-pcap-client`;
however, please note the following workaround to connect Haskell Language Server
with the `libpcap`:

```nix
devShells = {
  default = hpkgs.shellFor {
    packages = _: [ hs-pcap-th ];

    ...

    # We need to add the `libpcap` library to `LD_LIBRARY_PATH` manually
    # here because otherwise Haskell Language Server does not find it.
    # Nix tooling ensures that other parts of the Haskell toolchain
    # (e.g., `cabal`, `ghc`) find the shared libraries of dependencies
    # without the need to temper with `LD_LIBRARY_PATH`.
    shellHook = ''
      LD_LIBRARY_PATH="${pkgs.libpcap.lib}/lib''${LD_LIBRARY_PATH:+:''${LD_LIBRARY_PATH}}"
      export LD_LIBRARY_PATH
    '';
  };
};
```

Enter the provided development shell

```console
$ nix develop
```

and inspect the [application code `./app/Pcap.hs`](./hs-pcap-th/app/Pcap.hs). The development shell
provides the Haskell Language Server (HLS), and ensures HLS can compile the
project and link to the shared `pcap` library.

The TH function generating the `hs-bindgen` splice is

```haskell
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
```

Most of this code defines the appropriate parse and select predicates; compare
with the [respective command line flags of the client example](./hs-pcap-client/generate-bindings).

Some notes:
- In TH mode, we do not have to set a __`unique-id`__; `hs-bindgen`
  automatically generates one using TH features
  (`Language.Haskell.TH.location`).

### Documentation

Also in TH mode, `hs-bindgen` generates documentation for translated functions,
and HLS can show the automatically generated documentation. For example,
navigate your cursor to `pcap_findalldevs`

```haskell
pcap_findalldevs :: Ptr (Ptr Pcap_if_t) -> Ptr CChar -> IO CInt
```

```markdown
Defined at /path/to/Pcap.hs:24:1

__C declaration__:   pcap_findalldevs
__defined at__:      pcap/pcap.h:795:14
__exported by__:     pcap.h
```

### Inspect generated bindings

Further, we can inspect the code generated during compile time using GHC
options. In particular, we can [debug the compiler using `ddump-slices`](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/debugging.html#ghc-flag-ddump-splices) by
adding

```haskell
{-# OPTIONS_GHC -ddump-splices #-}
```

to the top of the file. For example, the generated code corresponding to the documentation
of `pcap_finalldevs` above is

```haskell
foreign import ccall safe
  "hs_bindgen_hspcap0_1_0_0inplacehspcapbin_172d2c8dfa18cccf" pcap_findalldevs
  :: Foreign.Ptr (Foreign.Ptr Pcap_if_t)
     -> Foreign.Ptr C.CChar -> IO C.CIn
```

> [!TIP]
>
> Have a look at [section about setting the GHC or LLVM toolchain versions](#use-specific-versions-of-the-ghc-or-clang-toolchains).

## Appendix

### System environment

#### Client wrapper

The Nix Flake wraps the client `hs-bindgen-cli` so that it knows where the Clang
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

In particular (see the [Clang command line argument reference](https://clang.llvm.org/docs/ClangCommandLineReference.html)),

- `-B/nix/store/82kmz7r96navanrc2fgckh2bamiqrgsw-gcc-14.3.0/lib/gcc/x86_64-unknown-linux-gnu/14.3.0`,
  and `--gcc-toolchain=/nix/store/82kmz7r96navanrc2fgckh2bamiqrgsw-gcc-14.3.0`:
  Use and search GCC toolchain for executables, libraries, and data files.
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

#### `hs-bindgen` hook

We also provide a [setup hook](https://nixos.org/manual/nixpkgs/stable/#ssec-setup-hooks) that can be used by projects depending on
`hs-bindgen` during their build process. [The `hs-bindgen` setup hook](https://github.com/well-typed/hs-bindgen/blob/main/nix/hs-bindgen/hs-bindgen-hook.sh)
performs the same setup as the wrapper discussed in the section [Client
wrapper](#client-wrapper) above. The `hs-bindgen` setup hook can be used like other setup
hooks by adding it to `buildInputs` or `propagatedBuildInputs`.

To inspect the `hs-bindgen` setup hook, run

```sh
nix build -o hs-bindgen-hook .#hsBindgenHook
cat hs-bindgen-hook/nix-support/setup-hook
```

For example,

```sh
# Populate additional environment variables required by `hs-bindgen`.

# NOTE: Use this setup hook when building packages with `hs-bindgen`. The client
# requires a separate wrapper (doh !) which is defined in `hs-bindgen-cli.nix`.
# Please keep this setup hook and the wrapper synchronized!
populateHsBindgenEnv() {
    # Inform `hs-bindgen` about Nix-specific `CFLAGS` and `CCFLAGS`. In contrast
    # to `rust-bindgen-hook.sh` (see Nixpkgs), we do not set `CXXFLAGS`.
    BINDGEN_EXTRA_CLANG_ARGS="$(</nix/store/fbfcll570w9vimfbh41f9b4rrwnp33f3-clang-wrapper-19.1.7/nix-support/cc-cflags) $(</nix/store/fbfcll570w9vimfbh41f9b4rrwnp33f3-clang-wrapper-19.1.7/nix-support/libc-cflags) $NIX_CFLAGS_COMPILE"
    export BINDGEN_EXTRA_CLANG_ARGS

    # Inform `hs-bindgen` that it does not have to perform heuristic search for
    # the builtin include directory. (We set the builtin include directory using
    # `BINDGEN_EXTRA_CLANG_ARGS`).
    BINDGEN_BUILTIN_INCLUDE_DIR=disable
    export BINDGEN_BUILTIN_INCLUDE_DIR

    # ...
}

postHook="${postHook:-}"$'\n'"populateHsBindgenEnv"$'\n'
```

### Use specific versions of the GHC or Clang toolchains

> [!NOTE]
> As of 2026, January 8, pinning the version of LLVM is problematic because
> the build is cached. See the corresponding [GitHub issue](https://github.com/well-typed/hs-bindgen-tutorial-nix/issues/2) for more details.

One possibility to specify the GHC toolchain is to simply use a different
Haskell package set. For example, building the `hs-pcap-client` project with GHC
9.12 only requires a small change in the Nix Flake:

```nix
...
hpkgs = pkgs.haskell.packages.ghc912;
...
```

Changing the version of the Clang toolchain requires an overlay. For example,
using `libclang` version 20 with the `hs-pcap-client` project:

```nix
useLlvm20 = final: prev: {
  llvmPackages = final.llvmPackages_20;
};
pkgs = import nixpkgs {
  inherit system;
  overlays = [
    hs-bindgen.overlays.default
    useLlvm20
  ];
};
```

Note that even when you have `clang` version 19 in your path, `hs-bindgen` uses
`clang` version 20 when the above overlay is activated. You can see this by
inspecting `BINDGEN_EXTRA_CLANG_ARGS` when the development shell is active:

```console
$ echo $BINDGEN_EXTRA_CLANG_ARGS
...
-resource-dir=/nix/store/8s647qbgn3yy2l52ykznsh0xkvgcrqhx-clang-wrapper-20.1.8/resource-root
...
```

## Notes

> [!IMPORTANT]
> Last update: January 8, 2026. The [upstream Nix Flake](https://github.com/well-typed/hs-bindgen) may have received
> updates in the meantime.
