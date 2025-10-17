return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  tag = "0.1.8",
  dependencies = {"nvim-lua/plenary.nvim"},
  keys = {
    {
      "<Leader>f",
      function () require("telescope.builtin").find_files() end,
      desc = "Find files",
    },
    {
      "<Leader>b",
      function () require("telescope.builtin").buffers() end,
      desc = "Buffer files",
    },
    {
      "<Leader>g",
      function () require("telescope.builtin").live_grep() end,
      desc = "Live Grep",
    },
    {
      "<Leader>s",
      function () require("telescope.builtin").grep_string() end,
      desc = "Grep string",
    },
    {
      "gd",
      function () require("telescope.builtin").lsp_definitions() end,
      desc = "LSP definitions",
    },
    {
      "gi",
      function () require("telescope.builtin").lsp_implementations() end,
      desc = "LSP implementations",
    },
    {
      "gr",
      function () require("telescope.builtin").lsp_references() end,
      desc = "LSP references",
    },
  },
  opts = {
    defaults = {
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        --'--hidden',      -- show hidden
        --'--no-ignore',   -- ignore .gitignore
      }
    },
  },
  --  pickers = {
  --    find_files = {
  --      hidden = true,
  --    }
  --  }
  --}

}
