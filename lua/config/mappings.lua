require("which-key").add({
	-- telescope
	{ "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Telescope find files" },
	{ "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Telescope live grep" },
	{ "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "Telescope buffers" },
	{ "<leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Telescope help tags" },
	{ "<leader>th", "<CMD>Telescope themes<CR>", desc = "Theme switcher" },

	-- formatting
	{
		"<leader>mp",
		function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end,
		desc = "Format current buffer",
	},

	-- oil
	{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },

    -- testing
    { "<space>tl", "<CMD>lua require('neotest').run.run()<CR>", desc = "Run the nearest test" },
    { "<space>tc", "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "Run the current file" },
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
		vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
		vim.keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
		vim.keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts)
		vim.keymap.set("n", "go", "<CMD>lua vim.lsp.buf.type_definition()<CR>", opts)
		vim.keymap.set("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", opts)
		vim.keymap.set("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts)
		vim.keymap.set("n", "rn", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)
		vim.keymap.set("n", "ca", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts)
	end,
})
