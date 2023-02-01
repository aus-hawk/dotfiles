local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap leader to space.
keymap("", " ", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local normal = {
    ["<Leader>e"] = ":NvimTreeFocus<CR>",
    ["<Leader>d"] = ":lua vim.lsp.buf.definition()<CR>",
    ["<Leader>b"] = "<C-t>",
    ["<Leader>h"] = ":lua vim.lsp.buf.hover()<CR>",
    ["<Leader>?"] = ":lua vim.diagnostic.open_float()<CR>",
    ["<Leader>f"] = ":lua vim.lsp.buf.format { async = true }<CR>",

    ["<Leader>/"] = ":nohlsearch<CR>",

    -- Easier window navigation.
    ["<C-h>"] = "<C-w>h",
    ["<C-l>"] = "<C-w>l",
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",

    ["<C-Up>"] = ":resize +1<CR>",
    ["<C-Down>"] = ":resize -1<CR>",
    ["<C-Left>"] = ":vertical resize -1<CR>",
    ["<C-Right>"] = ":vertical resize +1<CR>",
}

for k, v in pairs(normal) do
    keymap("n", k, v, opts)
end
