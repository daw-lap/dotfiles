#
# ~/.bashrc
#

function source_file() {
    if [ -f $1 ]; then
        source $1
    else
        echo "$1 doesn't exist, cannot be sourced"
    fi
}

function is_work_username() {
    [[ "${USER}" = "dlapczyn" ]]
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# TERM=xterm
export TERM=xterm-256color

if is_work_username; then
    source_file $HOME/work_linux_settings/bashrc_work_specific.sh
fi
