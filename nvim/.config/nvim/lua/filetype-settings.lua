vim.cmd [[
  autocmd BufNewFile,BufRead *.log setfiletype log
  autocmd BufNewFile,BufRead *.LOG setfiletype log
  autocmd BufNewFile,BufRead *.out setfiletype log
  autocmd BufNewFile,BufRead *.journal setfiletype messages
  autocmd Filetype cpp,c setlocal colorcolumn=100
  autocmd Filetype python setlocal colorcolumn=90
]]

local map = vim.api.nvim_set_keymap

map('n', '<space>l', ':set filetype=log<CR>', { noremap = true})
map('n', '<space>j', ':set filetype=messages<CR>', { noremap = true})
