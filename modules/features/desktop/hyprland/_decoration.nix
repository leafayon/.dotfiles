{ config, ... }:

''
hl.config({
  decoration = {
    rounding =  ${toString config.theme.borderRadius},
    rounding_power = 2.0,

    active_opacity = 1.0,
    fullscreen_opacity = 1.0,
    inactive_opacity = 1.0,

    ["blur.enabled"] = false,
    ["shadow.enabled"] = false
  }
})
''
