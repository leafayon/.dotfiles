{ osConfig, ... }:

{
  # https://github.com/Alexays/Waybar/wiki/Module:-CPU
  MODULE = {
    "cpu" = {
      states = {
        state-85 = 85;
        state-75 = 75;
        state-50 = 50;
        state-25 = 25;
      };

      format = " {usage}%";
    };
  };

  STYLE = ''
    #cpu {
      /* Top/Right/Bottom/Left */
      padding: 0 10px 0 10px;

      border-bottom: ${toString osConfig.theme.borderSize}px solid ${osConfig.theme.colors.blue};

      color: ${osConfig.theme.colors.text};
    }

    #cpu.state-85 {
      border-bottom-color: ${osConfig.theme.colors.red};
    }
    #cpu.state-75 {
      border-bottom-color: ${osConfig.theme.colors.yellow};
    }
    #cpu.state-50 {
      border-bottom-color: ${osConfig.theme.colors.orange};
    }
    #cpu.state-25 {
      border-bottom-color: ${osConfig.theme.colors.green};
    }
  '';
}