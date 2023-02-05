local null_ls = require "null-ls"
null_ls.setup {
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.mypy.with {
            extra_args = function(params)
                local venv_locations = { "venv", ".venv" }
                for _, venv in pairs(venv_locations) do
                    venv = venv .. "bin/python"
                    if vim.fn.empty(vim.fn.glob(venv)) ~= 0 then
                        return { "--python-executable", venv }
                    end
                end
                -- no virtual environment
                return {}
            end,
        },
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
    },
    diagnostics_format = "#{m} (#{s})",
}
