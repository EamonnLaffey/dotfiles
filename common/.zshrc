# shellcheck shell=bash

# colors
autoload -U colors
colors

# auto complete
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# prompt
autoload -U promptinit
promptinit
prompt pure

# vim mode
bindkey -v
KEYTIMEOUT=1

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# less colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
export EDITOR=nvim
export PATH=$PATH:$HOME/.cargo/bin
eval "$(zoxide init zsh)"


alias e='exa'
alias ea='exa -a'
alias el='exa -l'
alias ela='exa -la'
alias diff='diff --color=auto'

clippy() {
    touch "$(fd --extension rs)" && cargo clippy
}

show_ports() {
    netstat -Watnlv | grep LISTEN | awk '{"ps -o comm= -p " $9 | getline procname;colred="\033[01;31m";colclr="\033[0m"; print colred "proto: " colclr $1 colred " | addr.port: " colclr $4 colred " | pid: " colclr $9 colred " | name: " colclr procname;  }' | column -t -s "|"
}

source ~/.notshared.zsh

