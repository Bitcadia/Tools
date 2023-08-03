return {
  {
    "nvim-neotest/neotest-plenary",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
      "drsammyd/neotest-vitest",
    },
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last Test",
      },
      {
        "<leader>tL",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
        desc = "Debug Last Test",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        "Step over",
      },
      {
        "<S-F9>",
        function()
          require("dap").step_out()
        end,
        "Step out",
      },
      {
        "<F9>",
        function()
          require("dap").step_into()
        end,
        "Step into",
      },
      {
        "<F8>",
        function()
          require("dap").continue()
        end,
        "Continue",
      },
    },
    opts = function(_, opts)
      table.insert(opts.adapters, require("neotest-plenary"))
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )
      table.insert(
        opts.adapters,
        require("neotest-vitest")({
          vitestCommand = "bun x vitest",
        })
      )
    end,
  },
}
