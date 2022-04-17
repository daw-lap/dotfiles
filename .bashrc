export EDITOR=nvim

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/soft/nvim/bin:$PATH
export PATH=$HOME/dev-helper-functions:$PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

. "$HOME/.cargo/env"

eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/space.omp.json)"
