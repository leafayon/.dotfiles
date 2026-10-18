{
  lexopod.containers.seerr = {
    imageName = "ghcr.io/seerr-team/seerr";
    imageTag = "v3.4.1";

    caddySupport = true;
    caddyServicePort = 5055;

    networks = ["proxy:ip=10.89.0.11"];

    volumes = ["seerr-config:/app/config"];
  };
}