return {
  "folke/snacks.nvim",
  lazy = false,
  terminal = {
    win = { style = "float"},
  },
  keys = {
    { "gr", function() Snacks.picker.lsp_references() end, desc = "LSP references", nowait = true},
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "LSP definition"},
    { "gdd", function() Snacks.picker.lsp_declarations() end, desc = "LSP declaration"},
    { "gi", function() Snacks.picker.lsp_implementations() end, desc = "LSP implementation"},
    { "<leader>f", function() Snacks.picker.files() end, desc= "Find files"},
    { "<leader><space>", function() Snacks.picker.smart() end, desc="Smart find files"},
    { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffer files"},
    { "<leader>g", function() Snacks.picker.grep() end, desc=" Grep"},

  }
}
