# Generate Haskell bindings from C header files with `hs-bindgen`

In this tutorial, we showcase the automatic generation of Haskell bindings with
[`hs-bindgen`](https://github.com/well-typed/hs-bindgen) on selected libraries:

### [Example 1: `pcap`](./hs-pcap)
[`libpcap`](https://github.com/the-tcpdump-group/libpcap) is an interface to various kernel packet capture mechanisms. We
present two methods to generate Haskell bindings and use the generated bindings
to print the list of network devices available on the local machine. The
tutorial on `pcap` is available in the [`hs-pcap` _sub-folder of this
repository_](./hs-pcap/).

### [Example 2: `wlroots`](./hs-wlroots)
[`wlroots`](https://gitlab.freedesktop.org/wlroots/wlroots) is a modular Wayland compositor library. The `wlroots` project is
more complex than `libpcap` and depends on non-system libraries such as
[Wayland](https://gitlab.freedesktop.org/wayland/wayland) and [Pixman](https://www.pixman.org/). Therefore, we split the generation of Haskell
bindings into several library components. We use external binding specifications
to inform higher-level library components about types defined in lower-level
library components. The tutorial on `wlroots` is available in the [`hs-wlroots`
_sub-folder of this repository_](./hs-wlroots/).

> [!NOTE]
> In both cases we use the [Nix package manager](https://nixos.org/download/) to manage installation of
> `hs-bindgen` and other system dependencies.

> [!IMPORTANT]
> Last update: January 13, 2026. The [upstream Nix Flake](https://github.com/well-typed/hs-bindgen) may have received
> updates in the meantime.
