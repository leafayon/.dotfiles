{ osConfig, lib, ... }:

{
  # https://github.com/Alexays/Waybar/wiki/Module:-Custom
  MODULE = {
    "custom/right-module-button" = {
      tooltip = false;

      format = "";
    };

    "custom/separator" = {
      tooltip = false;

      format = "|";
    };

    "custom/user-shutdown" = {
      tooltip = false;

      format = "";

      on-click = "";
    };

    "custom/user-reboot" = {
      tooltip = false;

      format = "";

      on-click = "";
    };
  };

  STYLE = ''
    #custom-right-module-button {
      /* Vertical/Horizontal */
      padding: 0 10px;

      color: ${osConfig.theme.colors.text};
    }

    /* Separator*/
    #custom-separator {
      font-size: 25px;

      color: ${osConfig.theme.colors.purple};
    }

    /* Shutdown & Reboot */
    #custom-user-shutdown {
      /* Vertical/Horizontal */
      padding: 0 10px;

      color: ${osConfig.theme.colors.red};
    }
    #custom-user-reboot {
      color: ${osConfig.theme.colors.orange};
    }
  '';
}