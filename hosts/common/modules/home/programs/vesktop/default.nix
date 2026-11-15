{
  imports = [
    ./settings.nix
    ./vencord.nix
    ./plugins.nix
  ];

  programs.vesktop = {
    enable = true;
  };
}