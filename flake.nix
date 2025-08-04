{
  description = "Serenity's Grimoire, faer dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    hostName = "grimoire";
    primaryUser = "serenity";

    configuration = { pkgs, ... }: {

      # Define primary user as above; will swap to flake-based configuration eventually 
      system.primaryUser = primaryUser;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.vim
        ];

      programs.zsh = {
        enable = true;
      };

      # To be split out to a module
      homebrew = {
        enable = true;
        brews = [
          "gnupg"
          "neovim"
        ];
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#{host-name}
    # (replace {host-name} with your system's host name as defined above as hostName)
    darwinConfigurations."${hostName}" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
