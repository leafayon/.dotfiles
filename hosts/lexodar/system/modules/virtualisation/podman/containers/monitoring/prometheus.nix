let
  containerEnvironments = {};
in

{
  lexopod.containers.prometheus = {
    imageName = "prom/prometheus";
    imageTag = "v3.13.3";

    environments = containerEnvironments;

    caddySupport = true;
    caddyServicePort = 9090;

    networks = [
      "proxy:ip=10.89.0.51"
      #"monitoring:ip=10.89.1.3"
    ];

    volumes = [
      "prometheus-data:/prometheus"

      "/mnt/stormwind/podman/volumes/prometheus-config.yaml:/etc/prometheus/prometheus.yml"
    ];
  };
}
