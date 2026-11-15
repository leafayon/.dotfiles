{
  description = "One flake for all of my hosts (Desktop, Laptop & Server/NAS)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrapper-modules.url = "github:nix-community/nix-wrapper-modules";

    # Programs & Services
    openlogi.url = "github:AprilNEA/OpenLogi?dir=packaging";
    openlogi.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (
    inputs.import-tree ./modules
  );
}
