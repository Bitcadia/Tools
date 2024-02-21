return {
  "andythigpen/nvim-coverage",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  rocks = { "lua-xmlreader" },
  opts = function()
    require("coverage").setup()
  end,
}
