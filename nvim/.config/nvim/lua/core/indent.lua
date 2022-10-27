local opt = vim.opt
local g = vim.g

--[[ C and C-like ]]--
-- TODO describe each of these.
opt.cinoptions = { ":0", "l1", "g0", "N-s", "E-s", "(s", "m1" }

g.python_indent = {
    open_paren = 'shiftwidth()',
    closed_paren_align_last_line = false;
}

g.vim_indent_cont = vim.fn.shiftwidth()
