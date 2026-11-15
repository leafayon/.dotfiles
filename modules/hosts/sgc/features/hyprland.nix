{ self, inputs, ... }:

{
  flake.homeModules.sgcHyprland = { config, pkgs, lib, ... }: {
    wayland.windowManager.hyprland.settings = {
      env = [
        # Nvidia
        { _args = ["LIBVA_DRIVER_NAME" "nvidia"]; }
        { _args = ["__GLX_VENDOR_LIBRARY_NAME" "nvidia"]; }
      ];

      monitor = [
        {
          output = "DP-1";
          mode = "2560x1440@180";
          position = "0x0";
        }
        {
          output = "HDMI-A-1";
          mode = "1920x1080@144";
          position = "auto-left";
          transform = 1;
        }
      ];
    };
  };
}