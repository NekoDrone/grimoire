{ self, ... }:

let
  # configure ur stuff here
  username = "serenity";
  # hostname = "grimoire";
in
{
  # required for homebrew to be managed with nix-darwin.
  # will need to be split out when we inevitably take this flake to other systems
  system.primaryUser = username;

  # required to run nix-darwin and flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # darwin-version git commit hash
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # don't touch this unless you know what you're doing
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.serenity = {
    name = username;
    home = "/Users/${username}";
  };

  # config.grimoire = {
  #   username = username;
  #   hostname = hostname;
  # }
}
