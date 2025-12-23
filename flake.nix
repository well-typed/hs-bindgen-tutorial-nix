{
  description = "`hs-bindgen` Nix tutorial";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    pcap-client.url = "path:./pcap-client";
    pcap-th.url = "path:./pcap-th";
    hs-wlroots.url = "path:./hs-wlroots";
  };

  outputs =
    inputs@{
      flake-parts,
      pcap-client,
      pcap-th,
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
            hs-bindgen-cli-check = pcap-client.packages.${system}.hs-bindgen-cli;
            pcap-client-check = pcap-client.packages.${system}.pcap-client;
            pcap-th-check = pcap-th.packages.${system}.pcap-th;
            # TODO: Check fails because the shell hook sets up some paths and is not executed.
            # hs-wlroots-check = hs-wlroots.packages.${system}.hs-wlroots;
          };
        };
    };
}
