{
  imports = [
    ./podman
  ];

  virtualisation = {
    containers.storage.settings.storage = {
      driver = "zfs";

      graphroot = "/mnt/stormwind/podman/storage";
    };
  };
}
