return {
    -- ux/ui
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "andrew-george/telescope-themes",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        config = function()
            require("plugins.ui.telescope")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            {
                "L3MON4D3/LuaSnip",
                version = "v2.3",
                build = "make install_jsregexp",
                dependencies = { "rafamadriz/friendly-snippets" },
            },
        },
        config = function()
            require("plugins.ui.cmp")
        end,
    },
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.ui.oil")
        end,
    },
    {
        "NvChad/nvim-colorizer.lua",
        event = "BufReadPre",
        config = function()
            require("plugins.ui.colorizer")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "sindrets/diffview.nvim",
    },

    -- language
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("plugins.lang.lsp")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("plugins.lang.treesitter")
        end,
    },

    -- colorscheme
    {
        "ramojus/mellifluous.nvim",
        config = function()
            require("plugins.colorschemes.mellifluous")
        end,
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            require("plugins.colorschemes.tokyonight")
        end,
    },
    {
        "kvrohit/substrata.nvim",
        config = function()
            vim.g.substrata_transparent = true
            vim.g.substrata_variant = "brighter"
        end,
    },

    -- ai
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({ suggestion = { auto_trigger = true } })
        end,
    },
}
