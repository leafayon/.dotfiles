{
  imports = [
    ./ly.nix
    ./solaar.nix
  ];

  services = {
    pipewire = {
      enable = true;

      alsa.enable = true;
      alsa.support32Bit = true;

      pulse.enable = true;
    };

    gvfs.enable = true;
  };
}