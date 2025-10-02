{
  description = "`hs-bindgen` client";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

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
        hlib = pkgs.haskell.lib.compose;
        hs-pcap = hlib.overrideCabal (drv: {
          executableToolDepends = (drv.executableToolDepends or [ ]) ++ [
            pkgs.hs-bindgen-cli
            pkgs.libpcap
            pkgs.hsBindgenHook
          ];
          postUnpack = ''
            ${drv.postUnpack or ""}
            (cd pcap-client; ${pkgs.bash}/bin/bash generate-bindings)
          '';
        }) (hpkgs.callCabal2nix "hs-pcap" ./. { });
      in
      {
        packages = {
          inherit hs-pcap;
          default = hs-pcap;
        };
        devShells = {
          default = hpkgs.shellFor {
            packages = _: [ hs-pcap ];
            nativeBuildInputs = [
              # Haskell toolchain.
              hpkgs.cabal-install
              hpkgs.ghc
              hpkgs.haskell-language-server

              # `hs-bindgen` client.
              pkgs.hs-bindgen-cli

              # Connect `hs-bindgen` to the Clang toolchain and `libpcap`.
              pkgs.hsBindgenHook
              pkgs.libpcap
            ];
          };
        };
      }
    );
}
