{ ... }: {
  flake.nixosModules.sgcNetworking = { ... }: {
    networking = {
      hostName = "sgc";

      networkmanager = {
        enable = true;

        insertNameservers = ["192.168.1.17" "1.1.1.1"];
      };
    };
  };
}