return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    { "s", "s", mode = "n", desc = "Substitute char" },
    {
      ";",
      function()
        require("flash").jump()
      end,
      mode = { "n", "o", "x" },
      desc = "Flash search",
    },
  },
}
