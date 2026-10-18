let
  containerEnvironments = {
    PUID = "1000";
    PGID = "100";

    DOCKER_MODS = "ghcr.io/vuetorrent/vuetorrent-lsio-mod:latest";

    FILE__TORRENTING_PORT = "/config/torrenting_port";
  };
in

{
  lexopod.containers.qbittorrent = {
    imageName = "linuxserver/qbittorrent";
    imageTag = "5.2.3";

    environments = containerEnvironments;

    vpnSupport = true;
    caddySupport = true;
    caddyDomainName = "qbittorrent";
    caddyServicePort = 8080;

    volumes = [
      "qbittorrent-config:/config"

      "/mnt/stormwind/podman/volumes/gluetun_forwarded-port:/config/torrenting_port:ro"

      "/mnt/stormwind/medias/downloads/torrents:/downloads"
    ];
  };
}
