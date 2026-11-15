{ ... }: {
  flake.nixosModules.regreet = { config, ... }: {
    programs.regreet = {
      enable = true;

      font = {
        name = config.theme.font;
        size = 15;
      };

      settings = {
        appearance = {
          greeting_msg = "Héya :p";
        };

        widget.clock = {
          format = "%a %d %b %Y @ %H:%M:%S";
        };
      };

      extraCss = ''
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
      '';
    };
  };
}