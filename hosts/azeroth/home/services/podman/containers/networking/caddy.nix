{
  lexopod.containers.caddy.environments = {
    CADDY_DOCKER_NO_SCOPE = "true";
    CADDY_INGRESS_NETWORKS = "proxy";
    CADDY_DOCKER_LOG_LEVEL = "DEBUG";
  };

  lexopod.containers.caddy = {
    imageName = "lucaslorentz/caddy-docker-proxy";
    imageTag = "2.13.1-alpine";

    socketSupport = true;

    labels = {
      "caddy.admin" = "10.10.0.3:2019";
      "caddy.email" = "leafayon@proton.me";
      "caddy.servers.trusted_proxies" = "static 10.10.0.0/24";
    };

    networks = ["proxy:ip=10.10.0.3"];
    ports = [
      "80:80"
      "443:443/tcp"
      "443:443/udp"
    ];

    volumes = [
      "caddy-data:/data"
      "caddy-config:/config"
      "caddy-logs:/var/log"
    ];
  };
}
