{ self, ... }: {
  flake.nixosModules.commonCollection = { pkgs, ... }: {
    imports = [
      self.nixosModules.systemdboot

      self.nixosModules.nix

      self.nixosModules.theme
    ];

    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.git
      self.packages.${pkgs.stdenv.hostPlatform.system}.helix
      self.packages.${pkgs.stdenv.hostPlatform.system}.nh
      self.packages.${pkgs.stdenv.hostPlatform.system}.yazi
    ];
  };

  flake.nixosModules.desktopCollection = { pkgs, ... }: {
    imports = [
      self.nixosModules.regreet
      self.nixosModules.hyprland

      self.nixosModules.audio

      self.nixosModules.logitech
    ];

    config.environment.systemPackages = [
      pkgs.hyprshot

      self.packages.${pkgs.stdenv.hostPlatform.system}.foot
      self.packages.${pkgs.stdenv.hostPlatform.system}.swaync
      self.packages.${pkgs.stdenv.hostPlatform.system}.waybar
    ];
  };
}
