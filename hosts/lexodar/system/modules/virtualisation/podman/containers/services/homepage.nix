let
  containerEnvironments = {
    HOMEPAGE_ALLOWED_HOSTS = "dashboard.leafayon.lan";

    HOMEPAGE_FILE_IMMICH_KEY = "/secrets/IMMICH_KEY";
    HOMEPAGE_FILE_JELLYFIN_KEY = "/secrets/JELLYFIN_KEY";
    HOMEPAGE_FILE_QBITTORRENT_KEY = "/secrets/QBITTORRENT_KEY";
    HOMEPAGE_FILE_SEERR_KEY = "/secrets/SEERR_KEY";

    HOMEPAGE_FILE_PIHOLE_APP_PASSWORD = "/secrets/PIHOLE_APP_PASSWORD";
    HOMEPAGE_FILE_GLUETUN_KEY = "/secrets/GLUETUN_KEY";

    HOMEPAGE_FILE_GOTIFY_TOKEN = "/secrets/GOTIFY_TOKEN";
  };
in

{
  lexopod.containers.homepage = {
    imageName = "ghcr.io/gethomepage/homepage";
    imageTag = "v2.2.0";

    environments = containerEnvironments;

    socketSupport = true;
    secretSupport = true;

    caddySupport = true;
    caddyDomainName = "dashboard";
    caddyServicePort = 3000;

    networks = ["proxy:ip=10.89.0.23"];

    volumes = ["/mnt/stormwind/podman/volumes/homepage-config:/app/config"];
  };
}
