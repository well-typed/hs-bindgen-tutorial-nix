{
  description = "`hs-bindgen` Nix tutorial";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    hs-pcap-client.url = "path:./hs-pcap/hs-pcap-client";
    hs-pcap-th.url = "path:./hs-pcap/hs-pcap-th";
    hs-wlroots.url = "path:./hs-wlroots";
  };

  outputs =
    inputs@{
      flake-parts,
      hs-pcap-client,
      hs-pcap-th,
      hs-wlroots,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ];
      systems = [
        # "aarch64-darwin"
        # "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      perSystem =
        { system, ... }:
        {
          checks = {
            hs-bindgen-cli-check = hs-pcap-client.packages.${system}.hs-bindgen-cli;
            hs-pcap-client-check = hs-pcap-client.packages.${system}.hs-pcap-client;
            hs-pcap-th-check = hs-pcap-th.packages.${system}.hs-pcap-th;
            hs-wlroots-check = hs-wlroots.packages.${system}.hs-wlroots;
          };
        };
    };
}
