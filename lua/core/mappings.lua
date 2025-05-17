local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("i", "jk", "<esc>", opts) -- exit insert mode
keymap("v", "J", ":m '>+1<cr>gv=gv", opts) -- move code up
keymap("v", "K", ":m '<-2<cr>gv=gv", opts) -- move code down
keymap("x", "<leader>p", '"_dP', { noremap = true, silent = true, desc = "Paste Without Deleting Previous Buffer" }) -- paste without deleting previous buffer
keymap("n", "yc", "yygccp", { remap = true }) -- mini version control
keymap("v", "<leader>C", "ygvgc`>p", { remap = true, desc = "Mini Version Control" }) -- mini version control but in visual mode
keymap({ "n", "v" }, "<leader>l", function()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end) -- toggle relative number and absolute number
