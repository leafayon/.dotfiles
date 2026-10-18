let
  containerEnvironments = {};
in

{
  lexopod.containers.grafana = {
    imageName = "grafana/grafana";
    imageTag = "13.0.8";

    environments = containerEnvironments;

    caddySupport = true;
    caddyServicePort = 3000;

    networks = [
      "proxy:ip=10.89.0.50"
      #"monitoring:ip=10.89.1.2"
    ];

    volumes = ["grafana-data:/var/lib/grafana"];
  };
}
