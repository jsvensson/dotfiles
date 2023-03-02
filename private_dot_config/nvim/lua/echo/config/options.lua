local options = {
	-- Appearance
	termguicolors = true,
	number = true,        -- line number in gutter
  cursorline = true,    -- highlight current line

	-- Tabs and spaces
	shiftwidth = 2,
	tabstop = 2,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
