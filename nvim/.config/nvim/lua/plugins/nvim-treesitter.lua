return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bitbake",
      "cpp",
      "c",
      "python",
      "cmake",
      "bash",
      "comment",
      "json",
      "make",
      "regex",
      "toml",
      "vim",
      "yaml",
      "lua",
      "html",
      "css",
      "javascript",
      "diff",
      "dockerfile",
      "gitignore",
      "git_rebase",
      "gitcommit",
      "strace",

    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  }
}
