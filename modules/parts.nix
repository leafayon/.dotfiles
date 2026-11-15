{ inputs, self, ... }: {
  systems = ["x86_64-linux"];

  perSystem = { system, ... }: {
    imports = [self.flakeModules.theme];

    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;

      config.allowUnfree = true;
    };
  };
}