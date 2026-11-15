{ osConfig, lib, ... }:

{
  # https://github.com/Alexays/Waybar/wiki/Module:-Group
  MODULE = {
    "group/user" = {
      orientation = "horizontal";

      modules = [];
    };
    "group/hardware-informations" = {
      orientation = "horizontal";

      modules = [];
    };
  };

  STYLE = '''';
}