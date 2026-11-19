{ ... }: {
  flake.nixosModules.nix = { ... }: {
    nix.settings = {
      keep-outputs = false;
      keep-derivations = false;

      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
