#!/bin/bash
# this one needs to be bash
# everyone runs bash

# check to see if zsh has been install correctly
# if it has, ignore prompt, else source ~/.dotfiles/shell/bash_prompt
if hash zsh 2>/dev/null; then
	sudo chsh /usr/local/bin/zsh
	source ~/.dotfiles/zsh/zshrc
else
	source ~/.dotfiles/bash/bash_prompt
fi


