{ pkgs, ... }:

{
  imports = [
    ./policies.nix
    ./preferences.nix
    ./extensions.nix
  ];

  programs.firefox.enable = true;
}