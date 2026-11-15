{ ... }: {
  flake.nixosModules.logitech = { ... }: {
    programs.openlogi = {
      enable = true;

      launchAtLogin = true;
    };
  };
}