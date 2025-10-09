{
  description = "`hs-bindgen` tutorial: Template Haskell project";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  inputs.hs-bindgen.url = "github:dschrempf/hs-bindgen-flake";

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
      hs-bindgen,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ hs-bindgen.overlays.default ];
        };
        hpkgs = pkgs.haskellPackages;
        pcap-th = hpkgs.callCabal2nix "pcap-th" ./. { };
      in
      {
        packages = {
          inherit pcap-th;
          default = pcap-th;
        };
        devShells = {
          default = hpkgs.shellFor {
            packages = _: [ pcap-th ];
            nativeBuildInputs = [
              # Haskell toolchain.
              hpkgs.cabal-install
              hpkgs.ghc
              hpkgs.haskell-language-server

              # Connect `hs-bindgen` to the Clang toolchain and `libpcap`.
              pkgs.hsBindgenHook
            ];
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
      }
    );
}
