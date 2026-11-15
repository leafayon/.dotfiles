{
  imports = [
    ./walker

    ./mako.nix
    ./hyprpaper.nix
  ];

  services = {
    hyprpolkitagent.enable = true;
  };
}