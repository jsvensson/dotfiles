local M = { "catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	opts = {
		flavour = "macchiato",
	},
	config = function()
		vim.cmd([[colorscheme catppuccin]])
	end
}

return M
