return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		-- LSP
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Completion
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",

		-- Snippets
		{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
		"rafamadriz/friendly-snippets",

		-- Refactoring
		"nvimtools/none-ls.nvim",

		-- Extras
		"onsails/lspkind.nvim",
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		lsp_zero.preset("recommended")

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		-- LSP
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"angularls",
				"bashls",
				"cssls",
				"cssmodules_ls",
				"dockerls",
				"eslint",
				"html",
				"jsonls",
				"tsserver",
				"marksman",
				"pyright",
				"tailwindcss",
				"vuels",
				"vimls",
				"vuels",
				"jdtls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				lua_ls = function()
					local lua_opts = lsp_zero.nvim_lua_ls()

					require("lspconfig").lua_ls.setup(lua_opts)
				end,
			},
		})

		lsp_zero.set_preferences({
			suggest_lsp_servers = false,
			sign_icons = {
				error = "",
				warn = "",
				hint = "",
				info = "",
			},
		})

		-- Completion
		local cmp = require("cmp")
		local cmp_actoin = lsp_zero.cmp_action()

		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			preselect = true,
			completion = {
				completeopt = "menu,menuone,preview,noinsert",
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				-- Confirm completion item
				["<Enter>"] = cmp.mapping.confirm({ select = true }),

				-- Tab complete
				["<Tab>"] = cmp_actoin.tab_complete(),
				["<S-Tab>"] = cmp_actoin.select_prev_or_fallback(),
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })

					kind.kind = strings[1] .. " "
					kind.menu = "    " .. strings[2]

					return kind
				end,
				format = require("tailwindcss-colorizer-cmp").formatter,
			},
			comfirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			experimental = {
				ghost_text = false,
			},
		})

		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.sql_formatter,
			},

			-- you can reuse a shared lspconfig on_attach callback here
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
