{ ... }: {
  flake.nixosModules.nvidiaGPU = { ... }: {
    hardware = {
      nvidia = {
        open = true;

        modesetting.enable = true;

        nvidiaSettings = true;
      };

      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };

    services = {
      xserver.videoDrivers = ["nvidia"];
    };
  };
}