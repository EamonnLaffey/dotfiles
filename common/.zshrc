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

# alias'
alias e='exa'
alias ea='exa -a'
alias el='exa -l'
alias ela='exa -la'
#alias update="trizen -Syu --noedit --noconfirm"
#alias ls="ls --color=auto"
#alias la="ls -la --color=auto"
alias diff='diff --color=auto'
alias ..="cd .."
alias ...="cd ../.."

# bindings
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
KEYTIMEOUT=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR=nvim

# cargo
export PATH=$PATH:$HOME/.cargo/bin

source ~/.notshared.zsh

