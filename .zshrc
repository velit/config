stty stop ''
stty start ''

export PATH=~/links:~/bin:$PATH
export PAGER=~/bin/vimpager
alias less=$PAGER
alias zless=$PAGER
export EDITOR=vim
export ESCDELAY=25
export LESS=' -FRX -x4'
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=512m"

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

alias md='mkdir -p'
alias rd=rmdir
alias d='dirs -v | head -10'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

PROMPT="%B%F{green}%n@%m%f%b:%B%F{blue}%~%_%f%b$ "

setopt alwaystoend
setopt autocd
setopt noautomenu
setopt nobeep
setopt histignorealldups
setopt histignorespace
setopt incappendhistory
setopt longlistjobs

# Use emacs keybindings
bindkey -e

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
#bindkey "^[OC" forward-word
#bindkey "^[OD" backward-word

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
autoload -Uz compinit
compinit
