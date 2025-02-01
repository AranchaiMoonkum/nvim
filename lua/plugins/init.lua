return {
    -- ux/ui
    { "nvim-tree/nvim-web-devicons" },
    {
        "NvChad/nvim-colorizer.lua",
        event = { "VeryLazy" },
        config = function() require "plugins.ui.colorizer" end,
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
            },
        },
        config = function() require "plugins.ui.telescope" end,
    },
    { "stevearc/dressing.nvim" },
    {
        "stevearc/oil.nvim",
        event = "VeryLazy",
        config = function() require "plugins.ui.oil" end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function() require "plugins.ui.noice" end,
    },
    {
        "echasnovski/mini.statusline",
        version = false,
        config = function() require "plugins.ui.statusline" end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function() require "gitsigns".setup {} end,
    },
    {
        "folke/snacks.nvim",
        config = function() require "plugins.ui.indent" end,
    },
    {
        "sindrets/diffview.nvim",
        event = "BufRead",
    },

    -- language
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
            "j-hui/fidget.nvim"
        },
        config = function() require "plugins.lang.lsp" end,
    },
    { "mfussenegger/nvim-jdtls" },
    {
        "saghen/blink.cmp",
        dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
        version = "*",
        config = function() require "plugins.lang.completion" end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function() require "plugins.lang.treesitter" end,
    },

    -- themes
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = true,
        priority = 1000,
        config = function() require "plugins.themes.rose-pine" end,
    },
    {
        "aktersnurra/no-clown-fiesta.nvim",
        lazy = true,
        priority = 1000,
        config = function() require "plugins.themes.no-clown-fiesta" end,
    },
    {
        "sainnhe/gruvbox-material",
        lazy = true,
        priority = 1000,
        config = function() require "plugins.themes.gruvbox-material" end,
    },
    {
        "ferdinandrau/carbide.nvim",
        lazy = false,
        priority = 1000,
        config = function() require "plugins.themes.carbide" end,
    },

    -- ai
    { "github/copilot.vim" },

    -- others
    { "christoomey/vim-tmux-navigator" },
}
