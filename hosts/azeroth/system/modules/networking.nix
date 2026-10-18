{ config, pkgs, ... }:

{
  networking = {
    hostName = "azeroth";
    hostId = "007f0200";

    nameservers = ["1.1.1.1"];

    firewall = {
      allowedTCPPorts = [
        22     # SSH
        80 443 # HTTP/HTTPS
        53     # DNS
        51820  # Wireguard
      ];
      allowedUDPPorts = [
        53    # DNS
        443   # HTTPS
        51820 # Wireguard
      ];
    };
  };
}
