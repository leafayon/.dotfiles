{ self, ... }: {
  flake.nixosModules.userLeaf = { pkgs, ... }: {
    users = {
      defaultUserShell = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;

      users.leaf = {
        isNormalUser = true;
        extraGroups = ["wheel" "networkmanager"];

        hashedPasswordFile = "/home/leaf/.dotfiles/data/passwords/leaf-user";
      };
    };
  };

  flake.nixosModules.userAdmin = { pkgs, ... }: {
    users = {
      defaultUserShell = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;

      users.admin = {
        isNormalUser = true;
        extraGroups = ["wheel"];

        hashedPasswordFile = "/home/admin/.dotfiles/data/passwords/admin-user";
      };
    };
  };
}
