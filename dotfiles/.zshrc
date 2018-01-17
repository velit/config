[ -f ~/.zsh_local ] && source ~/.zsh_local

stty stop ''
stty start ''

export PATH=~/links:~/bin:$PATH

export NEOVIMCONFIG=~/.config/nvim/
export NEOVIMWORK=~/.local/share/nvim/
export EDITOR=vim
export ESCDELAY=25

export PAGER=~/bin/vimpager
alias less=$PAGER
alias zless=$PAGER
export LESS=' -FRX -x4'
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"

export CLICOLOR=YES

LS_DEFAULT='"ls" -hv --color=auto --group-directories-first --time-style=locale --si'

alias ls="$LS_DEFAULT -w 80"
alias l="$LS_DEFAULT -1"
alias la="$LS_DEFAULT -1As"
alias ll="$LS_DEFAULT  -lA"

alias grep='"grep" --color=auto'
alias fgrep='"fgrep" --color=auto'
alias egrep='"egrep" --color=auto'
alias mv='"mv" -i'
alias cp='"cp" -i'
alias extract='"dtrx" -vn --one=here'
alias untar=extract
alias du_h='du -sh * .?* | sort -h'

alias md='mkdir -p'
alias rd=rmdir

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

alias help=run-help

PROMPT="%B%F{green}%n@%m%f%b:%B%F{blue}%~%_%f%b$ "

setopt alwaystoend
setopt noautomenu
setopt nobeep
setopt histignorealldups
setopt histignorespace
setopt incappendhistory
setopt longlistjobs
setopt sharehistory
setopt extended_glob

unsetopt nomatch
unsetopt prompt_cr
unsetopt prompt_sp

# Use emacs keybindings
bindkey -e

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
no-operation () {}
zle -N no-operation
bindkey "[25~" no-operation
#bindkey "^[OC" forward-word
#bindkey "^[OD" backward-word

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' special-dirs true
autoload -Uz compinit
compinit

if [[ -x /usr/lib/command-not-found ]] ; then
    if (( ! ${+functions[command_not_found_handler]} )) ; then
        function command_not_found_handler {
            [[ -x /usr/lib/command-not-found ]] || return 1
            /usr/lib/command-not-found --no-failure-msg -- ${1+"$1"} && :
        }
    fi
fi

export FZF_DEFAULT_COMMAND='ag --nocolor -u -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

precmd () {
    print -Pn "\e]1;${PWD##*/}\a"
}
