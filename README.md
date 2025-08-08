# grimoire

This is my personal nix-darwin config. Super duper WIP.

To get started, perform the following:

1. Install [nix-darwin](https://github.com/nix-darwin/nix-darwin). (This will also change soon to install nix-darwin on systems that require it)
2. Install [lix](https://lix.systems/install/). (This will change soon to let the flake manage the nix implementation)
3. Clone this repository `git clone https://github.com/NekoDrone/grimoire.git` inside `/etc/nix-darwin`
4. Rebuild `sudo darwin-rebuild switch`
5. You will likely want to restart your shell session.

### Thanks to
- [isabelroses](https://github.com/isabelroses), for bullying me into writing better nix code (and for letting me use her dotfiles as a base)
- [comfysage](https://github.com/comfysage), for offering to rewrite my neovim config, me telling her to stop because I wanted to throw it all away, and then still letting me use her neovim config as a base
