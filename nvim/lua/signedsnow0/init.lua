require("signedsnow0.core.options")
require("signedsnow0.core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { -- emacs style which-key 
        "folke/which-key.nvim",
    },
    { -- color theme
        "catppuccin/nvim",
        name = "catppuccin",
        dependencies = {
            "freddiehaddad/feline.nvim",
            "lewis6991/gitsigns.nvim"
        },
        priority = 1000,
        config = function()
            require "signedsnow0.plugins.catppuccin"
        end
    },
    { -- file explorer
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require "signedsnow0.plugins.nvim-tree"
        end
    },
    { -- code parser to abstract syntax tree
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require "signedsnow0.plugins.treesitter"
        end
    },
    { -- file finder
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
        },
        config = function()
            require "signedsnow0.plugins.telescope"require('feline').winbar.setup()
        end
    },
    { -- tmux integration
        "alexghergh/nvim-tmux-navigation",
        config = function()
            require "signedsnow0.plugins.nvim-tmux-navigation"
        end
    },
    { -- lsp server manager
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end
    },
    { -- mason interface
        "williamboman/mason-lspconfig.nvim",
         dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require "signedsnow0.plugins.mason-lspconfig"
        end
    },
    { -- lsp completion
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "onsails/lspkind.nvim"
        },
        config = function()
            require "signedsnow0.plugins.cmp"
        end
    },
    { -- inline errors and warnings
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },
    { -- bracket autopairs
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    { -- inline code actions
        "kosayoda/nvim-lightbulb",
        config = function()
            require "nvim-lightbulb".setup({
                autocmd = {
                    enabled = true
                }
            })
        end
    },
    { -- lsp funciont signature
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
            require'lsp_signature'.setup(opts)
        end
    },
    { -- rust 
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
            "williamboman/mason-lspconfig"
        },
        config = function()
            require "signedsnow0.plugins.rust-tools"
        end
    },
    { -- rust crates
        "saecki/crates.nvim",
        ft = {
            "rust",
            "toml",
        },
        config = function (_, opts)
            local crates = require("crates")
            crates.setup(opts)
            crates.show()
        end
    },
    { -- dap ui
        "mfussenegger/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
    { -- copilot
        "github/copilot.vim"
    },
})
