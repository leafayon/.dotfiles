let
  containerEnvironments = {
    JELLYFIN_PublishedServerUrl = "https://jellyfin.leafayon.lan";
  };
in

{
  lexopod.containers.jellyfin = {
    imageName = "jellyfin/jellyfin";
    imageTag = "12.0";

    environments = containerEnvironments;

    caddySupport = true;
    caddyServicePort = 8096;

    networks = ["proxy:ip=10.89.0.10"];

    volumes = [
      "jellyfin-config:/config"
      "jellyfin-cache:/cache"

      "/mnt/stormwind/medias/jellyfin/movies:/medias/movies"
      "/mnt/stormwind/medias/jellyfin/shows:/medias/shows"
      "/mnt/stormwind/medias/jellyfin/musics:/medias/musics"
    ];
  };
}
