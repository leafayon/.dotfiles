{ self, ... }: {
  flake.nixosModules.userLeaf = { config, pkgs, ... }: {
    users = {
      defaultUserShell = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;

      users.leaf = {
        isNormalUser = true;
        extraGroups = ["wheel" "networkmanager"];

        hashedPasswordFile = config.sops.secrets.userLeafPassword.path;
      };
    };
  };

  flake.nixosModules.userAdmin = { config, pkgs, ... }: {
    users = {
      defaultUserShell = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;

      users.admin = {
        isNormalUser = true;
        extraGroups = ["wheel"];

        hashedPasswordFile = config.sops.secrets.userAdminPassword.path;
      };
    };
  };
}
