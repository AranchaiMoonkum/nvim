return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local B = require("blink.cmp")
        local LC = require("lspconfig")
        local ML = require("mason-lspconfig")

        local capabilities = B.get_lsp_capabilities()

        require("mason").setup()

        ML.setup({
            ensure_installed = {
                -- lua
                "lua_ls",

                -- css
                "cssls",
                "cssmodules_ls",
                "tailwindcss",

                -- html
                "html",

                -- javascript
                "ts_ls",

                -- json
                "jsonls",
            },
        })

        ML.setup_handlers {
            function(server_name) -- default handler (optional)
                LC[server_name].setup { capabilities = capabilities }
            end,

            ["lua_ls"] = function()
                LC.lua_ls.setup {
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            }
                        }
                    }
                }
            end,
        }
    end,
}
