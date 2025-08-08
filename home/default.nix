{ inputs, config, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  config.home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.serenity = ./serenity;
  };

}
