local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- highlight on yank
autocmd("TextYankPost", {
	group = autogroup("YankHighlight", { clear = true }),
	command = "silent! lua vim.highlight.on_yank()",
})
