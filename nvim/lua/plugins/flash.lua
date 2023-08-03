return {
  "folke/flash.nvim",
  keys = {
    {
      "s",
      false,
      mode = { "n", "o", "x" },
    },
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
