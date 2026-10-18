{
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/0AAE-C987";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    "/" = {
      device = "/dev/disk/by-uuid/f53c89ad-214b-487b-b0a9-e2c959d672a7";
      fsType = "ext4";
    };
  };

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 4*1024;
  }];
}
