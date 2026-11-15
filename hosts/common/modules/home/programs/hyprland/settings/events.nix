{ lib, ... }:

{
  # https://wiki.hypr.land/Configuring/Advanced-and-Cool/Expanding-functionality/#events
  wayland.windowManager.hyprland.settings.on = [
    {
      _args = [
        "hyprland.start"
        (lib.generators.mkLuaInline "function()\n  hl.exec_cmd('waybar')\nend")
      ];
    }
    {
      _args = [
        "hyprland.start"
        (lib.generators.mkLuaInline "function()\n  hl.exec_cmd('nm-applet --indicator')\nend")
      ];
    }
  ];
}