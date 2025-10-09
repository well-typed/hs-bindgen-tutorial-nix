{
  description = "`hs-bindgen` tutorial: Client project";

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
        # TODO: I don't know why `mermaid-cli` triggers a Chromium rebuild using
        # the `hs-bindgen` overlay, but here we go.
        defPkgs = import nixpkgs {
          inherit system;
        };
        hpkgs = pkgs.haskellPackages;
        hlib = pkgs.haskell.lib.compose;
        pcap-client = hlib.overrideCabal (drv: {
          executableToolDepends = (drv.executableToolDepends or [ ]) ++ [
            pkgs.hs-bindgen-cli
            pkgs.hsBindgenHook
          ];
          postUnpack = ''
            ${drv.postUnpack or ""}
            (cd pcap-client; ${pkgs.bash}/bin/bash generate-bindings)
          '';
        }) (hpkgs.callCabal2nix "pcap-client" ./. { });
      in
      {
        packages = {
          inherit pcap-client;
          inherit (pkgs) hs-bindgen-cli;
          default = pcap-client;
        };
        devShells = {
          default = hpkgs.shellFor {
            packages = _: [ pcap-client ];
            nativeBuildInputs = [
              # Haskell toolchain.
              hpkgs.cabal-install
              hpkgs.ghc
              hpkgs.haskell-language-server

              # `hs-bindgen` client.
              pkgs.hs-bindgen-cli

              # Connect `hs-bindgen` to the Clang toolchain and `libpcap`.
              pkgs.hsBindgenHook

              # Misc.
              defPkgs.mermaid-cli
            ];
          };
        };
      }
    );
}
