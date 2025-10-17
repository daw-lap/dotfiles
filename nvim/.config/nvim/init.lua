--python virtualenv
vim.g.python3_host_prog = '$HOME/.venv/neovim_p3/bin/python'
vim.g.python_host_prog = '$HOME/.venv/neovim_p2/bin/python'

require('general')
require('filetype-settings')
require('config.lazy')
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
