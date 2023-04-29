#!/usr/bin/env bash

# install all packages provided as arguments, log relevant output and ignore errors
pkginstall() {
  $pkginst "$@" >> "$HOME/.dotfiles/$(date +%F)-install.log" 2> /dev/null
}

setup_fonts() {
  stow -t "$HOME" fonts
}

setup_git() {
  stow -t "$HOME" git
}

setup_gnupg() {
  stow -t "$HOME" gnupg
}

# TODO add my custom nvim config
# TODO auto-add nerd font for ligatures
setup_nvim() {
  # install neovim and pre-requisites
  pkginstall neovim ripgrep npm
  # set up NvChad
  if [[ ! -d $HOME/.dotfiles/nvim/.config/nvim/ ]]; then 
    git clone "https://github.com/NvChad/NvChad" "$HOME/.dotfiles/nvim/.config/nvim/" --depth 1
    # apply custom config
    #rm -r $HOME/.dotfiles/nvim/.config/nvim/lua/custom/
    #cp -r $HOME/.dotfiles/nvchad-custom/custom/ $HOME/.dotfiles/nvim/.config/nvim/lua/custom/
    echo 'congrats, make sure to run neovim to finish setup.'
  fi
}

setup_scripts() {
  echo 'uh oh stinky'
}

# My shell consists of Zsh and some scripts.
setup_shell() {
  pkginstall zsh
  stow -t "$HOME" shell
}

setup_tmux() {
  git clone https://github.com/tmux-plugins/tpm $HOME/.dotfiles/tmux/.config/tmux/plugins/tpm > /dev/null 2>&1
  stow -t "$HOME" tmux
  pkginstall tmux 
}

setup_placeholders() {
  stow -t "$HOME" z-placeholders
}

# DETERMINE PACKAGE MANAGER
which brew > /dev/null 2>&1 && pkginst="brew install"
which dnf > /dev/null 2>&1 && pkginst="sudo dnf install"
which pacman > /dev/null 2>&1 && pkginst="sudo pacman -S"
which pkg > /dev/null 2>&1 && pkginst="pkg install"

# Warning for linux users
[[ $OSTYPE == 'linux-gnu' ]] && echo 'WARNING: You may need to input your super user password to install packages.'

# PROGRAM STARTS
setup_fonts
setup_git
setup_gnupg
#setup_scripts
setup_shell
setup_tmux
setup_nvim
setup_placeholders

