{ ... }: {
  flake.wrappers.nh = { wlib, ... }: {
    imports = [wlib.wrapperModules.nh];

    ask = true;

    flake  = "~/.dotfiles";
  };
}
