local install_language = {
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

require "nvim-treesitter.configs".setup {
    ensure_installed = install_language,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
    sync_install = false,
    auto_install = true,
}
