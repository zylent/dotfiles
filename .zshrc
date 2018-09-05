export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=/Users/nason/.oh-my-zsh

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '/home/anason/.zshrc'

autoload -Uz compinit
compinit
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob notify

#ZSH_THEME="robbyrussell"
ZSH_THEME="pygmalion"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git last-working-dir)

source $ZSH/oh-my-zsh.sh

alias vw="nvim -c VimwikiIndex"
alias jm="jira mine | sed -e 's#Awaiting Customer/Purchase#wait        #g'"
alias jshort="jira list -a nason"
alias vim="nvim"
alias vi="nvim"
alias weather="ansiweather -l Portland -u imperial -a false -d true -p false"
alias weather_week="ansiweather -l Portland -u imperial -a false -F"

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1


PATH="/Users/nason/perl5/bin${PATH:+:${PATH}}"; export PATH;
PATH="/Users/nason/go/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/nason/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/nason/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/nason/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/nason/perl5"; export PERL_MM_OPT;
