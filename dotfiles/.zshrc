stty -ixon

export PATH=~/links:~/bin:~/.local/bin/:$PATH

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

alias downloads='find ~/Downloads -type f -printf "%T@ %Tc %p\n" | sort -n | tail'
alias dls=downloads

alias ls="$LS_DEFAULT -w 80"
alias l="$LS_DEFAULT -1"
alias la="$LS_DEFAULT -1As"
alias ll="$LS_DEFAULT  -lA"

alias grep='"grep" --color=auto'
alias fgrep='"fgrep" --color=auto'
alias egrep='"egrep" --color=auto'
alias mv='"mv" -i'
alias cp='"cp" -i'
alias tar='"tar" -k'
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

PROMPT="%B%F{green}%n@%m%f%b:%B%F{blue}%~%_%f%b$ "

autoload run-help
alias help=run-help
autoload zmv

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
bindkey \^U backward-kill-line

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
# bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
no-operation () {}
zle -N no-operation
bindkey "[25~" no-operation
#bindkey "^[OC" forward-word
#bindkey "^[OD" backward-word

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

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

function title {
    echo -ne "\033]0;"$*"\007"
}

function my_success() {
    osascript -e "display notification with title \"$* success\" sound name \"Glass\""
}

function my_error() {
    osascript -e "display notification with title \"$* error\" sound name \"Funk\""
}

function check() {
    if [ $? == 0 ]; then
        my_success "$@";
    else
        my_error "$@";
    fi
}

alias ding="osascript -e 'display notification with title \"Ding\" sound name \"Glass\"'"

[ -f ~/.zsh_local ] && source ~/.zsh_local
