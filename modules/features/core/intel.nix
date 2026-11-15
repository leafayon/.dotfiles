{ self, inputs, ... }: {
  flake.nixosModules.intelCPU = { config, lib, ... }: {
    hardware = {
      enableRedistributableFirmware = true;

      cpu.intel.updateMicrocode = true;
    };

    boot.kernelModules = ["kvm-intel"];
  };
}