let
  containerEnvironments = {
    DOMAIN = "https://vaultwarden.leafayon.lan";
  };
in

{
  lexopod.containers.vaultwarden = {
    imageName = "vaultwarden/server";
    imageTag = "1.37.3";

    environments = containerEnvironments;

    caddySupport = true;
    caddyServicePort = 80;

    networks = ["proxy:ip=10.89.0.22"];

    volumes = ["vaultwarden-data:/data:U"];
  };
}