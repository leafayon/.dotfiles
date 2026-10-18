{
  lexopod.containers.prometheus = {
    imageName = "prom/prometheus";
    imageTag = "v3.13.4";

    caddySupport = true;
    caddyPort = 9090;

    networks = [
      "proxy:ip=10.10.0.31"
      "monitoring:ip=10.10.1.2"
    ];

    volumes = [
      "prometheus-data:/prometheus"

      #"/mnt/stormwind/podman/volumes/prometheus-config.yaml:/etc/prometheus/prometheus.yml" TODO: Replace with the future path
    ];
  };
}
