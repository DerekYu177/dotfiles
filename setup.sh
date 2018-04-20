#!/usr/bin/env bash

# Make utilities available

DOTFILES_DIR="$HOME/.dotfiles"
PATH="$DOTFILES_DIR/bin:$PATH"

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/core/bash_profile" "$HOME/.bash_profile"
ln -sfv "$DOTFILES_DIR/core/inputrc" "$HOME/.inputrc"
ln -sfv "$DOTFILES_DIR/core/bashrc" "$HOME/.bashrc"
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
