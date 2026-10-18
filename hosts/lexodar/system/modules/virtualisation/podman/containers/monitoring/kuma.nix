let
  containerEnvironments = {};
in

{
  lexopod.containers.kuma = {
    imageName = "louislam/uptime-kuma";
    imageTag = "2.5.3";

    environments = containerEnvironments;

    caddySupport = true;
    caddyServicePort = 3001;

    networks = ["proxy:ip=10.89.0.52"];

    volumes = ["kuma-data:/app/data"];
  };
}
