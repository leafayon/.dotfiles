{ pkgs, ... }:

{
  users = {
    users.admin = {
      isNormalUser = true;
      extraGroups = ["wheel" "podman"];
      packages = with pkgs; [
        btop
        fastfetch
      ];
    };
  };
}