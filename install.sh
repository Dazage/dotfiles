#!/usr/bin/env bash

# install all packages provided as arguments, log relevant output and ignore errors
pkginstall() {
  $pkginst "$@" >> "$HOME/.dotfiles/$(date +%F)-install.log" 2> /dev/null
}

setup_fonts() {
  echo 'Setting up fonts...'
  stow -t "$HOME" fonts
}

setup_git() {
  git_config="$HOME/.dotfiles/git/.config/git/config"
  if ! grep 'setup_done' "$git_config" 1> /dev/null; then
    echo 'Setting up git config...'
    read -rp 'Enter your GitHub username: ' git_name
    sed -i '' "s/^name.*/name = $git_name/g" "$git_config"
    read -rp 'Enter your GitHub email address: ' git_email
    sed -i '' "s/^email.*/email = $git_email/g" "$git_config"
    echo '# setup_done #' >> "$git_config"
    stow -t "$HOME" git
  else
    echo "Skipping git config..."
  fi
}

setup_gnupg() {
  echo 'Setting up GnuPG config...'
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
    #rm -r $HOME/.dotfiles/nvim/.config/nvim/lua/custom
    cd $HOME/.dotfiles/nvim/.config/nvim/lua/
    ln -s $HOME/.dotfiles/nvchad-custom/custom .
    cd $HOME/.dotfiles/
    echo 'congrats, make sure to run neovim to finish setup.'
  fi
}

# For my shell environment I use Zsh and some custom scripts.
setup_shell() {
  pkginstall zsh
  stow -t "$HOME" shell
  stow -t "$HOME" scripts
}

# I use tmux as my terminal multiplexer.
setup_tmux() {
  git clone "https://github.com/tmux-plugins/tpm" "$HOME/.dotfiles/tmux/.config/tmux/plugins/tpm" > /dev/null 2>&1
  stow -t "$HOME" tmux
  pkginstall tmux 
}

# I don't want clutter in my home directory so I keep empty placeholders for some programs.
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

