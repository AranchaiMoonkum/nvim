return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({
					hidden = true,
					no_ignore = true,
				})
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep({
					prompt_prefix = "     ",
				})
			end,
			desc = "Live Grep",
		},
	},
	config = function()
		local TS = require("telescope")

		local defaults = {
			multi_icon = "",
			entry_prefix = "   ",
			prompt_prefix = "   ",
			selection_caret = "  ",
		}

		local pickers = {
			colorscheme = {
				enable_preview = true,
			},
		}

		local extensions = {
			fzf = {
				fuzzy = true,
				case_mode = "smart_case",
			},
		}

		TS.setup({
			defaults = defaults,
			pickers = pickers,
			extensions = extensions,
		})
	end,
}
