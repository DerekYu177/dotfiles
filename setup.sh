#!/usr/bin/env bash

# Make utilities available
export DOTFILES="$HOME/.dotfiles"
PATH="$DOTFILES/bin:$PATH"

# git
ln -sfv "$DOTFILES/.gitconfig" ~
ln -sfv "$DOTFILES/.gitignore_global" ~

# apply gitignore global
git config --global core.excludesfile '~/.gitignore_global'

# tmux
if [ -x "$(command -v tmux)" ]; then 
	ln -sfv "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"

	# install tpm for tmux and install associated packages
	tmux source ~/.tmux.conf
else
	echo "Tmux is not installed"
	echo "Installing now..."
	sudo apt-get install tmux
	echo "Finished installing, rerun this script again"
fi


# nvim
if [ -x "$(command -v nvim)" ]; then 
	mkdir -p $HOME/.config/nvim/
	ln -sfv "$DOTFILES/nvim.vim" "$HOME/.config/nvim/init.vim"
else
	echo "Nvim is not installed"
fi

