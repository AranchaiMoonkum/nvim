return {
    "stevearc/conform.nvim",
    keys = {
        {
            "<leader>fm",
            function()
                require("conform").format()
            end,
            desc = "Format",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
        },
    },
}
