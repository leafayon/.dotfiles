{
  services.podman.networks = {
    proxy = {
      driver = "bridge";
      gateway = "10.10.0.1";
      subnet = "10.10.0.0/24";

      extraPodmanArgs = [
        "--disable-dns"
        "--ipv6"
      ];
    };

    monitoring = {
      driver = "bridge";
      gateway = "10.10.1.1";
      subnet = "10.10.1.0/24";

      internal = true;
    };

    vm = {
      driver = "macvlan";
      gateway = "10.20.0.1";
      subnet = "10.20.0.0/24";

      extraPodmanArgs = ["--ipv6"];
    };
  };
}
