# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ENABLE_CORRECTION="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# OMZ plugins
plugins=(git zsh-autosuggestions golang docker macos)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

# Aliases

mkcd() {
    mkdir $1 && cd $1
}

cdb() {
    BACK="../"
    if [[ "$1" == "" ]]
    then
        cd ../
    else
    for ((i = 0; i < $1 - 1; i++)); do
        BACK+="../"
    done;
    cd "$BACK"
    fi
}

## Exa
alias l="exa -l -h"
alias la="exa -lg -h"
alias ls="exa"
alias lsr="exa -R"
alias lt="exa --tree"
alias lta="exa -l --tree -h"
alias lg="exa -l --git -h"

## Spotify
alias sp="spotify play"
alias spa="spotify play album"
alias spar="spotify play artist"
alias spp="spotify play list playlist"
alias spu="spotify play url"

alias ss="spotify status"
alias ssa="spotify status album"
alias ssar="spotify status artist"
alias ssp="spotify status playlist"

alias snx="spotify next"
alias spr="spotify prev"
alias sprp="spotify replay"
alias spause="spotify pause"
alias sst="spotify stop"
alias ssq="spotify quit"

alial sshare="spotify share url"
