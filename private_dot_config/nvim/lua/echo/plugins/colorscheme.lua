return {
  "Shatur/neovim-ayu",
  priority = 1000, -- load before all other plugins
  config = function()
    require("ayu").setup({
      mirage = false,
      -- Transparency overrides, see https://github.com/Shatur/neovim-ayu#transparency
      overrides = {
        NormalFloat = { bg = "#212733" }, -- lighter UI popups
      },
    })

    vim.cmd([[colorscheme ayu]])
  end,
}
