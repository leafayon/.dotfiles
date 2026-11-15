{ osConfig, ... }:

{
  # https://github.com/Alexays/Waybar/wiki/Module:-Battery
  MODULE = {
    "battery" = {
      events = {
        on-discharging-state-75 = "brightnessctl set 75%";
        on-discharging-state-45 = "brightnessctl set 45%";
        on-discharging-state-25 = "brightnessctl set 25%";
      };

      states = {
        state-100 = 100;
        state-75 = 75;
        state-45 = 45;
        state-25 = 25;
        state-10 = 10;
      };

      format = "{icon} {capacity}%";
      format-time = "{H}h{M}";
      format-icons = ["" "" "" "" ""];
      tooltip-format = "{timeTo} | {power}w";
    };
  };

  STYLE = ''
    #battery {
      /* Top/Right/Bottom/Left */
      padding: 0 10px 0 10px;

      border-bottom: ${toString osConfig.theme.borderSize}px solid transparent;
    }

    #battery.state-100 {
      border-bottom-color: ${osConfig.theme.colors.blue};
    }
    #battery.state-75 {
      border-bottom-color: ${osConfig.theme.colors.green};
    }
    #battery.state-45 {
      border-bottom-color: ${osConfig.theme.colors.yellow};
    }
    #battery.state-25 {
      border-bottom-color: ${osConfig.theme.colors.orange};
    }
    #battery.state-10 {
      border-bottom-color: ${osConfig.theme.colors.red};
    }
  '';
}