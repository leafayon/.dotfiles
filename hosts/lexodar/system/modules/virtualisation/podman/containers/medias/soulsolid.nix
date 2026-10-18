let
  containerEnvironments = {
    ACOUSTID_CLIENT_KEY_FILE = "/secrets/ACOUSTID_CLIENT_KEY";
  };
in

{
  lexopod.containers.soulsolid = {
    imageName = "contre95/soulsolid";
    #imageTag = "v0.26.0";
    imageTag = "feat-feat-env_files";

    environments = containerEnvironments;

    secretSupport = true;

    caddySupport = true;
    caddyServicePort = 3535;

    networks = ["proxy:ip=10.89.0.12"];

    volumes = [
      "soulsolid-data:/data"

      "/mnt/stormwind/podman/volumes/soulsolid-config:/config"
      "/mnt/stormwind/podman/volumes/soulsolid-logs:/app/logs"

      "/mnt/stormwind/medias/downloads/musics:/app/downloads"
      "/mnt/stormwind/medias/jellyfin/musics:/app/library"
    ];
  };
}
