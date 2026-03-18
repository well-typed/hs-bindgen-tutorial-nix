{
  description = "`hs-bindgen` tutorial: Template Haskell project";

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
      imports = [ ];
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
          hs-pcap-th = hpkgs.callCabal2nix "hs-pcap-th" ./. { };
        in
        {
          packages = {
            inherit hs-pcap-th;
            default = hs-pcap-th;
          };

          devShells = {
            default = hpkgs.shellFor {
              packages = _: [ hs-pcap-th ];
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
        };
    };
}
