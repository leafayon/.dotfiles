{
  imports = [
    ./zfs.nix
  ];

  services = {
    openssh.enable = true;
  };
}