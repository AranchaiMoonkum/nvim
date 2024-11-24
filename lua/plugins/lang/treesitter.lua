local install_language = {
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "json",
    "dockerfile",
    "python",
    "java",
    "yaml",
    "toml",
    "lua",
    "luadoc",
    "vim",
    "vimdoc",
}

require("nvim-treesitter.configs").setup({
    ensure_installed = install_language,
    sync_install = false,
    auto_install = true,
})
