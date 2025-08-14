# the installation of ghostty is performed through homebrew in modules/homebrew/casks.nix
# there's a nicer way where the homebrew cask is installed at the user level, and we will migrate to that eventually
# this is for the ghostty config file
{ lib, ... }:
let
  inherit (lib) concatStringsSep mapAttrsToList;

  # each config option that ghostty supports can be written here
  # https://ghostty.org/docs/config/reference
  ghosttyConfig = {
    font-family = "MonaspiceKr Nerd Font Mono";
  };

  configText = concatStringsSep "\n" (mapAttrsToList (key: value: "${key} = ${value}") ghosttyConfig);
in
{
  home.file.".config/ghostty/config".text = configText;
}
