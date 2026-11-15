{ lib, ... }:

{
  imports = [
    ./colors.nix
  ];

  options.theme = {
    font = lib.mkOption {
      type = lib.types.str;
      default = "JetbrainsMono";
    };
    fontIcon = lib.mkOption {
      type = lib.types.str;
      default = "Font Awesome 7 Free";
    };

    borderSize = lib.mkOption {
      type = lib.types.int;
      default = 4;
    };
    borderRadius = lib.mkOption {
      type = lib.types.int;
      default = 10;
    };
  };
}