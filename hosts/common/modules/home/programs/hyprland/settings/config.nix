{ osConfig, ... }:

{
  wayland.windowManager.hyprland.settings.config.general = {
    border_size = osConfig.theme.borderSize;

    gaps_in = 3;
    gaps_out = 5;

    col.active_border = osConfig.theme.colors.active;
    col.inactive_border = osConfig.theme.colors.inactive_secondary;

    layout = "master";
  };

  wayland.windowManager.hyprland.settings.config.misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;

    force_default_wallpaper = 0;
  };

  wayland.windowManager.hyprland.settings.config.ecosystem = {
    no_update_news = false;
    no_donation_nag = true;
  };
}