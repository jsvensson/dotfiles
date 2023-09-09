return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    local opts = {
      noremap = true,
      silent = true,
    }

    -- change diagnostic signs in gutter
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set key bindings
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", vim.lsp.buf.declaration, opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", "<cmd>Telescope lsp_definitions<CR>", opts)

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
    end -- end on_attach

    -- enable autocompletion for every LSP config
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- default setup object, unless specifically overridden
    local default_setup = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    local servers = {
      "gopls",
      "terraformls",
    }

    for _, server in ipairs(servers) do
      lspconfig[server].setup(default_setup)
    end

    -- specific server configs below

    -- Lua LSP config
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for Lua
        Lua = {
          -- make LS recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make LS aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end, -- end config
}
