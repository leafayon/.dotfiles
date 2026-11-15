{ self, inputs, ... }: {
  flake.nixosConfigurations.tardis = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.openlogi.nixosModules.default

      self.nixosModules.commonCollection
      self.nixosModules.desktopCollection

      self.nixosModules.tardisCore
      self.nixosModules.tardisConfiguration
      self.nixosModules.tardisNetworking

      self.nixosModules.intelCPU
      self.nixosModules.intelGPU

      self.nixosModules.steam
    ];
  };
}
