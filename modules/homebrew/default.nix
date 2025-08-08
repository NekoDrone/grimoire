{
  imports = [
    ./casks.nix
  ];

  homebrew = {
    enable = true;

    # A set of default formulae that should be present regardless
    brews = [
      "neovim"
      "gnupg"
    ];
  };
}
