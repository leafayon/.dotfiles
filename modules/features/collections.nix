{ self, ... }: {
  flake.nixosModules.commonCollection = { pkgs, ... }: {
    imports = [
      self.nixosModules.systemdboot

      self.nixosModules.nix

      self.nixosModules.theme
    ];

    environment.systemPackages = [
      pkgs.btop
      pkgs.fastfetch
      pkgs.gnumake

      self.packages.${pkgs.stdenv.hostPlatform.system}.git
      self.packages.${pkgs.stdenv.hostPlatform.system}.helix
      self.packages.${pkgs.stdenv.hostPlatform.system}.nh
      self.packages.${pkgs.stdenv.hostPlatform.system}.yazi
    ];
  };

  flake.nixosModules.desktopCollection = { pkgs, ... }: {
    imports = [
      self.nixosModules.userLeaf
      self.nixosModules.regreet
      self.nixosModules.hyprland
      self.nixosModules.audio
      self.nixosModules.logitech
    ];

    environment.systemPackages = [
      pkgs.hyprshot
      pkgs.wofi
      pkgs.discord-canary
      pkgs.brightnessctl
      pkgs.zed-editor
      pkgs.thunar
      pkgs.nixd
      pkgs.zed-discord-presence
      pkgs.xarchiver
      pkgs.gparted
      pkgs.networkmanagerapplet
      pkgs.libnotify
      pkgs.playerctl

      self.packages.${pkgs.stdenv.hostPlatform.system}.foot
      self.packages.${pkgs.stdenv.hostPlatform.system}.swaync
      self.packages.${pkgs.stdenv.hostPlatform.system}.waybar
    ];
  };
}
