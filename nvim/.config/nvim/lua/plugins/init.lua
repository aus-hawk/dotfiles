local fn = vim.fn

local data_dir = fn.stdpath "data"
local packer_loc = data_dir .. "/site/pack/packer/start/packer.nvim"
local fresh_install = fn.empty(fn.glob(packer_loc)) ~= 0
if fresh_install then
    -- packer.nvim is not installed.
    local packer_git = "https://github.com/wbthomason/packer.nvim"
    fn.system { "git", "clone", "--depth", "1", packer_git, packer_loc }
    vim.cmd "packadd packer.nvim"
end

local packer = require "packer"

packer.startup(function(use)
    -- packer.nvim can manage itself
    use "wbthomason/packer.nvim"

    -- colorscheme
    use "arcticicestudio/nord-vim"

    -- statusline
    use {
        "nvim-lualine/lualine.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- File explorer
    use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- Completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            -- Snippets
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
    }

    -- LSP and linting
    use {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    }

    -- Formatting
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    -- Indent guides
    use "lukas-reineke/indent-blankline.nvim"

    -- Automatic pair character insertion
    use "jiangmiao/auto-pairs"
end)

if fresh_install then
    packer.sync()
end
