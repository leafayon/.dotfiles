{ osConfig, ... }:

{
  services.mako = {
    enable = true;

    # https://github.com/emersion/mako/blob/master/doc/mako.5.scd
    settings = {
      max-history = 10;

      anchor = "top-center";
      output = "DP-1";

      format = "<b>%s</b>\\n%b";

      width = 500;
      height = 400;

      outer-margin = "15, 0, 0, 0";
      margin = 5;
      padding = 10;

      font = "${osConfig.theme.font} 11";

      background-color = "${osConfig.theme.colors.background}";
      text-color = "${osConfig.theme.colors.text}";
      progress-color = "over ${osConfig.theme.colors.blue}";

      border-size = osConfig.theme.borderSize;
      border-color = "${osConfig.theme.colors.border}";
    };
  };
}