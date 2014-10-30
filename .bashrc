# File: .bashrc
# -------------
# This file customizes the BASH environment.


# Import the script necessary to show git info at the prompt.
if [[ -f .bash/.git-prompt.sh ]]; then
  source .bash/.git-prompt.sh
fi

# Import the script necessary for git tab completion.
if [[ -f .bash/.git-completion.sh ]]; then
  source .bash/.git-completion.sh
fi


# Customize the prompt.
PS1="\033[0;32m\w\$(__git_ps1)$\033[0m "


# Text editor.
alias v="vim"
export EDITOR="vim"
export VISUAL="vim"

# Hopefully prevent serious fuckups.
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
set -o noclobber

# Personalize commonly used commands.
alias ..="cd .."
alias ...="..;.."
alias c="cd"
alias l="ls -alF"
if [[ $(uname) == "Linux" ]]; then
  alias l="ls -alF --color"
fi
alias ll="l"
alias m="mkdir -p"
alias p="pwd"
alias pl="p;l"
alias t="touch"
