local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
     require "custom.configs.lspconfig"
    end
  }, {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  },{
    "nvim-neotest/neotest",
    lazy = false,
    dependencies = {
      'marilari88/neotest-vitest',
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap"
    },
    config = function ()
      require "custom.configs.neotest"
      require("neotest").setup({
        adapters = {
          require("plenary"),
          require("neotest-vitest")({
            dap = { justMyCode = false },
          })
        }
      })
    end,
  },{
    'folke/neodev.nvim',
    config = function ()
      require("neodev").setup({
        library = { plugins = { "neotest" }, types = true }
      })
    end,
    lazy = false
  },{
    "alexghergh/nvim-tmux-navigation",
    config = function ()
      local nvim_tmux_nav = require("nvim-tmux-navigation")
      nvim_tmux_nav.setup({})
    end,
    lazy = false,
  },{
    "mg979/vim-visual-multi",
    lazy = false
  },{
    "mfussenegger/nvim-dap",
    {}
  },{
    "zbirenbaum/copilot.lua",
    config = function ()
      require("copilot").setup()
    end,
    -- Lazy load when event occurs. Events are triggered
    -- as mentioned in:
    -- https://vi.stackexchange.com/a/4495/20389
    event = "InsertEnter",
  },{
    "tpope/vim-fugitive",
    lazy = false,
  }
}

return plugins
