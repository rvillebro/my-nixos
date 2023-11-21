{
  description = "Rasmus' NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpks/nixpkgs-unstable"
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    ...
  }:
}