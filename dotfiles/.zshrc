stty -ixon

export PATH=~/links:~/bin:~/.local/bin/:$PATH

export NEOVIMCONFIG=~/.config/nvim/
export NEOVIMWORK=~/.local/share/nvim/
export EDITOR=vim
export ESCDELAY=25

export PAGER=less
alias zless=$PAGER
export LESS=' -FRX -x4'
export LESSOPEN="| src-hilite-lesspipe.sh %s"

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

autoload zkbd
autoload up-line-or-beginning-search
zle -N up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N down-line-or-beginning-search

# Use emacs keybindings
bindkey -e

bindkey \^U backward-kill-line

if [ -f ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]; then
    source ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
else
    zkbd
    source ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
fi

# autoload zkbd; zkbd
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char

[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line

[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history

[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-beginning-search
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-beginning-search

[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

[[ -n ${key[AltLeft]} ]] && bindkey "${key[AltLeft]}" backward-word
[[ -n ${key[AltRight]} ]] && bindkey "${key[AltRight]}" forward-word

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

precmd () {
    print -Pn "\e]1;${PWD##*/}\a"
}

function title {
    echo -ne "\033]0;"$*"\007"
}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init --path)"
fi
eval "$(pyenv virtualenv-init -)"

if [[ $(uname) == "Darwin" ]]; then
    [ -f ~/.zsh_darwin ] && source ~/.zsh_darwin
else
    [ -f ~/.zsh_linux ] && source ~/.zsh_linux
fi

[ -f ~/.zsh_local ] && source ~/.zsh_local
