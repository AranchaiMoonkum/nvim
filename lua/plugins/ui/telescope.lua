local builtin_schemes = require("telescope._extensions.themes").builtin_schemes

require("telescope").setup({
    extensions = {
        themes = {
            enable_previewer = true,
            enable_live_preview = true,
            ignore = vim.list_extend(builtin_schemes, { "embark" }),
            persist = { enabled = true },
        },
        fzf = {},
    },
})

-- load extension
require("telescope").load_extension("themes")
require("telescope").load_extension("fzf")
