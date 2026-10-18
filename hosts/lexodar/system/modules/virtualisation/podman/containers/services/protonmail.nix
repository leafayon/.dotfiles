let
  containerEnvironments = {
    CONTAINER_SMTP_PORT = "25";
    CONTAINER_IMAP_PORT = "143";
  };
in

{
  lexopod.containers.protonmail_bridge = {
    imageName = "ghcr.io/videocurio/proton-mail-bridge";
    imageTag = "latest";

    environments = containerEnvironments;

    caddySupport = true;
    caddyServicePort = 5230;

    networks = ["proxy:ip=10.89.0.28"];

    volumes = ["protonmail_bridge-data:/root"];
  };
}