{
  imports = [
    ./containers
    ./vms

    ./networks.nix
  ];

  services.podman = {
    enable = true;
  };
}