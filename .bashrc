# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export LANG=en_GB
export LC_CTYPE=en_GB
export BBS_ROOT=~sjc/Pictures/bbs/
export PERL5LIB=~/Documents/code/bbs/

export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%Y-%m-%d %H:%M "

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    export PATH=~/bin:"${PATH}"
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

. ~/.bash_completions
. ~/.git-completion.bash

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# some more ls aliases
alias ls='ls -G'
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"


PS1='\[\033[00;32m\]\u@\h \A\[\033[00;34m\] \w \[\033[00;33m\]$(__git_ps1 "%s") \[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|screen*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD}\007"'
    ;;
*)
    ;;
esac

# Define your own aliases here ...
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

