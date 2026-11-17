{ inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.yazi = inputs.nix-wrapper-modules.wrappers.yazi.wrap {
      inherit pkgs;
    };
  };
}
