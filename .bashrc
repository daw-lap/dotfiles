#bashrc

#if not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# if [ -f /etc/bashrc ]; then
#     . /etc/bashrc
# fi

export TERM="screen-256color"
export EDITOR=nvim

[ -f $HOME/.bashrc.user ] && source $HOME/.bashrc.user
[ -f ~/.bash_libs/utils.sh ] && source ~/.bash_libs/utils.sh

