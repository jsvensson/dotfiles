local M = {
  "numToStr/Comment.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = true, -- runs require('Comment').setup()
  keys = {
    { 'gb', mode = { 'n', 'v' }, desc = "Block comment" },
    { 'gc', mode = { 'n', 'v' }, desc = "Line comment" },
  }
}

return M
