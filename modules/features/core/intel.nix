{ ... }: {
  flake.nixosModules.intelCPU = { ... }: {
    hardware = {
      enableRedistributableFirmware = true;

      cpu.intel.updateMicrocode = true;
    };

    boot.kernelModules = ["kvm-intel"];
  };

  flake.nixosModules.intelGPU = { pkgs, ... }: {
    hardware.graphics = {
      enable = true;

      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
        intel-compute-runtime
      ];
    };

    services.xserver.videoDrivers = ["modesetting"];

    environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";
  };
}
