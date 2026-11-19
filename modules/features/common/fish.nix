{ ... }: {
  flake.wrappers.fish = { wlib, ... }: {
    imports = [wlib.wrapperModules.fish];

    flags = {
      "--no-config" = false;
    };

    configFile.content = ''
      set -g fish_greeting ""
    '';
  };
}
