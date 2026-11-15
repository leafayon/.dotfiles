{ lib, ... }:

let
  themeModule = {
    font = lib.mkOption {
      type = lib.types.str;
      default = "JetbrainsMono";
    };

    fontIcon = lib.mkOption {
      type = lib.types.str;
      default = "Font Awesome 7 Free";
    };

    fontSize = lib.mkOption {
      type = lib.types.int;
      default = 16;
    };

    borderSize = lib.mkOption {
      type = lib.types.int;
      default = 4;
    };

    borderRadius = lib.mkOption {
      type = lib.types.int;
      default = 0;
    };
  };
in

{
  flake.flakeModules.theme = { ... }: {
    imports = [./colors.nix];

    options.theme = {} // themeModule;
  };

  flake.nixosModules.theme = { ... }: {
    imports = [./colors.nix];

    options.theme = {} // themeModule;
  };
}