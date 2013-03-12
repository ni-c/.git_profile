# ~/.bashrc: executed by bash(1) for non-login shells.

# GitHub Stuff
# see https://github.com/git/git/tree/master/contrib/completion

# Download scripts for autocompletion
if [ ! -f ~/.git-prompt.sh ]; then
wget -O ~/.git-prompt.sh https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
fi
if [ ! -f ~/.git-completion.sh ]; then
wget -O ~/.git-completion.sh https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
fi
source ~/.git-prompt.sh
source ~/.git-completion.sh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# Color prompt
PS1='\[\033[0;33m\]\u\[\033[0m\]@\[\033[0;32m\]\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0;36m\]$(__git_ps1 " (%s)")\[\033[0m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f /usr/local/bin/hub ]; then
  eval "$(hub alias -s)"
fi

# This will cause a pull-request to be generated for the currently checked-out branch back into the development 
# branch of the repo (obviously replace [github owner] with your github code owner's username), so instead of typing 
# out all that malarky I can just type pr "adding foobaz to the frutz".
# (Source: http://blog.selfassembled.org/posts/github_and_workflows.html)
function pr (){
    if [ ! -f /usr/local/bin/hub ]; then
        echo "Hub is not installed (https://github.com/defunkt/hub). To install type:"
        echo "git clone git://github.com/defunkt/hub.git"
        echo "cd hub"
        echo "sudo rake install prefix=/usr/local"
    fi
    if [ -f /usr/local/bin/hub ]; then
        git_branch=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')
        owner=`git config --get user.name`
        git pull-request "$@" -b $owner:development -h $owner:$git_branch
    fi
}

# This allows you to create a new branch off development, and if you've done any work that needs to be on that branch, 
# stash it, update from development, create your branch and then apply your stash on top of the new branch. Nifty.
# (Source: http://blog.selfassembled.org/posts/github_and_workflows.html)
function branch (){
    args=("$@")
    if [ -n "${args[1]}" ]; then
        git stash
    fi

    git checkout development && git pull && git checkout -b ${args[0]}

    if [ -n "${args[1]}" ]; then
        git stash pop
    fi
}
