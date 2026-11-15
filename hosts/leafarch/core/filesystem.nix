{
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/D970-3E86";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    "/" = {
      device = "/dev/disk/by-uuid/ea2aa434-81f4-49b0-8e56-ac32f52f6675";
      fsType = "ext4";
    };

    "/media/atlantis" = {
      device = "/dev/disk/by-uuid/3923cd3d-1c0e-47ec-a673-88d94b0d811f";
      fsType = "ext4";
    };
  };
}