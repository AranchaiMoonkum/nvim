local KM = vim.keymap.set -- keymap
local DS = { noremap = true, silent = true } -- default settings
local AR = { noremap = false, silent = true } -- allow remapping

-- NATIVE --
KM("i", "jk", "<esc>", DS) -- exit insert mode
KM("v", "J", ":m '>+1<cr>gv=gv", DS) -- move code up
KM("v", "K", ":m '<-2<cr>gv=gv", DS) -- move code down
KM("x", "<leader>p", "\"_dP", DS) -- paste without delete previous buffer
KM("n", "<C-c>", "ciw", DS) -- change whole word
KM("n", "yc", "yygccp", AR) -- mini version control

-- TELESCOPE --
KM("n", "<leader>ff", function() require("telescope.builtin").find_files({}) end) -- open find files
KM("n", "<leader>fp", function() require("telescope.builtin").colorscheme({}) end)

-- TODO --
KM("n", "<leader>ft", "<Cmd>TodoTelescope previewer=false wrap_results=false<Cr>", DS) -- open todo telescope

-- LSP --
KM("n", "<leader>fd", function() vim.lsp.buf.format() end, DS) -- formatting
KM("n", "<leader>rn", function() vim.lsp.buf.rename() end, DS) -- rename

-- UNDOTREE --
KM("n", "<leader>ut", vim.cmd.UndotreeToggle, DS) -- toggling undo tree

-- NVIM TREE --
KM("n", "<leader>e", vim.cmd.NvimTreeToggle, DS) -- toggling neovim tree
