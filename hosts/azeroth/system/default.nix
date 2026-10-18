{ lib, pkgs, ... }:

{
  imports = [
    ../core

    ./modules
    ./services

    ./users.nix
  ];

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";
  console.keyMap = "fr";
  system.stateVersion = "26.05";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  environment.systemPackages = with pkgs; [gnumake];
  nix.settings.extra-experimental-features = ["nix-command" "flakes"];
}