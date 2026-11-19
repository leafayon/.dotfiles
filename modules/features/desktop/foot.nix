{ self, ... }: {
  flake.wrappers.foot = { config, wlib, ... }: {
    imports = [
      wlib.wrapperModules.foot

      self.nixosModules.theme
    ];

    settings = {
      main = {
        font = "${config.theme.font}:size=10";
      };

      cursor = {
        style = "beam";
      };
    };
  };
}
