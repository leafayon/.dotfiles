{ self, ... }: {
  flake.nixosModules.sgcConfiguration = {lib, pkgs, ... }: {
    users.defaultUserShell = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;
    users = {
      users.leaf = {
        isNormalUser = true;
        description = "Leaf";
        #hashedPasswordFile = "/home/leaf/.dotfiles/data/passwords/leaf-user";
        extraGroups = ["wheel" "networkmanager"];
        packages = (with pkgs; [
          zed-discord-presence
          discord-canary
          git
          gnumake
          foot
          wofi
          zed-editor
          thunar
          btop
          nixd
          xarchiver
          gparted
          networkmanagerapplet
          libnotify
          playerctl
        ]);
      };
    };
    programs.ssh.startAgent = true;
    fonts.packages = [
      pkgs.jetbrains-mono
      pkgs.font-awesome
    ];
    time.timeZone = "Europe/Paris";
    security.pki.certificateFiles = [/home/leaf/.dotfiles/data/root.crt];
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
    services.openssh.enable = true;
    programs.firefox.enable = true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "26.05";
  };
}