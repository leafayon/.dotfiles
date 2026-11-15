{ osConfig, lib, ... }:

let
  BATTERY = (import ./battery.nix { inherit osConfig; });
  CLOCK = (import ./clock.nix { inherit osConfig; });
  CPU = (import ./cpu.nix { inherit osConfig; });
  HYPRLAND = (import ./hyprland.nix { inherit osConfig; });
  MEMORY = (import ./memory.nix { inherit osConfig; });
  MPRIS = (import ./mpris.nix { inherit osConfig; });
  USER = (import ./user.nix { inherit osConfig; });
  TEMPERATURE = (import ./temperature.nix { inherit osConfig; });
  TRAY = (import ./tray.nix { inherit osConfig; });

  CUSTOMS = (import ./customs.nix { inherit osConfig; inherit lib; });
  GROUPS = (import ./groups.nix { inherit osConfig; inherit lib; });

  MODULES = {}
    // BATTERY.MODULE
    // CLOCK.MODULE
    // CPU.MODULE
    // HYPRLAND.MODULE
    // MEMORY.MODULE
    // MPRIS.MODULE
    // USER.MODULE
    // TEMPERATURE.MODULE
    // TRAY.MODULE

    // CUSTOMS.MODULE
    // GROUPS.MODULE;
in

{
  programs.waybar = {
    settings.center-bar = {} // MODULES;
    settings.left-bar = {} // MODULES;

    style = ''''
      + BATTERY.STYLE
      + CLOCK.STYLE
      + CPU.STYLE
      + HYPRLAND.STYLE
      + MEMORY.STYLE
      + MPRIS.STYLE
      + USER.STYLE
      + TEMPERATURE.STYLE
      + TRAY.STYLE

      + CUSTOMS.STYLE
      + GROUPS.STYLE;
  };
}