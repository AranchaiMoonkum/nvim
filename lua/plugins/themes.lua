return {
    -- carbide theme
    {
        "ferdinandrau/carbide.nvim",
        lazy = true,
        priority = 1000,
        opts = {
            style = {
                transparent = true,
            },
        },
        config = function(_, opts)
            require("carbide").setup(opts)
            require("carbide").apply()
        end,
    },

    -- cold theme
    {
        "gmr458/cold.nvim",
        lazy = true,
        priority = 1000,
        config = function() require("cold").load() end,
    },

    -- vague theme
    {
        "vague2k/vague.nvim",
        lazy = false,
        priority = 1000,
        opts = { transparent = false },
        config = function(_, opts)
            require("vague").setup(opts)
            vim.cmd.colorscheme("vague")
        end,
    },

    -- base 16 theme
    {
        "RRethy/base16-nvim",
        lazy = true,
        priority = 1000,
        opts = {
            base00 = "#000000", -- Background
            base01 = "#1c1c1c", -- Lighter Background (Status bars, line numbers, etc.)
            base02 = "#3c3c3c", -- Selection Background
            base03 = "#606060", -- Comments, Invisibles, Line Highlighting
            base04 = "#808080", -- Dark Foreground (Used for status bars)
            base05 = "#e0e0e0", -- Default Foreground, Caret, Delimiters, Operators
            base06 = "#e0e0e0", -- Light Foreground (Not often used)
            base07 = "#ffffff", -- Lightest Foreground (Unused)
            base08 = "#fd5ff1", -- Keywords, Variables, XML Tags
            base09 = "#fd5ff1", -- Integers, Boolean, Constants
            base0A = "#ffd7b1", -- Classes, Markup Bold, Search Text Background
            base0B = "#87c38a", -- Strings, Inherited Class, Markup Code
            base0C = "#85befd", -- Support, Regular Expressions, Escape Characters
            base0D = "#85befd", -- Functions, Methods, Attribute IDs
            base0E = "#b9b6fc", -- Keywords, Storage, Selector
            base0F = "#e0e0e0" -- Deprecated, Embedded Language Tags
        },
        config = function(_, opts)
            local B16 = require("base16-colorscheme")
            B16.with_config({
                telescope = false,
            })
            B16.setup(opts)
        end,
    },
}
