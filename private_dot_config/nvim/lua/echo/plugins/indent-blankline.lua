local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  config = function()
    require("indent_blankline").setup({
      char = '┊',
      show_current_context = true, -- highlight the current context
      show_current_context_start = false, -- underline on starting line for context
    })
  end,
}

return M
