--python virtualenv
vim.g.python3_host_prog = '$HOME/.venv/neovim_p3/bin/python'
vim.g.python_host_prog = '$HOME/.venv/neovim_p2/bin/python'

require('general')
require('filetype-settings')
require('plugins').configure()
