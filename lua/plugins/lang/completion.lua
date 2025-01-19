require "blink.cmp".setup {
    keymap = { preset = "default" },
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono"
    },
    completion = {
        menu = {
            scrollbar = false,
            draw = {
                columns = {
                    { "kind_icon", gap = 1 },
                    { "label",     "label_description", gap = 1 },
                    { "kind",      gap = 1 },
                },
            },
            auto_show = function(ctx)
                return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" },
                    vim.fn.getcmdtype())
            end,
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 50,
            treesitter_highlighting = true,
            window = { scrollbar = false },
        },
    },
    snippets = { preset = "luasnip" },
    sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100,
            },
        },
        cmdline = {},
    },
    signature = {
        enabled = true,
        window = { scrollbar = false },
    },
}
