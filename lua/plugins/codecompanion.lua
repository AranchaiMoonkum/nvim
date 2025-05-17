return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<leader>aa",
            "<cmd>CodeCompanionChat<cr>",
			desc = "CodeCompanion Chat",
            mode = { "n", "v" },
		},
	},
	opts = {
		chat = {
			adapter = "copilot",
		},
		inline = {
			adapter = "copilot",
		},
	},
}
