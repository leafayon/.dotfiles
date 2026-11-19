{ config, ... }: {
  main = {
    layer = "top";
    position = "top";

    output = ["DP-1" "eDP-1"];

    height = 40;
    spacing = 10;

    modules-left = ["mpris"];

    modules-center = [
      "hyprland/workspaces"
      "clock"
      "tray"
    ];

    modules-right = [
      "battery"
      "custom/notification"
    ];
  };

  second = {
    layer = "top";
    position = "top";

    output = ["HDMI-A-1"];

    height = 40;
    spacing = 10;

    modules-center = [
      "hyprland/workspaces"
      "clock"
    ];
  };

  tv = {
    layer = "top";
    position = "top";

    output = ["DVI-1"];

    height = 30;
    spacing = 10;

    modules-center = [
      "hyprland/workspaces"
      "clock"
    ];
  };
}
