{ inputs, ... }: {
  perSystem = { config, pkgs, ... }: {
    packages.swaync = inputs.wrapper-modules.wrappers.swaynotificationcenter.wrap {
      inherit pkgs;

      settings = {
        positionX = "center";
        positionY = "top";

        timeout = 10;
        timeout-low = 10;
        timeout-critical = 0;

        notification-window-preferred-output = "DP-1";
        notification-window-width = 1000;
        notification-window-height = 500;

        control-center-preferred-output = "DP-1";
        control-center-positionX = "right";
        control-center-positionY = "top";
        control-center-margin-top = 15;
        fit-to-screen = false;

        notification-grouping = false;
        hide-on-action = true; # Hides the control center when clicking on notification action.

        widgets = [
          "notifications"
        ];
      };

      stylesheet = ''
        * {
          font-family: "${config.theme.font}", "${config.theme.fontIcon}";
          font-feature-settings: "tnum";
          font-size: ${toString config.theme.fontSize}px;
          font-weight: bold;

          margin: 0;
          padding: 0;

          border: none;
          border-radius: 0;
        }

        .control-center {
          background-color: ${config.theme.colors.background};

          border: ${toString config.theme.borderSize}px solid ${config.theme.colors.border};
          border-right: none;
          border-top-left-radius: ${toString config.theme.borderRadius}px;
          border-bottom-left-radius: ${toString config.theme.borderRadius}px;
        }
      '';
    };
  };
}
