vim.opt.encoding = 'UTF-8'
vim.opt.number = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.g.mapleader = ','

function ToggleTabSettings()
  if vim.o.tabstop == 8 then
    print("C++ Tab.")
    vim.o.tabstop = 2
    vim.o.shiftwidth = 2
    vim.o.softtabstop = 2
    vim.o.expandtab = true
  else
    print("Linux Tab.")
    vim.o.tabstop = 8
    vim.o.shiftwidth = 8
    vim.o.softtabstop = 8
    vim.o.expandtab = false
  end
end

vim.api.nvim_set_keymap('n', '<Leader>tt', ':lua ToggleTabSettings()<CR>', { noremap = true, silent = true })
