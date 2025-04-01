export EDITOR=nvim

eval "$(starship init bash)"

[ -f ~/.bashrc_work ] && source ~/.bashrc_work

export AUTOENV_ENV_FILENAME='env'
[ -d ~/.autoenv ] && source ~/.autoenv/activate.sh
