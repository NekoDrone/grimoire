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

  outputs = inputs@{ nix-darwin, self, ... }:
  let
    configuration = { pkgs, ... }: {

      # Define primary user as above; will swap to flake-based configuration eventually 
      # system.primaryUser = primaryUser;

      # List packages installed in system profile.
      programs.zsh = {
        enable = true;
      };

      users.users.serenity = {
        name = "serenity";
	home = "/Users/serenity";
      };
    };
  in
  {
    darwinConfigurations."grimoire" = nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit self inputs;
      };
      modules = [
        configuration
	./core
	./modules
	home-manager.darwinModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	}
      ];
    };
  };
}
