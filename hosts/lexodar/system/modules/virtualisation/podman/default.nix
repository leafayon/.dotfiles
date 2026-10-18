{
  imports = [
    ./containers
  ];

  virtualisation.podman = {
    enable = true;
  };
}