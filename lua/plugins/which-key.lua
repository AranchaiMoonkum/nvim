return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			icons = {
				breadcrumb = "󰫍 ",
				separator = " ",
				group = "+ ",
			},
			replace = {
				key = {
					{ "<Space>", "SPACE" },
					{ "<leader>", "SPACE" },
					{ "<cr>", "RETURN" },
					{ "<tab>", "TAB" },
                    { "<Esc>", "ESC" },
                    { "<BS>", "BACKSPACE" },
				},
			},
		})
	end,
}
