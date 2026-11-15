{ osConfig, ... }:

{
  # https://github.com/Alexays/Waybar/wiki/Module:-Memory
  MODULE = {
    "memory" = {
      tooltip = false;

      format = " {used} GiB ~ {swapUsed}/{swapTotal} GiB";
    };
  };

  STYLE = ''
    #memory {
      /* Top/Right/Bottom/Left */
      padding: 0 10px 0 10px;

      border-bottom: ${toString osConfig.theme.borderSize}px solid ${osConfig.theme.colors.border};

      color: ${osConfig.theme.colors.text};
    }
  '';
}