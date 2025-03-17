return {
    "saghen/blink.cmp",
    version = "*",
    dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    config = function()
        local CMP = require("blink.cmp")

        local appearance = {
            nerd_font_variant = "mono",
            kind_icons = {
                Text = " ",
                Method = " ",
                Function = "󰊕 ",
                Constructor = " ",
                Field = " ",
                Variable = " ",
                Class = "󰠱 ",
                Interface = " ",
                Module = "󰏓 ",
                Property = " ",
                Unit = " ",
                Value = " ",
                Enum = " ",
                EnumMember = " ",
                Keyword = "󰌋 ",
                Snippet = "󰲋 ",
                Color = " ",
                File = " ",
                Reference = " ",
                Folder = " ",
                Constant = "󰏿 ",
                Struct = "󰠱 ",
                Event = " ",
                Operator = " ",
                TypeParameter = "󰘦 ",
                TabNine = "󰚩 ",
                Copilot = " ",
                Unknown = " ",
                Recording = " ",
                None = "  ",
            },
        }

        local completion = {
            menu = {
                scrollbar = false,
                auto_show = true,
                draw = {
                    components = {
                        kind_icon = { ellipsis = false },
                    },
                },
            },
            documentation = {
                window = { scrollbar = false },
                auto_show = true,
                auto_show_delay_ms = 300
            },
        }

        CMP.setup({
            keymap = { preset = "default" },
            appearance = appearance,
            completion = completion,
            sources = {
                default = { "lsp", "path", "snippets", "buffer" }
            },
            cmdline = { enabled = false },
            fuzzy = { implementation = "prefer_rust" },
            snippets = { preset = "luasnip"},
        })
    end,
}
