return {
	"rachartier/tiny-code-action.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	event = "LspAttach",
    keys = {
        {
            "<C-.>",
            function()
                require("tiny-code-action").code_action()
            end,
            desc = "Code actions",
        },
    },
	opts = {
        backend = "vim",
		picker = {
			"telescope",
			opts = {
				layout_strategy = "vertical",
				layout_config = {
					height = 0.8,
					width = 0.5,
					preview_height = 0.5,
				},
			},
		},
	},
}
