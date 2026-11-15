{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/e1d2a480-5a2c-4de0-8b0f-596d427a4b17";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/745D-8684";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
  };
}
