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

          # NOTE Work around some `wlroots` quirks. In particular, the `wlroots`
          # headers reside in a weird sub-path, and `callCabal2nix` does not
          # detect the transitive dependencies `wayland` and `pixman`. Please
          # correct me, if there is an easier way of pointing `hs-bindgen` to
          # the required headers and shared libraries!
          wlroots = pkgs.wlroots_0_19;
          wlrootsDeps = [
            pkgs.pixman
            pkgs.wayland
            wlroots
          ];
          wlrootsHook = ''
            # The `wlroots` headers reside in a weird sub-path.
            BINDGEN_EXTRA_CLANG_ARGS="-isystem ${wlroots}/include/wlroots-0.19 ''${BINDGEN_EXTRA_CLANG_ARGS}"
            export BINDGEN_EXTRA_CLANG_ARGS
            C_INCLUDE_PATH="${wlroots}/include/wlroots-0.19''${C_INCLUDE_PATH:+:''${C_INCLUDE_PATH}}"
            export C_INCLUDE_PATH
            LD_LIBRARY_PATH="${wlroots}/lib''${LD_LIBRARY_PATH:+:''${LD_LIBRARY_PATH}}"
            export LD_LIBRARY_PATH
          '';
          applyHook = (
            hlib.overrideCabal (drv: {
              librarySystemDepends = (drv.executableToolDepends or [ ]) ++ wlrootsDeps;
              postUnpack = ''
                ${drv.postUnpack or ""}
                ${wlrootsHook}
              '';
            })
          );
          genBindings = hlib.generateBindings ./generate-bindings;
          hs-wlroots-base = hpkgs.callCabal2nix "hs-wlroots" ./. { };

          hs-wlroots = genBindings (applyHook hs-wlroots-base);
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

                # Connect `hs-bindgen` to the Clang toolchain and libraries.
                pkgs.hsBindgenHook
              ];
              # We need to apply the hook again :-|.
              shellHook = wlrootsHook;
            };
          };
        };
    };
}
