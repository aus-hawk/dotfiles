require("lspconfig").ccls.setup {} -- C/C++
require("lspconfig").pyright.setup {} -- Python
require("lspconfig").gopls.setup {} -- Go
require("lspconfig").lua_ls.setup { -- Lua
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

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
