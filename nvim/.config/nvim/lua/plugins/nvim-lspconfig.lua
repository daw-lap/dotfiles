return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  keys = {
    {
      "<space>e",
      function() vim.diagnostic.open_float() end,
    },
    {
      "<space>q",
      function() vim.diagnostic.setloclist() end,
    },
    {
      "[d",
      function() vim.diagnostic.goto_prev() end,
    },
    {
      "]d",
      function() vim.diagnostic.goto_next() end,
    },
  },
  config = function()
    local gcc_path = os.getenv('GCC_PATH')
    local opts = { noremap = true, silent = true}

    local on_attach = function(client, bufnr)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    end

    local on_attach_clangd = function(client, bufnr)
      on_attach(client, bufnr)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', '<cmd>:ClangdSwitchSourceHeader<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd> lua vim.lsp.buf.code_action({apply=true})<CR>', opts)
    end

    clangd_command = {'clangd', '--clang-tidy'}
    if gcc_path then
      table.insert(clangd_command, '--query-driver=' .. gcc_path)
    end

    vim.lsp.config("clangd", {
    --require('lspconfig')['clangd'].setup {
      on_attach = on_attach_clangd,
      cmd = clangd_command,
    })
    vim.lsp.enable("clangd")

    vim.lsp.config("pyright", {
    --require('lspconfig')['pyright'].setup {
      on_attach = on_attach
    })
    vim.lsp.enable("pyright")

    vim.lsp.config("pylsp", {
    --require('lspconfig').pylsp.setup{
      settings ={
        pyls = {
          plugins = {
            pylint = {enabled = true},
            flake8 = {enabled = true},

          }
        }
      }
    })
    vim.lsp.enable("pylsp")

    vim.lsp.config("cmake", {
    --require('lspconfig').cmake.setup {
      buildDirectory = "build"
    })
    vim.lsp.enable("cmake")
  end,

}
