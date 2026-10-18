{
  virtualisation.oci-containers.containers.immich-postgres = {
    image = "ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0@sha256:bcf63357191b76a916ae5eb93464d65c07511da41e3bf7a8416db519b40b1c23";

    environmentFiles = [
      "/mnt/stormwind/podman/envs/commun.env"
      "/mnt/stormwind/podman/envs/immich.env"
    ];

    networks = ["immich:ip=10.89.1.3"];

    volumes = [
      "/etc/localtime:/etc/localtime:ro"

      "/mnt/stormwind/podman/volumes/immich_postgres-data:/var/lib/postgresql/data:U"
    ];
  };

  virtualisation.oci-containers.containers.immich-redis = {
    image = "docker.io/valkey/valkey:9@sha256:4963247afc4cd33c7d3b2d2816b9f7f8eeebab148d29056c2ca4d7cbc966f2d9";

    environmentFiles = ["/mnt/stormwind/podman/envs/commun.env"];

    networks = ["immich:ip=10.89.1.4"];
  };
}

{
  lexopod.containers.immich = {
    imageName = "ghcr.io/immich-app/immich-server:v3.1.0";
    imageTag = "v3.1.0";

    envSupport = true;

    caddySupport = true;
    caddyServicePort = 2283;

    networks = ["proxy:ip=10.89.0.14"];

    volumes = [
      "/etc/localtime:/etc/localtime:ro"

      "/mnt/stormwind/medias/immich:/data"
    ];
  };

  {
    lexopod.containers.immich = {
      imageName = "jellyfin/jellyfin";
      imageTag = "10.11.11";

      envSupport = true;

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

  {
    lexopod.containers.immich = {
      imageName = "jellyfin/jellyfin";
      imageTag = "10.11.11";

      envSupport = true;

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
}
