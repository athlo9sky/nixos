{
  description = "Nix flake";

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:ElXreno/nixpkgs/nixos-unstable-cust";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }@inputs:
    let
      findModules = dir:
        builtins.concatLists (builtins.attrValues (builtins.mapAttrs
          (name: type:
            if type == "regular" then
              [{
                name = builtins.elemAt (builtins.match "(.*)\\.nix" name) 0;
                value = dir + "/${name}";
              }]
            else if (builtins.readDir (dir + "/${name}"))
              ? "default.nix" then [{
              inherit name;
              value = dir + "/${name}";
            }] else
              findModules (dir + "/${name}"))
          (builtins.readDir dir)));
    in
    {
      nixosConfigurations = with nixpkgs.lib; {
        hp = nixosSystem {
          system = "x86_64-linux";
          modules = [
            (import ./configuration.nix)
            inputs.home-manager.nixosModules.home-manager
          ];
          specialArgs = {
            inherit inputs;
          };
        };
      };
      devShells.x86_64-linux = with nixpkgs.lib;
        let
          inherit ((builtins.head (builtins.attrValues self.nixosConfigurations))) pkgs config;
          mkShells = mapAttrs
            (_name: value: import value { inherit pkgs config; });
        in
        mkShells (builtins.listToAttrs (findModules ./devshell));
    };
}
