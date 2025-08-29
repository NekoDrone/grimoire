{ inputs, config, ... }:
{
  imports = [
    inputs.atelier.homeModules.default
  ];

  programs.atelier = {
    enable = true;
  };
}
