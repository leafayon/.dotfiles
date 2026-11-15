{ osConfig, ... }:

{
  programs.waybar.style = ''
    * {
      font-family: ${osConfig.theme.font}, "${osConfig.theme.fontIcon}";
      font-feature-settings: "tnum";
      font-size: 15px;
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

    /* Modules style */
    .modules-left {
      margin-left: 5px;
    }

    #center-left-modules,
    #center-right-modules,
    #clock,
    #mpris {
      /* Vertical/Horizontal */
      padding: 0 10px;

      border: ${toString osConfig.theme.borderSize}px solid ${osConfig.theme.colors.border};
      border-top: none;
      border-radius:
        0
        0
        ${toString osConfig.theme.borderRadius}px
        ${toString osConfig.theme.borderRadius}px;

      background-color: ${osConfig.theme.colors.background};
      color: ${osConfig.theme.colors.text};
    }
  '';
}