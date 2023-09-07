local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  build = ":TSUpdate",
  dependencies = { "RRethy/nvim-treesitter-textsubjects" },
}

M.opts = {
  ensure_installed = {
    "dockerfile",
    "gitignore",
    "go",
    "gomod",
    "lua",
    "markdown",
    "terraform",
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
