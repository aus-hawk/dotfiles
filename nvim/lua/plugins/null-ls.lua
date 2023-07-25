local null_ls = require "null-ls"
null_ls.setup {
    sources = {
        -- Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.mypy.with {
            extra_args = function(params)
                local venv_locations = { "venv", ".venv" }
                for _, venv in pairs(venv_locations) do
                    venv = venv .. "/bin/python"
                    if vim.fn.empty(vim.fn.glob(venv)) == 0 then
                        return { "--python-executable", venv }
                    end
                end
                -- no virtual environment
                return {}
            end,
        },

        -- Lua
        null_ls.builtins.formatting.stylua,

        -- HTML/CSS/JS/YAML
        null_ls.builtins.formatting.prettier.with {
            disabled_filetypes = { "jinja" },
        },

        -- Jinja/Django
        null_ls.builtins.formatting.djlint,
        null_ls.builtins.diagnostics.djlint,

        -- Go
        null_ls.builtins.formatting.gofmt,
    },
    diagnostics_format = "#{m} (#{s})",
}

require("mason-null-ls").setup {
    automatic_installation = true,
}
