return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        opts = {
            variant = "main",
            dark_variant = "main",
            styles = { transparency = false },
            highlight_groups = {
                -- transparent telescope
                TelescopeBorder = { fg = "highlight_high", bg = "none" },
                TelescopeNormal = { bg = "none" },
                TelescopePromptNormal = { bg = "base" },
                TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                TelescopeSelection = { fg = "text", bg = "base" },
                TelescopeSelectionCaret = { fg = "rose", bg = "rose" },

                -- leaf search
                CurSearch = { fg = "base", bg = "leaf", inherit = false },
                Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },

                -- lovely statusline
                StatusLine = { fg = "love", bg = "love", blend = 10 },
                StatusLineNc = { fg = "subtle", bg = "surface" },
            },
        },
        config = function(_, opts)
            require("rose-pine").setup(opts)
            vim.cmd("colorscheme rose-pine-main")
        end,
    },
}
