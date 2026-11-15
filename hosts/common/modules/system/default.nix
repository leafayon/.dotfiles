{ pkgs, pkgsUnstable, ... }:

{
  imports = [
    ./users.nix
    ./networking.nix

    ./programs
    ./services
  ];
  security.pki.certificateFiles = [/home/leaf/.dotfiles/data/root.crt];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  security.polkit.enable = true;
  time.timeZone = "Europe/Paris";
  console.keyMap = "fr";
  i18n.defaultLocale = "fr_FR.UTF-8";
  fonts.packages = with pkgs; [
    jetbrains-mono
    font-awesome
  ];
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
  environment.systemPackages = with pkgs; [
    gnumake
  ] ++ (with pkgsUnstable; [
    github-desktop
  ]);
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";
}
