{
  description = "`hs-bindgen` Nix tutorial";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    pcap-client.url = "path:./pcap-client";
    pcap-th.url = "path:./pcap-th";
  };

  outputs =
    inputs@{
      flake-parts,
      pcap-client,
      pcap-th,
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
        {
          checks = {
            hs-bindgen-cli-check = pcap-client.packages.${system}.hs-bindgen-cli;
            pcap-client-check = pcap-client.packages.${system}.pcap-client;
            pcap-th-check = pcap-th.packages.${system}.pcap-th;
          };
        };
    };
}
