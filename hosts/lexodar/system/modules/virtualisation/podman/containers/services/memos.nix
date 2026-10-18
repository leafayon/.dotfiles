let
  containerEnvironments = {
    MEMOS_INSTANCE_URL = "https://memos.leafayon.lan";
  };
in

{
  lexopod.containers.memos = {
    imageName = "neosmemo/memos";
    imageTag = "0.31.0";

    environments = containerEnvironments;

    caddySupport = true;
    caddyServicePort = 5230;

    networks = ["proxy:ip=10.89.0.25"];

    volumes = ["memos-data:/var/opt/memos"];
  };
}
