{
  lexopod.containers.autobrr = {
    imageName = "ghcr.io/autobrr/autobrr";
    imageTag = "latest";

    caddySupport = true;
    caddyServicePort = 7474;

    networks = ["proxy:ip=10.89.0.14"];

    volumes = ["/mnt/stormwind/podman/volumes/autobrr-config:/config"];
  };
}