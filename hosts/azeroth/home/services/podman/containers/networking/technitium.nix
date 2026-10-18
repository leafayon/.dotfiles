{
  lexopod.containers.technitium.environments = {
    DNS_SERVER_DOMAIN = "technitium.leafayon.lan";

    DNS_SERVER_ADMIN_PASSWORD_FILE="/secrets/ADMIN_PASSWORD";

    DNS_SERVER_LOG_FOLDER_PATH = "/var/log/technitium/dns";
  };

  lexopod.containers.technitium = {
    imageName = "docker.io/technitium/dns-server";
    imageTag = "15.6.0";

    secretSupport = true;

    caddySupport = true;
    caddyPort = 5380;

    networks = ["proxy:ip=10.10.0.2"];
    ports = [
      "53:53/tcp"
      "53:53/udp"
    ];

    volumes = [
      "technitium-config:/etc/dns"
      "technitium-logs:/var/log/technitium/dns"
    ];
  };
}
