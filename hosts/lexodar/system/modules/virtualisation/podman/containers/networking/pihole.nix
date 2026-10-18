let
  containerEnvironments = {
    # https://docs.pi-hole.net/ftldns/configfile

    FTLCONF_dns_upstreams = "1.1.1.1";
    FTLCONF_dns_dnssec = "true";
    FTLCONF_dns_listeningMode = "ALL";
    FTLCONF_dns_revServers = "true,192.168.1.0/192.168.1.1,livebox.home";

    FTLCONF_webserver_domain = "pihole.leafayon.lan";
    FTLCONF_webserver_interface_boxed = "false";

    FTLCONF_misc_dnsmasq_lines = "address=/leafayon.lan/192.168.1.17";
  };
in

{
  lexopod.containers.pihole = {
    imageName = "pihole/pihole";
    imageTag = "2026.07.2";

    environments = containerEnvironments;

    capabilities = {
      CHOWN = true;
      NET_ADMIN = true;
      NET_BIND_SERVICE = true;
      SYS_NICE = true;
    };

    caddySupport = true;
    caddyServicePort = 80;

    networks = ["proxy:ip=10.89.0.2"];
    ports = [
      "53:53/tcp"
      "53:53/udp"
    ];

    volumes = ["pihole-config:/etc/pihole"];
  };
}
