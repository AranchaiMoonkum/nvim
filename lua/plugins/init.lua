return {
	-- ux/ui
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"andrew-george/telescope-themes",
		},
		config = function()
			require("plugins.ui.telescope")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			require("plugins.ui.cmp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.3",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.ui.oil")
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require("plugins.ui.colorizer")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
	},

	-- language
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("plugins.lang.lsp")
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.lang.treesitter")
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("plugins.lang.formatting")
		end,
	},

	-- colorscheme
	{
		"ramojus/mellifluous.nvim",
		config = function()
			require("mellifluous").setup({
				transparent_background = { enabled = true },
			})
		end,
	},

	-- ai
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
                suggestion = { auto_trigger = true },
            })
		end,
	},
}
