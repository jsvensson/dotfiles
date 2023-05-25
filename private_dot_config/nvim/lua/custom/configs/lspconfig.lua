local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      -- Autocomplete and import unimported packages
      completeUnimported = true,

      -- Placeholders for function parameters etc
      usePlaceholders = true,

      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- Terraform setup
lspconfig.terraformls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"terraform-ls"},
  filetypes = {"tf"},
}

