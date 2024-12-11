local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

local luasnip = require("luasnip")
local mapping = {
	["<C-y>"] = cmp.mapping.confirm({ select = true }),

	-- jump to the next snippet placeholder
	["<C-j>"] = cmp.mapping(function(fallback)
		if luasnip.locally_jumpable(1) then
			luasnip.jump(1)
		else
			fallback()
		end
	end, { "i", "s" }),

	-- jump to the prev snippet placeholder
	["<C-k>"] = cmp.mapping(function(fallback)
		if luasnip.locally_jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
}

cmp.setup({
	completion = { completeopt = "menu,menuone,noinsert" },
	window = {
		documentation = {
			border = "rounded",
			winhighlight = "NormalFloat:NormalFloat,FloatBorder:NormalFloat",
		},
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	},
	mapping = cmp.mapping.preset.insert(mapping),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		fields = { "abbr", "menu", "kind" },
		format = function(entry, vim_item)
			-- source
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
})
