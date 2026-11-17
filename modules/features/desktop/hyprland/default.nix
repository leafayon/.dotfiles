{ self, inputs, ... }: {
  flake.nixosModules.hyprland = { pkgs, ... }: {
    programs.hyprland = {
      enable = true;

      package = self.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };
  };

  perSystem = { config, pkgs, ... }: {
    packages.hyprland = inputs.nix-wrapper-modules.wrappers.hyprland.wrap {
      inherit pkgs;

      "hyprland.lua".content = ''''
        + import ./_decoration.nix { inherit config; }
        + import ./_events.nix
        + import ./_general.nix { inherit config; }
        + import ./_inputs.nix
        + import ./_keybindings.nix
        + import ./_monitors.nix
        + import ./_rules.nix;
    };
  };
}
