-- global mappings
vim.keymap.set("n", "yc", "yy<CMD>normal gcc<CR>p")

-- telescope
vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { silent = true})
vim.keymap.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", { silent = true })
vim.keymap.set("n", "<leader>th", "<CMD>Telescope themes<CR>", { silent = true })

-- formatting
vim.keymap.set("n", "<leader>mp", function()
    require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
end)

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { silent = true })

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
