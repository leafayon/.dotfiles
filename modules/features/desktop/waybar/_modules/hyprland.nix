{ config, ... }: {
  module = {
    "hyprland/workspaces" = {
      show-special = true;
      special-visible-only = true;

      format = "{icon}";
      format-icons = {
        default = "";
        special = "";

        "1" = "";
        "2" = "";
        "3" = "";
        "4" = "";
        "6" = "";
        "7" = "";
        "9" = "";
      };
    };
  };

  style = ''
    #workspaces button {
      /* Vertical/Horizontal */
      margin: 0 2.5px;
      padding: 0 5px;

      color: ${config.theme.colors.text};
    }

    #workspaces button:first-child {
      margin-left: 0;
    }
    #workspaces button:last-child {
      margin-right: 0;
    }

    #workspaces button:hover {
      color: ${config.theme.colors.hover};
    }

    #workspaces button.active,
    #workspaces button.visible {
      color: ${config.theme.colors.green};
    }
    #workspaces button.urgent {
      color: ${config.theme.colors.urgent};
    }
    #workspaces button.special {
      color: ${config.theme.colors.special};
    }
  '';
}