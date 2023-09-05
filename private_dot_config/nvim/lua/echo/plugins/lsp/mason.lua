return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
    mason.setup({
      --ui = {
      --}
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "gopls",        -- Go
        "lua_ls",       -- Lua
        "terraformls",  -- Terraform
      },
      automatic_installation = false, -- not the same as ensure_installed
    })

  end,
}
