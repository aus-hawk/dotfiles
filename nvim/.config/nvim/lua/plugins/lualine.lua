require("lualine").setup {
	options = {
		component_separators = { left = "|", right = "|" },
		section_separators = "",
	},
	sections = {
		lualine_c = {
			{ "filename", path = 1 }
		}
	}
}
