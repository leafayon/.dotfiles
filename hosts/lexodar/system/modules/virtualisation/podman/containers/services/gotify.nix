{
  lexopod.containers.gotify = {
    imageName = "gotify/server";
    imageTag = "3.1.1";

    caddySupport = true;
    caddyServicePort = 80;

    networks = ["proxy:ip=10.89.0.20"];

    volumes = ["gotify-data:/app/data"];
  };
}
