local M = {
  "projekt0n/circles.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require("circles").setup()
  end,
}

return M
