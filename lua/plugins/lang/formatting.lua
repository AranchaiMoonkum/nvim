require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        html = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
    },
})
