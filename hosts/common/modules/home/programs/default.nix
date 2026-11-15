{
  imports = [
    # System
    ./fish.nix

    # Desktop environment
    ./hyprland
    ./waybar
    ./wofi.nix
    ./foot.nix

    # Applications
    ./firefox
    ./vesktop

    # Dev
    ./zed.nix
  ];

  programs = {
    home-manager.enable = true;

    btop.enable = true;
    fastfetch.enable = true;
    hyprshot.enable = true;
    obs-studio.enable = true;
  };
}
