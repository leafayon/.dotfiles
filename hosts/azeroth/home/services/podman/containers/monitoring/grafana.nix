{
  lexopod.containers.grafana = {
    imageName = "grafana/grafana";
    imageTag = "13.0.8";

    caddySupport = true;
    caddyPort = 3000;

    networks = ["proxy:ip=10.89.0.30"];

    volumes = ["grafana-data:/var/lib/grafana"];
  };
}
