return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"RRethy/vim-illuminate",
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = true,
	},
	{
		"j-hui/fidget.nvim",
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		config = true,
	},
	-- {
	-- 	"mkitt/tabline.vim",
	-- },
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for v0.4.0+
			"nvim-tree/nvim-web-devicons", -- If you want devicons
			"stevearc/resession.nvim", -- Optional, for persistent history
		},
		config = function()
			require("cokeline").setup()
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			local leap = require("leap")

			leap.setup({})
			leap.set_default_keymaps(true)
		end,
	},
}
