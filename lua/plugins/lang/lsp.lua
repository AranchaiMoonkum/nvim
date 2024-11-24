local lspconfig_defaults = require("lspconfig").util.default_config

lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lspconfig_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

local install_language = {
    "lua_ls",
    "html",
    "cssls",
    "ts_ls",
    "jsonls",
    "dockerls",
    "yamlls",
    "pyright",
}

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = install_language,
    handlers = {
        function(server_name) require "lspconfig"[server_name].setup({}) end,

        lua_ls = function()
            require("lspconfig").lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } }
                    }
                }
            })
        end,
    },
})

local tool_installer = {
    "prettierd",
    "eslint_d",
    "stylua",
    "isort",
    "black"
}

require "mason-tool-installer".setup({
    ensure_installed = tool_installer,
    auto_update = true,
})

-- diagnostics
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "⚑",
            [vim.diagnostic.severity.INFO] = "»",
        },
    },
})
