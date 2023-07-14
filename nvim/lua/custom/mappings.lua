local M = {}

M.general = {
  n={
    ["<leader>fg"] = { "<cmd> Telescope git_files <CR>", "Find git files" },
    ["<C-n>"] = { "", "Multi-select" },
    ["<C-h>"] = { "<cmd>NvimTmuxNavigateLeft<CR>", "Move pane left"},
    ["<C-j>"] = { "<cmd>NvimTmuxNavigateDown<CR>", "Move pane down"},
    ["<C-k>"] = { "<cmd>NvimTmuxNavigateUp<CR>", "Move pane up"},
    ["<C-l>"] = { "<cmd>NvimTmuxNavigateRight<CR>", "Move pane right"},
    ["<C-\\>"] = { "<cmd>NvimTmuxNavigateLastActive<CR>", "Move pane last"},
    ["<C-Space>"] = { "<cmd>NvimTmuxNavigateNext<CR>", "Move pane next"},
  }
}
M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

return M
