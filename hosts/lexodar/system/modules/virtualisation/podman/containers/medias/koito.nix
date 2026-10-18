{
  lexopod.containers.koito = {
    imageName = "gabehf/koito";
    imageTag = "v0.3.2";

    caddySupport = true;
    caddyPublicDomainSupport = false;
    caddyServicePort = 4110;

    networks = ["proxy:ip=10.89.0.13"];

    volumes = ["koito-data:/etc/koito"];
  };
}