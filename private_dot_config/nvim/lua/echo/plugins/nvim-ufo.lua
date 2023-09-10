local M = {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  config = function()
    local opts = vim.o
    local ufo = require("ufo")

    opts.foldcolumn = '1' -- '0' is not bad
    opts.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    opts.foldlevelstart = 99
    opts.foldenable = true

    vim.keymap.set('n', 'zR', ufo.openAllFolds)
    vim.keymap.set('n', 'zM', ufo.closeAllFolds)

    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        return {"treesitter", "indent"}
      end
    })
  end,
}

return M
