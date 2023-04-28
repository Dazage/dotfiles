#!/usr/bin/env sh

# ~/.profile: executed by the command interpreter for login shells. This file is
# not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.

# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
# add ~/.emacs.d/bin/ to PATH if it exists
[[ -d "$HOME/.emacs.d/bin" ]] && PATH="$HOME/.emacs.d/bin:$PATH"
# add ~/.config/cargo/bin/ to PATH if it exists
[[ -d "$HOME/.config/cargo/bin" ]] && PATH="$HOME/.config/cargo/bin:$PATH"

# Set some environment variables
export PATH="$PATH:$(du "$HOME/.dotfiles/scripts/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export QT_QPA_PLATFORMTHEME="qt5ct" # Edit Qt5 themes with qt5ct

# Export preferred programs
export EDITOR="nvim"
export TERMINAL="konsole"
export BROWSER="firefox"

# ~/ XDG Cache:
export XDG_CACHE_HOME="$HOME/.cache"

# ~/ XDG Config:
export XDG_CONFIG_HOME="$HOME/.config"
export ANSIBLE_CONFIG="$HOME/.config/ansible"
export CARGO_HOME="$HOME/.config/cargo"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export INPUTRC="$HOME/.config/inputrc"
export LESSHISTFILE="/dev/null"
export WGETRC="$HOME/.config/wget/wgetrc"
export ZDOTDIR="$HOME/.config/zsh"

# ~/ XDG Data:
export XDG_DATA_HOME="$HOME/.local/share"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"

# ~/ Clean-up Xauthority:
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line may break some DMs.

# Start graphical server if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
