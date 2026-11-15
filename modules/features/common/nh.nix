{ inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.nh = inputs.wrapper-modules.wrappers.nh.wrap {
      inherit pkgs;

      ask = true;

      flake  = "~/.dotfiles";
    };
  };
}
