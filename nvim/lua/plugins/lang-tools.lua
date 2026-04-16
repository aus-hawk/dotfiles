-- managing and using static code analysis (lsp, lint, format, etc.)
return {
    -- package manager
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    -- lsp
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- :h lspconfig-all
            local server_configs = {
                -- C/C++
                clangd = {},

                -- Python
                pyright = {},

                -- Go
                gopls = {},

                -- Rust
                rust_analyzer = {},

                -- TS/JS
                ts_ls = {},

                -- Lua
                stylua = {},
                lua_ls = {
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
                },
            }

            for server, config in pairs(server_configs) do
                vim.lsp.enable(server)
                vim.lsp.config(server, config)
            end
        end,
    },

    -- linting
    {
        "mfussenegger/nvim-lint",
        config = function()
            -- see the github
            require("lint").linters_by_ft = {
                python = { "flake8", "mypy" }
            }
        end,
    },

    -- formatting
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "isort", "black" },
                go = { "gofmt" },
                javascript = { "prettier" },
            },
        },
    },
}
