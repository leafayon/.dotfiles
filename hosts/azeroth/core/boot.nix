{
  boot = {
    kernel.sysctl = {
      "net.ipv4.ip_unprivileged_port_start" = 53;
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;

      timeout = 5;
    };
  };
}