{ config, ... }: {
  module = {
    "tray" = {
      show-passive-items = true;

      icon-size = 24;
      spacing = 5;

      orders = {
        "nm-applet" = 0;
        "bitwarden" = 10;
        "openlogi" = 11;
        "teamspeak" = 20;
        "vesktop" = 21;
        "discord" = 21;
        "discord-canary" = 21;
        "steam" = 30;
      };
    };
  };

  style = ''
    #tray widget > image {
      color: ${config.theme.colors.text};
    }
    #tray widget > image:hover {
      color: ${config.theme.colors.hover};
    }

    #tray > .needs-attention {
      color: ${config.theme.colors.urgent};
    }

    #tray menu {
      border: ${toString config.theme.borderSize}px solid ${config.theme.colors.border};
      border-radius: ${toString config.theme.borderRadius}px;
    }
    #tray menu menuitem {
      padding: 3px;

      background-color: ${config.theme.colors.background};
      color: ${config.theme.colors.text};
    }
    #tray menu menuitem:hover {
      background-color: ${config.theme.colors.text};
      color: ${config.theme.colors.background};
    }
  '';
}