{ inputs, ... }: {
  systems = ["x86_64-linux"];

  imports = [inputs.nix-wrapper-modules.flakeModules.wrappers];

  perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;

      config.allowUnfree = true;
    };
  };
}
