{ inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.fish = inputs.nix-wrapper-modules.wrappers.fish.wrap {
      inherit pkgs;

      flags = {
        "--no-config" = false;
      };

      configFile.content = ''
        set -g fish_greeting ""
      '';
    };
  };
}
