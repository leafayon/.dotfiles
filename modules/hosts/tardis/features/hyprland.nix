{ self, inputs, ... }: {
  flake.homeModules.tardisHyprland = { config, pkgs, lib, ... }: {
    wayland.windowManager.hyprland.settings = {
 	    monitor = [
        {
          output = "eDP-1";
          mode = "auto";
          position = "0x0";
        }
        {
          output = "HDMI-A-1";
          mode = "1920x1080@60";
          position = "auto-left";
          transform = 1;
        }
      ];
    };
  };
}
