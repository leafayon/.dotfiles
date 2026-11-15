{ osConfig, lib, ... }:

let
  MAIN_MONITOR = "DP-1" ;
  SECOND_MONITOR = "HDMI-A-1";
in

{
  # https://wiki.hypr.land/Configuring/Basics/Window-Rules
  wayland.windowManager.hyprland.settings.window_rule = [
    { match.class = "^(jetbrains-.*|dev.zed.Zed)$"; workspace = 1; }
    { match.class = "vesktop"; workspace = 4; }
    { match.class = "^(steam|steam_app_.*)$"; workspace = 9; }

    { match.class = "Bitwarden"; workspace = "special:scratchpad"; }

    {
      match.class = "thunar";
      float = true;
      size = lib.generators.mkLuaInline "{1300, 600}";
    }
  ];

  # https://wiki.hypr.land/Configuring/Basics/Workspace-Rules
  wayland.windowManager.hyprland.settings.workspace_rule = [
    { workspace = 1; monitor = MAIN_MONITOR; persistent = true; }
    { workspace = 3; monitor = MAIN_MONITOR; persistent = true; default = true; }
    { workspace = 8; monitor = MAIN_MONITOR; persistent = true; }
    { workspace = 9; monitor = MAIN_MONITOR; persistent = true; }
    { workspace = 10; monitor = MAIN_MONITOR; persistent = true; }

    { workspace = 2; monitor = SECOND_MONITOR; persistent = true; }
    { workspace = 4; monitor = SECOND_MONITOR; persistent = true; }
    { workspace = 5; monitor = SECOND_MONITOR; persistent = true; }
    { workspace = 6; monitor = SECOND_MONITOR; persistent = true; default = true; }
    { workspace = 7; monitor = SECOND_MONITOR; persistent = true; }

    { workspace = "s[true]"; gaps_out = 25; }
  ];

  # https://wiki.hypr.land/Configuring/Basics/Window-Rules/#layer-rules
  wayland.windowManager.hyprland.settings.layer_rule = [];
}