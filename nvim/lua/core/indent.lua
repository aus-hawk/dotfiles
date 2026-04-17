local opt = vim.opt
local g = vim.g

-- C and C-like
opt.cinoptions = {
    -- case labels aligned with `switch`
    ":0",
    -- consistent case alignment
    "l1",
    -- C++ scope declarations aligned with `class`
    "g0",
    -- C++ `namespace` block does not increase indent
    "N-s",
    -- C++ linkage block (extern "C") does not increase indent
    "E-s",
    -- indent 'shiftwidth' while inside unclosed parentheses
    "(s",
    -- closing parenthesis aligned with line containing open parenthesis
    "m1",
}

-- Python
g.python_indent = {
    -- normal indent after open parenthesis
    open_paren = "shiftwidth()",
    -- align closing parenthesis with line containing open parenthesis
    closed_paren_align_last_line = false,
}

-- Vim script
g.vim_indent_cont = vim.fn.shiftwidth()
