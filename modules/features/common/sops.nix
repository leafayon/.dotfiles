{ ... }: {
  flake.nixosModules.sops = { pkgs, ... }: {
    sops = {
      age.keyFile = "/home/leaf/.config/sops/age/keys.txt";

      defaultSopsFile = /home/leaf/.dotfiles/data/sops/secrets.yaml;

      secrets = {
        userLeafPassword = { neededForUsers = true; };
        userAdminPassword = { neededForUsers = true; };
      };
    };

    environment.systemPackages = [
      pkgs.age
      pkgs.sops
    ];
  };
}
