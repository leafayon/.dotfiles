let
  containerEnvironments = {
    HTTP_CONTROL_SERVER_AUTH_CONFIG_FILEPATH = "/gluetun/config.toml";

    DNS_UPSTREAM_RESOLVERS = "cloudflare,quad9";
    DNS_UPSTREAM_IPV6 = "on";

    WIREGUARD_PRIVATE_KEY_SECRETFILE = "/secrets/WIREGUARD_PRIVATEKEY";

    VPN_SERVICE_PROVIDER = "protonvpn";
    VPN_TYPE = "wireguard";
    VPN_PORT_FORWARDING = "on";
    #VPN_HEALTHCHECK_ENABLED = "false";

    # Proton VPN Options
    #FREE_ONLY = "on";
    SERVER_COUNTRIES = "Belgium,Luxembourg,Switzerland";
    PORT_FORWARD_ONLY = "on";
  };
in

{
  lexopod.containers.gluetun = {
    imageName = "qmcgaw/gluetun";
    imageTag = "v3.41.3";

    environments = containerEnvironments;

    capabilities = {
      NET_ADMIN = true;
      NET_RAW = true;
    };

    secretSupport = true;

    networks = ["proxy:ip=10.89.0.5"];
    ports = ["8081:8081"];

    volumes = [
      "gluetun-config:/gluetun"

      "/dev/net/tun:/dev/net/tun"

      "/mnt/stormwind/podman/volumes/gluetun_forwarded-port:/tmp/gluetun/forwarded_port"
    ];
  };
}