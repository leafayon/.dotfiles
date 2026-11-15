{ osConfig, ... }:

{
  # https://github.com/Alexays/Waybar/wiki/Module:-Tray
  MODULE = {
    "tray" = {
      show-passive-items = true;
      reverse-direction = true;

      icon-size = 25;
      spacing = 5;

      icons = {
        "nm-applet" = "/home/leaf/.dotfiles/data/tray-icons/network-wired.svg";
        "bitwarden" = "/home/leaf/.dotfiles/data/tray-icons/vault.svg";
        "teamspeak" = "/home/leaf/.dotfiles/data/tray-icons/teamspeak.svg";
        "vesktop" = "/home/leaf/.dotfiles/data/tray-icons/discord.svg";
        "steam" = "/home/leaf/.dotfiles/data/tray-icons/steam.svg";
      };

      orders = {
        "nm-applet" = 0;
        "bitwarden" = -10;
        "teamspeak" = -20;
        "vesktop" = -21;
        "steam" = -30;
      };
    };
  };

  STYLE = ''
    #tray {
      /* Vertical/Horizontal */
      padding: 0 5px;
    }

    #tray widget > image {
      color: ${osConfig.theme.colors.text};
    }
    #tray widget > image:hover {
      color: ${osConfig.theme.colors.hover};
    }

    #tray > .needs-attention {
      color: ${osConfig.theme.colors.urgent};
    }

    #tray menu {
      border: ${toString osConfig.theme.borderSize}px solid ${osConfig.theme.colors.border};
      border-radius: ${toString osConfig.theme.borderRadius}px;
    }
    #tray menu menuitem {
      padding: 3px;

      background-color: ${osConfig.theme.colors.background};
      color: ${osConfig.theme.colors.text};
    }
    #tray menu menuitem:hover {
      background-color: ${osConfig.theme.colors.text};
      color: ${osConfig.theme.colors.background};
    }
  '';
}