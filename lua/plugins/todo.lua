return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local wk = require("which-key")

		require("todo-comments").setup({
			signs = false,
			keywords = {
				FIX = { icon = "" },
				HACK = { icon = "󱠇" },
				TODO = { icon = "" },
				WARN = { icon = "" },
				PERF = { icon = "󱑂" },
				NOTE = { icon = "" },
				TEST = { icon = "󰙨" },
			},
			gui_style = {
				fg = "BOLD",
			},
			highlight = {
				keyword = "fg",
				after = "",
				pattern = {
					[[.*<(KEYWORDS)\s*:]], -- default
					[[.*<(KEYWORDS)\(\S*\):]],
				},
			},
			search = {
				pattern = [[\b(KEYWORDS): | \b(KEYWORDS)\(\S*\):]],
			},
		})

		wk.add({
			{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
		})
	end,
}
