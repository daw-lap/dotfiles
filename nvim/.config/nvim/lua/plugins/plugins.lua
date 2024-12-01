local plugins = {
  {
    "windwp/nvim-autopairs",
    event = { 'BufRead', 'BufNewFile' },
    config = function(_, _)
      require("nvim-autopairs").setup()
    end
  },
  {
    "numToStr/Comment.nvim",
    event = { 'BufRead', 'BufNewFile' },
    opts = function()
      return require("comment-settings")
    end,
    config = function(_, opts)
      require("Comment").setup(opts)
    end
  },
  {
    "matfranczyk/highlighter.vim",
    lazy = false
  },
  --{
  -- "yamatsum/nvim-cursorline",
  -- lazy = false,
  -- opts = function()
  --   return require("cursorline-settings")
  -- end,
  -- config = function(_, opts)
  --   require("nvim-cursorline").setup{opts}
  -- end
  --},
  --git
  {
    "lewis6991/gitsigns.nvim",
    event = { 'BufRead', 'BufNewFile' },
    opts = function()
      return require("gitsigns-settings")
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end
  },
  --utilities
  {
    "bronson/vim-trailing-whitespace",
    event = { 'BufRead', 'BufNewFile' },
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    tag = "0.1.4",
    dependencies = {"nvim-lua/plenary.nvim"},
    init = function()
      require ("telescope-settings")
    end,
  },
  --lsp
  {
    "neovim/nvim-lspconfig",
    event = { 'BufRead', 'BufNewFile' },
    config = function(_, _)
      require("lsp-settings").configure()
    end
  },
  --syntax
  {
    "nvim-treesitter/nvim-treesitter",
    event = { 'BufRead', 'BufNewFile' },
    build = ":TSUpdate",
    opts = function()
      return require("treesitter-settings")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    config = function(_,_)
      require("colorscheme")
    end
  },
  {
    "mfussenegger/nvim-lint",
    config = function(_,_)
      require('lint').linters_by_ft = {
        markdown = {cppcheck,}
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  }
}

return plugins
