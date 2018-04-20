#!/usr/bin/env bash

# Make utilities available

DOTFILES_DIR='~/.dotfiles'
PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first
if is-executable git -a -d "$DOTFILES_DIR/.git" 
then 
  git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master
fi

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/core/bash_profile" "$HOME/.bash_profile"
ln -sfv "$DOTFILES_DIR/core/inputrc" "$HOME/.inputrc"
ln -sfv "$DOTFILES_DIR/core/bashrc" "$HOME/.bashrc"
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
