local options = {
	clipboard = "unnamedplus",
	colorcolumn = "+1",
	cursorline = true,
	foldlevelstart = 99,
	foldmethod = "syntax",
	list = true,
	listchars = { trail = "·", tab = "  " },
	mouse = "a",
	number = true,
	relativenumber = true,
	shiftwidth = 4,
	splitbelow = true,
	splitright = true,
	tabstop = 4,
	termguicolors = true,
	textwidth = 80,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
