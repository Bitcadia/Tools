return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    on_attach = function()
      vim.notify("Typescript LSP attached")
    end,
  },
}
