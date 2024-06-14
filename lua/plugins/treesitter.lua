return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"luadoc",
				"vim",
				"vimdoc",
				"angular",
				"astro",
				"bash",
				"dockerfile",
				"fish",
				"html",
				"javascript",
				"json",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"scss",
				"svelte",
				"toml",
				"tsx",
				"typescript",
				"vue",
				"xml",
				"yaml",
			},
			sync_install = false,
			auto_install = true,
			autopairs = {
				enable = true,
			},
			rainbow = {
				enable = false,
				extended_mode = false,
				max_file_lines = nil,
			},
			highlight = {
				enable = true,
				disable = {},
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true, disable = { "yaml" } },
			autotag = {
				enable = true,
			},
		})
	end,
}
