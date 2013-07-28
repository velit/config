if [[ "$TERM" = "xterm" && "$COLORTERM" = "gnome-terminal" ]]; then
    export TERM=gnome-256color
fi

if [[ "$TERM" = "xterm" && "$COLORTERM" = "Terminal" ]]; then
    export TERM=gnome-256color
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

stty stop ''
stty start ''

if [ -d "$HOME/links" ] ; then
    PATH="$HOME/links:$PATH"
fi

export ESCDELAY=25
alias la='"ls" --color=auto --group-directories-first -lAhX'
alias ls='ls --color=auto --group-directories-first --time-style=iso -BhgG'
alias ll='ls -alF'
alias l='ls -CF'
alias dir='ls --color=auto --format=vertical'
alias tree='tree -L 2'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias untar='tar -xvf'
alias mv='mv -i'
alias cp='cp -i'
