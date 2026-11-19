{ self, ... }: {
  flake.wrappers.hyprland = { config, wlib, ... }@args: {
    imports = [
      wlib.wrapperModules.hyprland

      self.nixosModules.theme
    ];

    "hyprland.lua".content = ''''
      + import ./_decoration.nix { inherit config; }
      + import ./_events.nix
      + import ./_general.nix { inherit config; }
      + import ./_inputs.nix
      + import ./_keybindings.nix
      + import ./_monitors.nix
      + import ./_rules.nix;

    install.modules.nixos = { config, lib, ... }:

    let
      cfg = args.config.install.getWrapperConfig config;
    in

    {
      programs.hyprland = lib.mkIf cfg.enable {
        enable = true;

        package = cfg.wrapper;
      };
    };
  };
}
