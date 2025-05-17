return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		local severity_icons = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		}

		vim.diagnostic.config({
			signs = {
				text = severity_icons,
				linehl = {
					error = "DiagnosticSignError",
					warn = "DiagnosticSignWarn",
					info = "DiagnosticSignInfo",
					hint = "DiagnosticSignHint",
				},
				numhl = {
					error = "DiagnosticSignError",
					warn = "DiagnosticSignWarn",
					info = "DiagnosticSignInfo",
					hint = "DiagnosticSignHint",
				},
			},
			virtual_text = {
				source = false,
				prefix = "",
				format = function(diagnostic)
					local icon = severity_icons[diagnostic.severity] or ""
					return string.format("%s %s: %s", icon, diagnostic.source or "", diagnostic.message)
				end,
			},
			float = {
				source = false,
				border = "single",
				header = false,
				format = function(diagnostic)
					return string.format("%s: %s ", diagnostic.source or "", diagnostic.message)
				end,
			},
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

		require("lspconfig.ui.windows").default_options = { border = "single" }

		vim.keymap.set("n", "K", function()
			local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })

			if #diagnostics > 0 then
				vim.diagnostic.open_float()
			else
				vim.lsp.buf.hover()
			end
		end)

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "Goto Definition" })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf, desc = "Goto Declaration" })
			end,
		})

		mason.setup({
			ui = {
				width = 0.8,
				height = 0.8,
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"angularls",
				"lua_ls",
				"html",
				"cssls",
				"ts_ls",
				"jsonls",
			},
			automatic_enable = false,
		})
	end,
}
