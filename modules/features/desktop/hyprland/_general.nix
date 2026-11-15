{ config, ... }:

''
hl.config({
  general = {
    border_size = ${toString config.theme.borderSize},

    gaps_in = 5,
    gaps_out = { top = 5 },

    ["col.active_border"] = "${config.theme.colors.active}",
    ["col.inactive_border"] = "${config.theme.colors.inactiveSecondary}",

    layout = "dwindle"
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    force_default_wallpaper = 0,

    close_special_on_empty = false
  },

  ecosystem = {
    no_update_news = false,
    no_donation_nag = true
  }
})
''