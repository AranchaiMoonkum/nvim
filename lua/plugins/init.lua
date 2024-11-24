return {
	-- ux/ui
	{
		"numToStr/Comment.nvim",
		config = true,
	},
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
			-- sources
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",

			-- snippet
			{ "L3MON4D3/LuaSnip", version = "v2.3", build = "make install_jsregexp" },

			-- others
			"onsails/lspkind.nvim",
		},
		config = function()
			require("plugins.ui.cmp")
		end,
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("plugins.ui.oil") end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns")
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
		"kvrohit/substrata.nvim",
	},
	{
		"rose-pine/neovim",
	},
	{
		"FrenzyExists/aquarium-vim",
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"deparr/tairiki.nvim",
	},
	{
		"vague2k/vague.nvim",
	},

	-- game
	"ThePrimeagen/vim-be-good",
}
