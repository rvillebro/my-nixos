{
  description = "Rasmus' NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      xps13 = {
        system = "x86_64-linux";
        modules = [
          ./hosts/xps13

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs;
            home-manager.users.rav = import ./home;
          }
        ];
      };

      nixos-test = {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos-test

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs;
            home-manager.users.rasmus = import ./home;
          }
        ];
      };
    };
  };
}