return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      zig = { "zigfmt" },
      sh = { "shfmt" },
      typescript = { "biome" },
      typescriptreact = { "biome", "rustywind" },
    },
  },
}
