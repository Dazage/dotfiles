#!/usr/bin/env bash
mkdir -pv $HOME/.config/tmux/plugins/
git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
stow -t $HOME.config/tmux/ tmux && echo 'congrats, tmux is installed!'
## TODO make tmux auto-install plugins as part of this script

# NvChad setup
# TODO add NvChad pre-requisites
# - ripgrep
# - npm
# - nerd font for ligatures
## set up NvChad
[[ ! -d $HOME/.config/neovim/ ]] \
  && git clone "https://github.com/NvChad/NvChad" "$HOME/.config/nvim" --depth 1 \
  || echo 'Error! $HOME/.config/nvim/ already exists!'; exit 1
## TODO add my custom config
