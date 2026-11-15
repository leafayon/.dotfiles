{ config, ... }: {
  module = {
    "custom/notification" = {
      exec = "swaync-client -swb";
      exec-if = "which swaync-client";
      return-type = "json";
      escape = true;

      on-click = "swaync-client -t -sw";
      on-click-right = "swaync-client -d -sw";

      format = "{0} ~ {icon}";
      format-icons = {
        none = "";
        notification = "";
        dnd-none = "";
        dnd-notification = "";
      };
    };
  };

  style = ''
    #custom-notification {
      /* Top/Right/Bottom/Left */
      padding: 5px 9px 5px 9px;

      border-left: ${toString config.theme.borderSize}px solid ${config.theme.colors.border};
      border-bottom: ${toString config.theme.borderSize}px solid ${config.theme.colors.border};
      border-bottom-left-radius: ${toString config.theme.borderRadius}px;

      background-color: ${config.theme.colors.background};
      color: ${config.theme.colors.text};
    }

    #custom-notification:hover {
      color: ${config.theme.colors.hover};
    }

    #custom-notification.none {
      font-weight: normal;
    }

    #custom-notification.notification {
      border-color: ${config.theme.colors.green};
    }

    #custom-notification.dnd-none {
      font-weight: normal;

      border-color: ${config.theme.colors.orange};
    }

    #custom-notification.dnd-notification {
      border-color: ${config.theme.colors.red};
    }
  '';
}