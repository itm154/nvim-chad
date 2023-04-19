local plugins = {

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        ["<Tab>"] = require("cmp").mapping.confirm { select = true },

        ["<S-Tab>"] = function(callback)
          callback()
        end,

        -- use Up and down for cycling completion
        ["<Down>"] = require("cmp").mapping(function(fallback)
          local cmp = require "cmp"
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<Up>"] = require("cmp").mapping(function(fallback)
          local cmp = require "cmp"
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),

        ["<C-j>"] = require("cmp").mapping(function(fallback)
          local cmp = require "cmp"
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<C-k>"] = require("cmp").mapping(function(fallback)
          local cmp = require "cmp"
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
    },
  },

  {
    "abecodes/tabout.nvim",
    event = "InsertEnter",
    opts = {
      tabkey = "<Tab>",
      backwards_tabkey = "<S-Tab>",
      act_as_tab = true,
      act_as_shift_tab = false,
      default_tab = "<C-t>",
      default_shift_tab = "<C-d>",
      enable_backwards = true,
      completion = true,
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "*", close = "*" },
      },
      ignore_beginning = false,
      exclude = {
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "text",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
  },
  config = function()
    require "plugins.configs.lspconfig"
    require "custom.configs.lspconfig"
  end,

  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    config = function()
      require("fidget").setup()
    end,
  },

  {
    "andweeb/presence.nvim",
    lazy = false,
    opts = {
      auto_update = true,
      main_image = "neovim",
      neovim_image_text = "i use (n)vim btw",

      editing_text = "Editing %s",
      file_explorer_text = "Browsing %s",
      git_commit_text = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text = "Reading %s",
      workspace_text = "Working on %s",
      line_number_text = "Line %s out of %s",
    },
  },
}

return plugins
