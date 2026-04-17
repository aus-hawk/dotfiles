return {
    -- colorscheme
    {
        "arcticicestudio/nord-vim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme nord")
        end,
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                component_separators = { left = "", right = " " },
                section_separators = "",
            },
            sections = {
                lualine_c = {
                    { "filename", path = 1 },
                },
            },
        },
    },

    -- file explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        config = function()
            -- disable netrw, see :h nvim-tree-netrw
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup({
                renderer = {
                    indent_markers = {
                        enable = true,
                    },
                },
            })
        end,
    },

    -- LSP capabilities for tree, must be after nvim-tree/nvim-tree.lua
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-tree.lua",
        },
        opts = {},
    },

    -- git changes in buffer
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },

    -- indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    -- thin ruler for colorcolumn
    {
        "lukas-reineke/virt-column.nvim",
        opts = {
            char = "▏",
        },
    },
}
