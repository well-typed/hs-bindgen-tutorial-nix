{
  description = "`hs-bindgen` tutorial: Client project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    hs-bindgen.url = "github:well-typed/hs-bindgen";
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
        { system, ... }:
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ hs-bindgen.overlays.default ];
          };
          hpkgs = pkgs.haskellPackages;
          hlib = pkgs.haskell.lib.compose;
          hs-pcap-client = hlib.generateBindings ./generate-bindings (
            hpkgs.callCabal2nix "hs-pcap-client" ./. { }
          );
        in
        {
          packages = {
            hs-pcap-client = hs-pcap-client;
            inherit (pkgs) hs-bindgen-cli;
            default = hs-pcap-client;
          };

          devShells = {
            default = hpkgs.shellFor {
              packages = _: [ hs-pcap-client ];
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
