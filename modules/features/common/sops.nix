{ ... }: {
  flake.nixosModules.sops = { config, pkgs, ... }: {
    sops = {
      age.keyFile = "/home/leaf/.config/sops/age/keys.txt";

      defaultSopsFile = /home/leaf/data/secrets.yaml;
      defaultSymlinkPath = "/run/user/1000/secrets";
      defaultSecretsMountPoint = "/run/user/1000/secrets.d";

      secrets = {
        leafUser.path = "${config.sops.defaultSymlinkPath}/leaf_user";
        adminUser.path = "${config.sops.defaultSymlinkPath}/admin_user";
      };
    };

    environment.systemPackages = [
      pkgs.age
      pkgs.sops
    ];
  };
}
