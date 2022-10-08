require("lspconfig").ccls.setup {} -- C/C++
require("lspconfig").pyright.setup {} -- Python
require("lspconfig").sumneko_lua.setup {} -- Lua

vim.diagnostic.config { virtual_text = false }

local signs = {
    DiagnosticSignError = "",
    DiagnosticSignWarn = "",
    DiagnosticSignInfo = "",
    DiagnosticSignHint = "",
}

for name, sign in pairs(signs) do
    vim.fn.sign_define(name, { text = sign, texthl = name })
end
