#bashrc

#if not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# if [ -f /etc/bashrc ]; then
#     . /etc/bashrc
# fi

export TERM="screen-256color"
export EDITOR=nvim

[[ "${USER}" = "dlapczyn" ]] && source $HOME/work_linux_settings/bashrc_work_specific.sh

[ -f ~/.bash_libs/prompt.bash ] && source ~/.bash_libs/prompt.bash
[ -f ~/.bash_libs/utils.sh ] && source ~/.bash_libs/utils.sh

