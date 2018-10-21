#!/usr/bin/env bash

# Make utilities available
# dotfiles
export DOTFILES="$HOME/dotfiles"
PATH="$DOTFILES/bin:$PATH"

# Bunch of symlinks

ln -sfv "$DOTFILES/git/.gitconfig" ~
ln -sfv "$DOTFILES/git/.gitignore_global" ~

# tooling
ln -sfv "$DOTFILES/tmux.conf" "$HOME/.tmux.conf"
ln -sfv "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"

# requires special folder creation
mkdir -p $HOME/.config/nvim/
ln -sfv "$DOTFILES/config/nvim.vim" "$HOME/.config/nvim/init.vim"
mkdir -p $HOME/.config/alacritty
ln -sfv "$DOTFILES/config/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"

# apply gitignore global
git config --global core.excludesfile '~/.gitignore_global'

# once the symlinks have been installed
# then the next thing that gets run is ~/.profile
# profile should decide whether the bash/ file will be called
# or whether a shell change should be warrented
# the both shells will call the shell/ folder
