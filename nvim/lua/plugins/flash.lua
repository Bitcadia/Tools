return {
  "folke/flash.nvim",
  keys = {
    { "s", "s", mode = { "n", "v" }, desc = "Substitute char", remap = true },
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
