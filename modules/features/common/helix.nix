{ inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.helix = inputs.nix-wrapper-modules.wrappers.helix.wrap {
      inherit pkgs;
    };
  };
}
