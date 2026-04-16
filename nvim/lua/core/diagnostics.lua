vim.diagnostic.config({ virtual_text = false })

local signs = {
    DiagnosticSignError = "",
    DiagnosticSignWarn = "",
    DiagnosticSignInfo = "",
    DiagnosticSignHint = "",
}

for name, sign in pairs(signs) do
    vim.fn.sign_define(name, { text = sign, texthl = name })
end
