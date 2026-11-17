{ inputs, ... }: {
  perSystem = { config, pkgs, ... }: {
    packages.foot = inputs.nix-wrapper-modules.wrappers.foot.wrap {
      inherit pkgs;

      settings = {
        main = {
          font = "${config.theme.font}:size=10";
        };

        cursor = {
          style = "beam";
        };
      };
    };
  };
}
