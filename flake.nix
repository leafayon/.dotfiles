{
  description = "One flake for all of my hosts (Desktop, Laptop & Server/NAS)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations.lexodar = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [./hosts/lexodar/system];
    };

    nixosConfigurations.azeroth = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/azeroth/system

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.admin = ./hosts/azeroth/home;
        }
      ];
    };
  };
}
