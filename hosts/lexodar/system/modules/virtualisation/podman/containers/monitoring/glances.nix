let
  containerEnvironments = {
    GLANCES_OPT = "–export prometheus";
  };
in

{
  lexopod.containers.glances = {
    imageName = "nicolargo/glances";
    imageTag = "4.5.6";

    environments = containerEnvironments;

    socketSupport = true;

    networks = ["monitoring:ip=10.89.1.4"];

    volumes = ["/mnt/stomrwind/podman/volumes/glances.conf:/etc/glances/glances.conf"];
  };
}
