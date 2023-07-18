return {
  {
    "alexghergh/nvim-tmux-navigation",
    opts = function()
      require("nvim-tmux-navigation").setup({})
    end,
    keys = {
      { "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>", "n", desc = "Move pane Left" },
      { "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>", "n", desc = "Move pane down" },
      { "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>", "n", desc = "Move pane up" },
      { "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>", "n", desc = "Move pane right" },
      { "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<CR>", "n", desc = "Move pane last" },
      { "<C-Space>", "<cmd>NvimTmuxNavigateNext<CR>", "n", desc = "Move pane next" },
    },
  },
}
