local M = {}

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local signs = { Error = "●", Warn = "●", Hint = "●", Info = "●" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local opts = { noremap = true, silent = true}

vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

local on_attach_clangd = function(client, bufnr)
  on_attach(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', '<cmd>:ClangdSwitchSourceHeader<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd> lua vim.lsp.buf.code_action({apply=true})<CR>', opts)
end

function M:configure()
  require('lspconfig')['clangd'].setup {
    on_attach = on_attach_clangd,
    cmd = {'clangd','--query-driver=/home/dawlap/.sdk/sysroots/x86_64-acu6sdk-linux/usr/bin/aarch64-acu6-linux/aarch64-acu6-linux-g++', '--clang-tidy'},
  }

  require('lspconfig')['pyright'].setup {
    on_attach = on_attach
  }
  require('lspconfig').pylsp.setup{
    settings ={
      pyls = {
        plugins = {
          pylint = {enabled = true},
          flake8 = {enabled = true},

        }
      }
    }
  }

  require('lspconfig').cmake.setup {
    buildDirectory = "build"
  }
end

return M
