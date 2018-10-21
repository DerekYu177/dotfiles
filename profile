#!/bin/bash
# this one needs to be bash
# everyone runs bash

# check to see if zsh has been install correctly
# if it has, ignore prompt, else source ~/.dotfiles/shell/bash_prompt
if hash zsh 2>/dev/null; then
	sudo chsh /usr/local/bin/zsh
	source $HOME/dotfiles/zsh/zshrc
else
	source $HOME/dotfiles/bash/bash_profile
fi
