return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = "rafamadriz/friendly-snippets",
		},
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local CompletionItemKind = require("cmp.types").lsp.CompletionItemKind

		require("luasnip.loaders.from_vscode").lazy_load()

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "longest,menuone",
				keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
				keyword_length = 1,
			},
			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = -3,
					side_padding = 0,
				},
				documentation = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),

				["<Tab>"] = function(fallback)
					if not cmp.select_next_item() then
						if vim.bo.buftype ~= "prompt" and has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end
				end,

				["<S-Tab>"] = function(fallback)
					if not cmp.select_prev_item() then
						if vim.bo.buftype ~= "prompt" and has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end
				end,
			}),
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "nvim_lua" },
				{
					name = "nvim_lsp",
					entry_filter = function(entry, context)
						local kind = entry:get_kind()

						local line = context.cursor_line
						local col = context.cursor.col
						local char_before_cursor = string.sub(line, col - 1, col - 1)

						if char_before_cursor == "." then
							return kind ~= CompletionItemKind.Snippet
						end

						return true
					end,
				},
				{ name = "luasnip" },
				{ name = "buffer" },
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    [" .. (strings[2] or "") .. "]"

					return kind
				end,
			},
			preselect = cmp.PreselectMode.None,
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.length,
					function(entry1, entry2)
						local kind_priority = {
							EnumMember = 1,
							Property = 2,
							Field = 3,
							Method = 4,
							Enum = 5,
							Struct = 6,
							Class = 7,
							Interface = 8,
							Constant = 9,
							Variable = 10,
							Keyword = 11,
							Function = 12,
							Module = 13,
							Folder = 14,
							File = 15,
						}

						local kind1_priority = kind_priority[CompletionItemKind[entry1:get_kind()]] or 100
						local kind2_priority = kind_priority[CompletionItemKind[entry2:get_kind()]] or 100

						return kind1_priority < kind2_priority
					end,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.order,
				},
			},
		})
	end,
}
