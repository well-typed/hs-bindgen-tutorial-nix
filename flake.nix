{
  description = "`hs-bindgen` development environment";

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
      in
      {
        packages = {
          hs-bindgen-cli = pkgs.hs-bindgen-cli;
          default = pkgs.hs-bindgen-cli;
        };
      }
    );
}
