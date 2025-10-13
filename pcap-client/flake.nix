{
  description = "`hs-bindgen` tutorial: Client project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    hs-bindgen.url = "github:dschrempf/hs-bindgen-flake";
  };

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      hs-bindgen,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        {
          pkgs,
          system,
          ...
        }:
        let
          hpkgs = pkgs.haskellPackages;
          hlib = pkgs.haskell.lib.compose;
          pcap-client = hlib.overrideCabal (drv: {
            executableToolDepends = (drv.executableToolDepends or [ ]) ++ [
              pkgs.hs-bindgen-cli
              pkgs.hsBindgenHook
            ];
            postUnpack = ''
              ${drv.postUnpack or ""}
              (cd pcap-client; ${pkgs.bash}/bin/bash ${./generate-bindings})
            '';
          }) (hpkgs.callCabal2nix "pcap-client" ./. { });
        in
        {
          _module.args.pkgs = import nixpkgs {
            inherit system;
            overlays = [ hs-bindgen.overlays.default ];
          };

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
              ];
            };
          };
        };
    };
}
