{ config, ... }: {
  style = ''
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

    /* Remove default GTK hover button style */
    button:hover {
      box-shadow: none;
      text-shadow: none;
      background: none;
      transition: none;
    }

    window#waybar {
      background-color: transparent;
    }

    #workspaces,
    #clock,
    #tray {
      /* Top/Right/Bottom/Left */
      padding: 5px 11px 6px 11px;

      border: ${toString config.theme.borderSize}px solid ${config.theme.colors.border};
      border-top: none;
      border-bottom-left-radius: ${toString config.theme.borderRadius}px;
      border-bottom-right-radius: ${toString config.theme.borderRadius}px;

      background-color: ${config.theme.colors.background};
      color: ${config.theme.colors.text};
    }
  '';
}