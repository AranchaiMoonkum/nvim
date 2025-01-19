local opts = { silent = true, noremap = true }

-- pressing "jk" in insert mode to escape quickly
vim.keymap.set("i", "jk", "<ESC>", opts)

-- telescope
vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>", opts)
vim.keymap.set("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", opts)

-- lsp rename
vim.keymap.set("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", opts)
