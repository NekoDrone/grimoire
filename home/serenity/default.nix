{
  # user-level settings are done here
  imports = [
    ./cli # terminal tools like zsh or nvim
    ./config # configs for various apps. keep this at the bottom
    # ./tui # terminal ui stuff like lazygit or neovim
  ];

  # probably don't touch this lmao
  home.stateVersion = "25.05";
}
