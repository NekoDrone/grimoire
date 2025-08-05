{ ... }:
{
  homebrew = {
    enable = true;

    imports = [
      ./casks.nix
    ];

    # A set of default formulae that should be present regardless
    brews = [
      "neovim"
      "gnupg"
    ];
  };  
}
