{ osConfig, ... }:

{
  # https://github.com/Alexays/Waybar/wiki/Module:-Temperature
  MODULE = {
    "temperature" = {
      hwmon-path = "/sys/class/hwmon/hwmon0/temp1_input";

      critical-threshold = 90;
      warning-threshold = 75;

      tooltip = false;

      format = " {temperatureC}°C";
      format-icons = ["" "" "" "" ""];
    };
  };

  STYLE = ''
    #temperature {
      padding-right: 10px;
      padding-left: 10px;

      border-bottom: ${toString osConfig.theme.borderSize}px solid ${osConfig.theme.colors.green};

      color: ${osConfig.theme.colors.text};
    }

    #temperature.critical {
      border-bottom-color: ${osConfig.theme.colors.red};
    }
    #temperature.warning {
      border-bottom-color: ${osConfig.theme.colors.orange};
    }
  '';
}