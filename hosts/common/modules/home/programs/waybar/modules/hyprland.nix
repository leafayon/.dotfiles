{ osConfig, ... }:

{
  # https://github.com/Alexays/Waybar/wiki/Module:-Hyprland
  MODULE = {
    "hyprland/workspaces" = {
      show-special = true;
      special-visible-only = true;

      format = "{icon}";
      format-icons = {
        default = "";
        active = "";
        visible = "";
      };
    };
  };

  STYLE = ''
    #workspaces {
      /* Vertical/Horizontal */
      padding: 0 5px;
    }

    #workspaces button {
      /* Vertical/Horizontal */
      margin: 0 2.5px;
      padding: 0 5px;

      color: ${osConfig.theme.colors.text};
    }

    #workspaces button:first-child {
      margin-left: 0;
    }
    #workspaces button:last-child {
      margin-right: 0;
    }

    #workspaces button:hover {
      color: ${osConfig.theme.colors.hover};
    }

    #workspaces button.active,
    #workspaces button.visible {
      color: ${osConfig.theme.colors.green};
    }
    #workspaces button.urgent {
      color: ${osConfig.theme.colors.urgent};
    }
    #workspaces button.special {
      color: ${osConfig.theme.colors.special};
    }
  '';
}