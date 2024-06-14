local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Exit from insert mode
keymap("i", "jk", "<ESC>", opts)

-- Open new tabline
keymap("n", "te", ":tabe ", { noremap = true, silent = false })

-- Go next tabline
keymap("n", "tn", ":tabnext<CR>", opts)

-- Go prev tabline
keymap("n", "tp", ":tabprev<CR>", opts)

-- Toggle NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
