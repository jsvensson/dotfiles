local M = {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      lsp_gofumpt = true, -- make gopls use gofumpt instead of go fmt
    })
  end,
  event = { "CmdlineEnter" },
  ft = {
    "go",
    "gomod",
  },
  build = ':lua require("go.install").update_all_sync()'
}

return M
