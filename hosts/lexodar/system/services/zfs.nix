{ config, ... }:

{
  services.zfs = {
    autoScrub.enable = true;
    autoScrub.interval = "daily";

    autoReplication.enable = false;
  };
}
