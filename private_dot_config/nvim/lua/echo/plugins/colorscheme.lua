return {
  "Shatur/neovim-ayu",
  priority = 1000, -- load before all other plugins
  config = function()
    vim.cmd([[colorscheme ayu]])
  end,
}
