{ inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.git = inputs.wrapper-modules.wrappers.git.wrap {
      inherit pkgs;

      settings = {
        init.defaultBranch = "main";

        user = {
          name = "leafayon";
          email = "57141624+leafayon@users.noreply.github.com";
        };
      };
    };
  };
}
