{ ... }: {
  flake.wrappers.helix = { wlib, ... }: {
    imports = [wlib.wrapperModules.helix];
  };
}
