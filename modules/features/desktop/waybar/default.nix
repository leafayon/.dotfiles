{ inputs, ... }: {
  perSystem = { config, pkgs, ... }:

  let
    bars = import ./_bars.nix;

    clock = import ./_modules/clock.nix { inherit config; };
    hyprland = import ./_modules/hyprland.nix { inherit config; };
    mpris = import ./_modules/mpris.nix { inherit config; };
    tray = import ./_modules/tray.nix { inherit config; };

    customNotification = import ./_modules/customs/notification.nix { inherit config; };
  in

  {
    packages.waybar = inputs.wrapper-modules.wrappers.waybar.wrap {
      inherit pkgs;

      settings = map(bar: (
        bar
          // clock.module
          // hyprland.module
          // mpris.module
          // tray.module

          // customNotification.module
      )) [bars.main bars.second];

      "style.css".content = ''''
        + (import ./_style.nix { inherit config; }).style

        + clock.style
        + hyprland.style
        + mpris.style
        + tray.style

        + customNotification.style;
    };
  };
}