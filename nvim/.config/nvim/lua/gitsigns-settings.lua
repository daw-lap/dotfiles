local config = {
  signcolumn=true,
  numhl=true,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', "<space>b", gs.toggle_current_line_blame)
    map('n', '<space>d', gs.diffthis)
  end
}

return config
