return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    signcolumn = true,
    numhl = true,
  },
  keys = {
    {
      "<space>b",
      function()
        require("gitsigns").blame_line {full = true}
      end,
      desc = "Blame line",
    },
  }
}
