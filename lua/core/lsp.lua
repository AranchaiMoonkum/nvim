local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
    capabilities = capabilities,
})

vim.lsp.enable({
    "luals",
    "angularls",
    "html",
    "cssls",
    "ts_ls",
    "jsonls",
    "pylsp",
})
