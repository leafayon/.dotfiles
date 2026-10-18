{
  lexopod.containers.vaultwarden.environments = {
    DOMAIN = "https://vaultwarden.leafayon.lan";
  };

  lexopod.containers.vaultwarden = {
    imageName = "vaultwarden/server";
    imageTag = "1.37.3";

    caddySupport = true;
    caddyPort = 80;

    networks = ["proxy:ip=10.10.0.20"];

    volumes = ["vaultwarden-data:/data"];
  };
}