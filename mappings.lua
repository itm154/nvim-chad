local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<leader>e"] = "",
    ["<tab>"] = "",
    ["<S-tab>"] = "",
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle NvimTree" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    ["<leader>]"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<leader>["] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },
  },
}

return M
