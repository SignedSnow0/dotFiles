vim.pack.add({
	{ src = "https://github.com/vague-theme/vague.nvim" },

	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },

	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

	{ src = "https://github.com/stevearc/conform.nvim" },

	{ src = "https://github.com/folke/which-key.nvim" },

	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },

	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-buffer" },
	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/onsails/lspkind.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },

	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/antosha417/nvim-lsp-file-operations" },
	{ src = "https://github.com/folke/neodev.nvim" },

	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

	{ src = "https://github.com/stevearc/dressing.nvim" },

	--{ src = "https://github.com/" },
})

require("signedsnow0.plugins.colorscheme")
require("signedsnow0.plugins.telescope")
require("signedsnow0.plugins.nvim-tree")
require("signedsnow0.plugins.formatter")
require("signedsnow0.plugins.which-key")
require("signedsnow0.plugins.treesitter")
require("signedsnow0.plugins.mason")
require("signedsnow0.plugins.lsp")
require("signedsnow0.plugins.cmp")
require("signedsnow0.plugins.lualine")
require("signedsnow0.plugins.bufferline")
