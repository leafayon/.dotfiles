{ config, lib, ... }:

let
  cfg = config.theme;
in

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
      foreground = cfg.colors.white;
      border = "#74a0f1";

      text = "#a9b8e8";
      textSecondary = cfg.colors.white;

      active = cfg.colors.green;
      inactive = cfg.colors.orange;
      inactiveSecondary = cfg.colors.black;

      urgent = cfg.colors.red;
      hover = cfg.colors.cyan;
      special = cfg.colors.purple;
    };
  };
}