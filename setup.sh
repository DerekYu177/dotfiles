#!/usr/bin/env bash

# Make utilities available
export DOTFILES="$HOME/Github/DerekYu177/dotfiles"
PATH="$DOTFILES/bin:$PATH"

ln -sfv "$DOTFILES/.gitconfig" ~
ln -sfv "$DOTFILES/.gitignore_global" ~
ln -sfv "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
ln -sfv "$DOTFILES/.zshrc" "$HOME/.zshrc"
mkdir -p $HOME/.config/nvim/
ln -sfv "$DOTFILES/config/nvim/init.lua" "$HOME/.config/nvim/init.lua"
mkdir -p $HOME/.config/kitty
ln -sfv "$DOTFILES/config/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

# apply gitignore global
git config --global core.excludesfile '~/.gitignore_global'

# update everything in shell
for file in $DOTFILES/shell/*; do
  echo "Applying $file !"
	source $file
done
