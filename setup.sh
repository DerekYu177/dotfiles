#!/usr/bin/env bash

# Make utilities available

dotfiles="$HOME/.dotfiles"
PATH="$dotfiles/bin:$PATH"

# Bunch of symlinks
ln -sfv "$dotfiles/core/bash_profile" "$HOME/.bash_profile"
ln -sfv "$dotfiles/core/inputrc" "$HOME/.inputrc"
ln -sfv "$dotfiles/core/bashrc" "$HOME/.bashrc"
ln -sfv "$dotfiles/git/.gitconfig" ~
ln -sfv "$dotfiles/git/.gitignore_global" ~
ln -sfv "$dotfiles/tmux.conf" "$HOME/.tmux.conf"
ln -sfv "$dotfiles/nvim.vim" "$HOME/.config/nvim/init.vim" 

# iterm2 preferences
# we use Gruvbox styes for vim @ morhetz/gruvbox
# for iterm itself there is also a gruvbox theme @ morhetz/gruvbox-contrib
# lastly, the text is firacode @ tonsky/FiraCode
