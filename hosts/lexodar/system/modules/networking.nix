{ config, pkgs, ... }:

{
  networking = {
    hostName = "lexodar";
    hostId = "007f0200";

    nameservers = ["192.168.1.17"];

    firewall = {
      allowedTCPPorts = [
        22     # SSH
        80 443 # HTTP/HTTPS
        53     # DNS
        2222   # SFTP
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
