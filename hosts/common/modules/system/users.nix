{ pkgs, ... }:

{
  users = {
    users.leaf = {
      isNormalUser = true;
      shell = pkgs.fish;
      description = "Leaf";
      hashedPasswordFile = "/home/leaf/.dotfiles/data/passwords/leaf-user";
      extraGroups = ["wheel" "networkmanager"];
      packages = with pkgs; [
        (wineWow64Packages.full.override {
          wineRelease = "staging";
          mingwSupport = true;
        })

        zed-discord-presence
        winetricks
        protonmail-bridge
        filezilla
        vscodium
        vscode
        feishin
        qbittorrent
        xarchiver
        lutris
        gparted
        gelly
        teamspeak6-client
        vlc
        playerctl
        proton-vpn
        brightnessctl
        networkmanagerapplet
        libreoffice-fresh
        libnotify
        pavucontrol
      ];
    };
  };
}
