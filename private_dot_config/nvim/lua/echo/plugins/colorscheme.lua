return {
  "Shatur/neovim-ayu",
  priority = 1000, -- load before all other plugins
  config = function()
    local colors = require("ayu.colors")
    colors.generate()

    require("ayu").setup({
      mirage = false,
      -- Transparency overrides, see https://github.com/Shatur/neovim-ayu#transparency
      overrides = {
        NormalFloat = { bg = "#212733" }, -- lighter UI popups
        LineNr = { fg = colors.comment }, -- lighter number column
      },
    })

    vim.cmd([[colorscheme ayu]])
  end,
}
