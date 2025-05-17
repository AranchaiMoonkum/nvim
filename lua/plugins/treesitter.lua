return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local ensure_installed = {
            "angular",
            "html",
            "css",
            "scss",
            "javascript",
            "typescript",
            "tsx",
            "json",
            "dockerfile",
            "python",
            "yaml",
            "toml",
            "lua",
            "luadoc",
            "vim",
            "vimdoc",
        }

        require("nvim-treesitter.configs").setup({
            ensure_installed = ensure_installed,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            sync_install = false,
            auto_install = true,
        })
    end,
}
