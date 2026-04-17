local options = {
    -- yank into system clipboard
    clipboard = "unnamedplus",
    -- ruler highlighting textwidth and column 120
    colorcolumn = "+1,121",
    cursorline = true,
    expandtab = true,
    foldlevelstart = 99,
    foldmethod = "syntax",
    -- show trailing whitespace
    list = true,
    listchars = { trail = "·", tab = "  " },
    mouse = "",
    number = true,
    relativenumber = true,
    shiftwidth = 4,
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    textwidth = 80,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
