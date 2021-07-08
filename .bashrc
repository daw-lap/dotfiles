#bashrc

#if not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# if [ -f /etc/bashrc ]; then
#     . /etc/bashrc
# fi

[ -f $HOME/.bashrc.user ] && source $HOME/.bashrc.user

