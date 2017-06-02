PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

stty stop ''
stty start ''

export EDITOR="vim"
export ESCDELAY=25
export LESS=' -FRX -x4'
export MYVIMFOLDER=~/.vim/

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
