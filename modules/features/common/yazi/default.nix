{ ... }: {
  flake.wrappers.yazi = { wlib, ... }: {
    imports = [wlib.wrapperModules.yazi];
  };
}
