local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  build = ":TSUpdate",
  dependencies = { "RRethy/nvim-treesitter-textsubjects" },
}

M.opts = {
  ensure_installed = {
    "dockerfile",
    "fish",
    "gitignore",
    "go", "gomod", "gosum",
    "json", "json5",
    "lua",
    "markdown",
    "terraform",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}

M.config = function(_, opts)
  require("nvim-treesitter.configs").setup(opts)
end

return M
