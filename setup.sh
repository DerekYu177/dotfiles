#!/usr/bin/env bash

# Make utilities available
export DOTFILES="$HOME/dotfiles"
PATH="$DOTFILES/bin:$PATH"

# git
ln -sfv "$DOTFILES/.gitconfig" ~
ln -sfv "$DOTFILES/.gitignore_global" ~

# tmux
ln -sfv "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"

# zshrc
ln -sfv "$DOTFILES/.zshrc" "$HOME/.zshrc"

# nvim
mkdir -p $HOME/.config/nvim/
ln -sfv "$DOTFILES/nvim.vim" "$HOME/.config/nvim/init.vim"

# alacritty
mkdir -p $HOME/.config/alacritty
ln -sfv "$DOTFILES/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"

# fonts
cp -r "$DOTFILES/fonts/FiraCode" "$HOME/Library/Fonts"

# apply gitignore global
git config --global core.excludesfile '~/.gitignore_global'
