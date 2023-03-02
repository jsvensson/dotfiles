local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local repo = "https://github.com/folke/lazy.nvim.git"

if not vim.loop.fs_stat(path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    repo,
    "--branch=stable", -- latest stable release
    path,
  })
end

vim.opt.rtp:prepend(path)

require('lazy').setup('echo.plugins', {})
