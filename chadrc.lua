---@type ChadrcConfig
local M = {}

-- UI settings
M.ui = {
  theme = "rosepine",
  statusline = {
    separator_style = "round",
    theme = "minimal",
  },
  cmp = {
    style = "atom",
  },
  telescope = {
    style = "bordered",
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "██╗████████╗███╗   ███╗  ███╗  ███████╗  ██╗██╗",
      "██║╚══██╔══╝████╗ ████║ ████║  ██╔════╝ ██╔╝██║",
      "██║   ██║   ██╔████╔██║██╔██║  ██████╗ ██╔╝ ██║",
      "██║   ██║   ██║╚██╔╝██║╚═╝██║  ╚════██╗███████║",
      "██║   ██║   ██║ ╚═╝ ██║███████╗██████╔╝╚════██║",
      "╚═╝   ╚═╝   ╚═╝     ╚═╝╚══════╝╚═════╝      ╚═╝",
    },
  },
}

-- Custom configurations
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
