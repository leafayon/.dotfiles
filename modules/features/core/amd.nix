{  ... }: {
  flake.nixosModules.amdCPU = { ... }: {
    hardware = {
      enableRedistributableFirmware = true;

      cpu.amd.updateMicrocode = true;
    };

    boot.kernelModules = ["kvm-amd"];
  };

  flake.nixosModules.amdGPU = { ... }: {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}