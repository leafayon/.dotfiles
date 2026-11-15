{ self, ... }: {
  flake.nixosModules.userLeaf = { pkgs, ... }: {
    users = {
      defaultUserShell = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;

      users.leaf = {
        isNormalUser = true;
        extraGroups = ["wheel" "networkmanager"];

        password = "decidueye@leaf";
      };
    };
  };

  flake.nixosModules.userAdmin = { pkgs, ... }: {
    users = {
      defaultUserShell = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;

      users.admin = {
        isNormalUser = true;
        extraGroups = ["wheel"];

        password = "decidueye@admin";
      };
    };
  };
}
