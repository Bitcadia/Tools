return {
  "nvim-neotest/neotest",
  dependencies = {
    "lawrence-laz/neotest-zig",
    "drsammyd/neotest-vitest",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      ["neotest-zig"] = {},
      ["neotest-vitest"] = {},
    },
  },
  keys = {
    {
      "<leader>tw",
      function()
        require("neotest").watch.watch(vim.fn.expand("%"))
      end,
      desc = "Watch File",
    },
    {
      "<leader>tW",
      function()
        require("neotest").watch.watch(vim.loop.cwd())
      end,
      desc = "Watch All Test Files",
    },
  },
}
