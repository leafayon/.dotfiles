{ ... }: {
  flake.wrappers.fish = { wlib, ... }: {
    imports = [wlib.wrapperModules.fish];

    abbreviations = {
      "lg".expansion = "lazygit";
    };

    configFile.content = ''
      set -g fish_greeting ""
    '';

    flags = {
      "--no-config" = false;
    };
  };
}