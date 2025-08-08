{
  description = "Serenity's Grimoire, faer nix-darwin dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nix-darwin, self, ... }:
    {
      darwinConfigurations.grimoire = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit self inputs;
        };
        modules = [
          ./core
          ./modules
          ./home
        ];
      };
    };
}
