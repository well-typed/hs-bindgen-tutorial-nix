{
  description = "`hs-bindgen` Nix tutorial";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.pcap-client.url = "path:./pcap-client";

  inputs.pcap-th.url = "path:./pcap-th";

  outputs =
    {
      self,
      flake-utils,
      pcap-client,
      pcap-th,
    }:
    flake-utils.lib.eachDefaultSystem (system: {
      checks = {
        hs-bindgen-cli-check = pcap-client.packages.${system}.hs-bindgen-cli;
        pcap-client-check = pcap-client.packages.${system}.pcap-client;
        pcap-th-check = pcap-th.packages.${system}.pcap-th;
      };
    });
}
