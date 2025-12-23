{
  description = "`hs-bindgen` tutorial: Wlroots project";

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
          hlib = pkgs.haskell.lib.compose;
          hs-wlroots = hlib.generateBindings ./generate-bindings (hpkgs.callCabal2nix "hs-wlroots" ./. { });
          wlroots = pkgs.wlroots_0_19;
        in
        {
          packages = {
            inherit hs-wlroots;
            inherit (pkgs) hs-bindgen-cli;
            default = hs-wlroots;
          };

          devShells = {
            default = hpkgs.shellFor {
              packages = _: [ hs-wlroots ];
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
              buildInputs = [
                # Wlroots dependencies.
                pkgs.pixman
                pkgs.wayland
                wlroots
              ];
              shellHook = ''
                # The Wlroots headers reside in a weird sub-path.
                BINDGEN_EXTRA_CLANG_ARGS="-isystem ${wlroots}/include/wlroots-0.19 ''${BINDGEN_EXTRA_CLANG_ARGS}"
                export BINDGEN_EXTRA_CLANG_ARGS
                C_INCLUDE_PATH="${wlroots}/include/wlroots-0.19''${C_INCLUDE_PATH:+:''${C_INCLUDE_PATH}}"
                export C_INCLUDE_PATH
                LD_LIBRARY_PATH="${wlroots}/lib''${LD_LIBRARY_PATH:+:''${LD_LIBRARY_PATH}}"
                export LD_LIBRARY_PATH
              '';
            };
          };
        };
    };
}
