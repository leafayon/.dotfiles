{ osConfig, ... }:

{
  # https://github.com/Alexays/Waybar/wiki/Module:-User
  MODULE = {
    "user" = {
      format = " {work_H}:{work_M} @ {up_H}:{up_M}";
    };
  };

  STYLE = ''
    #user {
      /* Top/Right/Bottom/Left */
      padding: 0 10px 0 10px;

      border-bottom: ${toString osConfig.theme.borderSize}px solid ${osConfig.theme.colors.border};

      color: ${osConfig.theme.colors.text};
    }
  '';
}