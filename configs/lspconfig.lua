local util = require "lspconfig/util"
local capabilities = require("plugins.configs.lspconfig").capabilities
local on_attach = function(client, bufnr)
  require("plugins.configs.lspconfig").on_attach(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
end

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "pyright",
  "marksman",
  "svelte",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}
