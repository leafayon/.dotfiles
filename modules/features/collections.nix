{ self, inputs, ... }: {
  flake.nixosModules.commonCollection = { pkgs, ... }: {
    imports = [
      inputs.sops-nix.nixosModules.sops

      self.nixosModules.nix
      self.nixosModules.sops
      self.nixosModules.systemdboot
      self.nixosModules.theme

      self.wrappers.foot.install
      self.wrappers.git.install
      self.wrappers.helix.install
      self.wrappers.hyprland.install
      self.wrappers.nh.install
      self.wrappers.swaync.install
      self.wrappers.waybar.install
      self.wrappers.yazi.install
    ];

    wrappers = {
      git.enable = true;
      helix.enable = true;
      nh.enable = true;
      yazi.enable = true;
    };

    environment.systemPackages = [
      pkgs.btop
      pkgs.fastfetch
      pkgs.gnumake
      pkgs.lazygit
    ];
  };

  flake.nixosModules.desktopCollection = { pkgs, ... }: {
    imports = [
      self.nixosModules.audio
      self.nixosModules.logitech
      self.nixosModules.regreet
      self.nixosModules.userLeaf
    ];

    wrappers = {
      foot.enable = true;
      hyprland.enable = true;
      swaync.enable = true;
      waybar.enable = true;
    };

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
    ];
  };
}
