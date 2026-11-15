{ self, inputs, ... }: {
  flake.nixosModules.tardisCore = { config, pkgs, lib, ... }: {
    boot = {
  	initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  	initrd.kernelModules = [];
  	kernelModules = [ "kvm-intel" ];
  	extraModulePackages = [];
    };

    fileSystems = {
	  "/" =
	    { device = "/dev/disk/by-uuid/28a22bcf-e0d8-4cdd-b94f-9832f84230b8";
	      fsType = "ext4";
	    };

	  "/boot" =
	    { device = "/dev/disk/by-uuid/6796-0C1E";
	      fsType = "vfat";
	      options = [ "fmask=0077" "dmask=0077" ];
	    };
    };

    swapDevices = [{
      device = "/var/lib/swapfile";
      size = 8*1024;
    }];
  };
}

