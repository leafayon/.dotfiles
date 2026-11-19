{ ... }: {
  flake.wrappers.git = { wlib, ... }: {
    imports = [wlib.wrapperModules.git];

    settings = {
      init.defaultBranch = "main";

      user = {
        name = "leafayon";
        email = "57141624+leafayon@users.noreply.github.com";
      };
    };
  };
}
