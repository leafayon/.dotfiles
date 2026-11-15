{ osConfig, lib, ... }:

{
  programs.waybar.settings.center-bar = {
    layer = "top";
    position = "top";

    output = ["DP-1" "eDP-1"];

    height = 30;
    spacing = 10;

    modules-left = []
      ++ lib.optionals (osConfig.networking.hostName == "leafarch") ["mpris"];
    modules-center = [
      "group/center-left-modules"
      "clock"
      "group/center-right-modules"
    ];
  };

  programs.waybar.settings.left-bar = {
    layer = "top";
    position = "top";

    output = ["HDMI-A-1"];

    height = 30;
    spacing = 10;

    modules-left = []
      ++ lib.optionals (osConfig.networking.hostName == "leaftop") ["mpris"];
    modules-center = [
      "group/center-left-modules"
      "clock"
      "group/center-right-modules"
    ];
  };
}