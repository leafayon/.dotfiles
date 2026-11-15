{ osConfig, ... }:

{
  # https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
  wayland.windowManager.hyprland.settings.config.decoration = {
    rounding = osConfig.theme.borderRadius;
    rounding_power = 1.5;

    active_opacity = 1.0;
    #inactive_opacity = 0.7;
    fullscreen_opacity = 1.0;

    blur.enabled = false;
    shadow.enabled = false;
  };
}