{ self, inputs, ... }: {
  flake.nixosConfigurations.sgc = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.openlogi.nixosModules.default

      self.nixosModules.commonCollection
      self.nixosModules.desktopCollection

      self.nixosModules.sgcCore
      self.nixosModules.sgcConfiguration
      self.nixosModules.sgcNetworking

      self.nixosModules.amdCPU
      self.nixosModules.nvidiaGPU

      self.nixosModules.steam
    ];
  };
}