{ self, inputs, ... }: {
  flake.nixosConfigurations.azeroth = inputs.nixpkgs.lib.nixosSystem {
    modules = [];
  };
}