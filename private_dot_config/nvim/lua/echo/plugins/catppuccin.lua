local M = { "catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	config = function()
		vim.cmd([[colorscheme catppuccin-macchiato]])
	end
}

return M
