local panel_bg = "#212733"

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
        NormalFloat = { bg = panel_bg }, -- lighter UI popups

        -- adjust line numbers in gutter
        LineNr = { fg = colors.func },
        LineNrAbove = { fg = colors.selection_bg },
        LineNrBelow = { fg = colors.selection_bg },

        NeoTreeCursorLine = { bg = panel_bg },
      },
    })

  vim.cmd([[colorscheme ayu]])
  end,
}
