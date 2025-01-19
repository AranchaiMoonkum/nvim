require "rose-pine".setup {
    variant = "main",
    styles = { transparency = true },
    highlight_groups = {
        -- completion
        Pmenu = { fg = "text", bg = "none" },
        PmenuSel = { fg = "none", bg = "highlight_low" },

        -- statuline
        StatusLine = { fg = "subtle", bg = "surface" },
        StatusLineNC = { fg = "subtle", bg = "surface" },

        -- telescope
        TelescopeBorder = { fg = "highlight_high", bg = "none" },
        TelescopeNormal = { bg = "none" },
        TelescopePromptNormal = { bg = "none" },
        TelescopeResultsNormal = { fg = "subtle", bg = "none" },
        TelescopeSelection = { fg = "text", bg = "none" },
        TelescopeSelectionCaret = { fg = "rose", bg = "rose" },

        -- search
        CurSearch = { fg = "base", bg = "leaf", inherit = false },
        Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
    },
}

vim.cmd.colorscheme "rose-pine"
