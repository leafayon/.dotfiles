{ config, lib, ... }:

{
  options.theme.colors = lib.mkOption {
    type = lib.types.attrs;

    default = {
      black = "#191a2a";
      blue = "#70b0ff";
      cyan = "#34d3fb";
      gray = "#7e8eda";
      green = "#7af8ca";
      orange = "#ff9668";
      pink = "#f3c1ff";
      purple = "#baacff";
      red = "#ff5370";
      white = "#c8d3f5";
      yellow = "#ffdb8e";

      background = "#222436";
      foreground = config.theme.colors.white;
      border = "#74a0f1";

      text = "#a9b8e8";
      text_secondary = config.theme.colors.white;

      active = config.theme.colors.green;
      inactive = config.theme.colors.orange;
      inactive_secondary = config.theme.colors.black;

      urgent = config.theme.colors.red;
      hover = config.theme.colors.cyan;
      special = config.theme.colors.purple;
    };
  };
}