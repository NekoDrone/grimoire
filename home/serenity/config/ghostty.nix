# the installation of ghostty is performed through homebrew in modules/homebrew/casks.nix
# there's a nicer way where the homebrew cask is installed at the user level, and we will migrate to that eventually
# this is for the ghostty config file
{ lib, pkgs, ... }:
let
  inherit (lib) concatStringsSep mapAttrsToList;

  themeName = "catppuccin-mocha"; # this can realistically be anything you want, so long as it matches with the name of the .conf file you're sourcing from.

  # each config option that ghostty supports can be written here
  # https://ghostty.org/docs/config/reference
  ghosttyConfig = {
    font-family = "Maple Mono NF";
    font-size = "15";
    font-style = "Light";
    theme = "light:${themeName},dark:${themeName}";
    adjust-cell-height = "25%";
  };

  configText = concatStringsSep "\n" (mapAttrsToList (key: value: "${key} = ${value}") ghosttyConfig);

  # i use catppuccin as my theme. if you want to change this, you'll need to specify the path in the repo that you're cloning from.
  # alternatively, you can also simply provide the theme as a text input, in which case you'll need to change the configFile for the theme to text instead of source.

  catppuccin = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "ghostty";
    rev = "7b1967449c91122274652097691b92e0d91390b1";
    hash = "sha256-zJrL3ndgUJ8E8O5RpJf5VAmnDMcOrMdnHDQE5DQyIO4=";
  };

  # this should be the path to the .conf file in the repo
  ghosttyTheme = "${catppuccin}/themes/${themeName}.conf";
in
{
  xdg.configFile = {
    "ghostty/config".text = configText;
    "ghostty/themes/${themeName}".source = ghosttyTheme;
  };
}
