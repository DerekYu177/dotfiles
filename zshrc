#!/bin/zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export DOTFILES="$HOME/dotfiles"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tmux
  colored-man-pages
  brew
  macOS
)

source $ZSH/oh-my-zsh.sh

# Jump configuration
# eval "$(jump shell zsh)"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# load custom stuff
for file in $DOTFILES/shell/*(.); do
	source $file
done

# if our main machine
# uncomment as necessary
# for file in $DOTFILES/tools/mac/*(.); do source $file; done;

# observe https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
# case "$(uname -s)" in
# 	Darwin)
# 		echo 'macOS';;
# 	Linux)
# 		echo 'Linux';;
# 	CYGWIN*|MINGW32*|MSYS*)
# 		echo 'MS Windows';;
#
# 	*)
# 		echo 'other OS';;
# esac

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Add the following to the ~/.bash_profile or ~/.zshrc file:
source /usr/local/opt/chruby/share/chruby/chruby.sh

# To enable auto-switching of Rubies specified by .ruby-version files,
# add the following to ~/.bash_profile or ~/.zshrc:
source /usr/local/opt/chruby/share/chruby/auto.sh

# heroku
# eval "$(heroku autocomplete:script zsh)"
