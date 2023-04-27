#!/usr/bin/env bash
[[ ! -d $HOME/.config/neovim/ ]] \
  && git clone "https://github.com/NvChad/NvChad" "$HOME/.config/nvim" --depth 1 \
  || echo 'Error! $HOME/.config/nvim/ already exists!'; exit 1
