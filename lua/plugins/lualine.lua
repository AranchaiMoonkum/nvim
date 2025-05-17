return {
	"nvim-lualine/lualine.nvim",
	lazy = true,
	event = "VeryLazy",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local lualine = require("lualine")
		local colors = require("catppuccin.palettes").get_palette()

        -- Custom Theme For Lualine
		local custom_theme = {
			normal = {
				a = { fg = colors.mantle, bg = colors.blue, gui = "bold" }, -- ViMode (Normal)
				b = { fg = colors.subtext1, bg = colors.crust }, -- FileNameBlock
				c = { fg = colors.overlay0, bg = colors.crust }, -- FileType, FileSize (base)
			},
			insert = {
				a = { fg = colors.mantle, bg = colors.green, gui = "bold" }, -- ViMode (Insert)
			},
			visual = {
				a = { fg = colors.mantle, bg = colors.mauve, gui = "bold" }, -- ViMode (Visual)
			},
			replace = {
				a = { fg = colors.mantle, bg = colors.flamingo, gui = "bold" }, -- ViMode (Replace)
			},
			command = {
				a = { fg = colors.mantle, bg = colors.peach, gui = "bold" }, -- ViMode (Command)
			},
			inactive = { -- For inactive windows
				a = { fg = colors.overlay0, bg = colors.base, gui = "bold" },
				b = { fg = colors.overlay0, bg = colors.base },
				c = { fg = colors.overlay0, bg = colors.base },
			},
		}

		-- Conditions And Helper Functions
		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function(size)
				return vim.api.nvim_get_option_value("columns", { scope = "local" }) > (size or 140)
			end,
		}

		-- Git Status Setup
		local function is_git_repo()
			if vim.b.gitsigns_status_dict and vim.b.gitsigns_status_dict.head then
				return true
			end

			local CWD = vim.fn.getcwd()
			local git_dir = vim.fn.finddir(".git", CWD .. ";")
			return git_dir ~= "" and vim.fn.isdirectory(git_dir) == 1
		end

		-- Mode Setup
		local mode_color = {
			n = colors.blue,
			i = colors.green,
			v = colors.mauve,
			V = colors.lavender,
			[""] = colors.yellow,
			c = colors.peach,
			s = colors.teal,
			R = colors.flamingo,
			t = colors.red,
		}

		-- File Name Setup
		local function file_name_provider()
			local filename = vim.fn.fnamemodify(vim.fn.expand("%:t"), ":t")

			if filename == "" then
				return "[No Name]"
			end

			if not conditions.buffer_not_empty() then
				filename = vim.fn.pathshorten(filename)
			end

			return filename
		end

		-- File Flags Setup
		local function file_flags_provider()
			if vim.bo.modified then
				return "●"
			elseif not vim.bo.modifiable or vim.bo.readonly then
				return ""
			else
				return ""
			end
		end

		-- Filetype Setup
		local function filetype_provider()
			return (" %s "):format(vim.bo.filetype)
		end

		-- Indent Sizes Setup
		local function indent_sizes_provider()
			local indent_type = vim.api.nvim_get_option_value("expandtab", { scope = "local" }) and "Spaces"
				or "Tab Size"
			local indent_size = vim.api.nvim_get_option_value("tabstop", { scope = "local" })

			return (" %s: %s "):format(indent_type, indent_size)
		end

        -- LSP Status Setup
		local function lsp_attached()
			local clients = vim.lsp.get_active_clients({ bufnr = 0 })
			return #clients > 0
		end

		local function lsp_active_provider()
			if not lsp_attached() then
				return ""
			end
			local names = {}
			for _, server in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
				table.insert(names, server.name)
			end
			if #names == 0 then
				return ""
			end
			return " " .. table.concat(names, ", ") -- Using comma for multiple LSPs
		end

        -- Formatters Setup
		local function formatters_provider()
			local conform_ok, conform = pcall(require, "conform")
			if not conform_ok or not conform.list_formatters then
				return ""
			end

			local available_formatters_info = conform.list_formatters(0) -- Pass bufnr 0 for current buffer
			local names = {}
			for _, formatter_info in ipairs(available_formatters_info) do
				table.insert(names, formatter_info.name)
			end

			if #names == 0 then
				return ""
			end
			return " " .. table.concat(names, ", ")
		end

		lualine.setup({
			options = {
				theme = custom_theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icon = "▌",
						fmt = function(str)
							return str:sub(1, 1):upper() .. str:sub(2):lower()
						end,
						color = function()
							local mode = vim.fn.mode()
							return {
								fg = mode_color[mode:sub(1, 1)] or colors.text,
								bg = colors.mantle,
								gui = "bold",
							}
						end,
						separator = { right = "" },
						padding = { left = 0, right = 1 },
					},
				},
				lualine_b = {
					{
						"filetype",
						colored = true,
						icon_only = true,
						cond = conditions.buffer_not_empty,
						color = { bg = colors.crust, fg = colors.overlay0 },
						padding = { left = 1, right = 0 },
					},
					{
						file_name_provider,
						cond = conditions.buffer_not_empty,
						color = { fg = colors.subtext1, gui = "bold" },
					},
					{
						file_flags_provider,
						cond = conditions.buffer_not_empty,
						color = function()
							if vim.bo.modified then
								return { fg = colors.lavender, gui = "bold" }
							elseif not vim.bo.modifiable or vim.bo.readonly then
								return { fg = colors.red, gui = "bold" }
							else
								return { fg = colors.mantle, gui = "bold" }
							end
						end,
					},
				},
				lualine_c = {
					{
						filetype_provider,
						colored = true,
						icon_only = false,
						padding = { left = 0, right = 0 },
						cond = function()
							return conditions.buffer_not_empty() and conditions.hide_in_width(80)
						end,
					},
					{
						"filesize",
						cond = conditions.buffer_not_empty,
						color = { bg = colors.crust, fg = colors.overlay0 },
					},
				},
				lualine_x = {
					{
						lsp_active_provider,
						padding = { left = 1, right = 1 },
						cond = function()
							return conditions.hide_in_width(120) and lsp_attached()
						end,
						on_click = function()
							vim.cmd("LspInfo")
						end,
						color = { bg = colors.crust, fg = colors.subtext1, gui = "bold" },
					},
					{
						formatters_provider,
						padding = { left = 1, right = 1 },
						cond = function()
							return conditions.buffer_not_empty() and conditions.hide_in_width(80)
						end,
						color = { fg = colors.overlay0, bg = colors.crust },
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info", "hint" },
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},
						diagnostics_color = {
							error = { fg = colors.red },
							warn = { fg = colors.yellow },
							info = { fg = colors.sapphire },
							hint = { fg = colors.sky },
						},
						colored = true,
						update_in_insert = false,
					},
				},
				lualine_y = {
					{
						"fileformat",
						cond = conditions.buffer_not_empty,
						symbols = {
							unix = "LF",
							dos = "CRLF",
							mac = "CR",
						},
						color = { bg = colors.crust, fg = colors.overlay0 },
					},
					{
						"encoding",
						cond = conditions.buffer_not_empty,
						color = { bg = colors.crust, fg = colors.overlay0 },
					},
					{
						indent_sizes_provider,
						padding = { left = 1, right = 1 },
						cond = function()
							return conditions.buffer_not_empty()
						end,
						color = { fg = colors.overlay0, bg = colors.crust },
					},
				},
				lualine_z = {
					{
						"branch",
						icon = " ", -- Git icon with space
						cond = is_git_repo,
						separator = { left = "" },
						color = { bg = colors.mantle, fg = colors.mauve },
					},
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						diff_color = {
							added = { fg = colors.green },
							modified = { fg = colors.peach },
							removed = { fg = colors.red },
						},
						padding = { left = 1, right = 1 },
						cond = function()
							return is_git_repo() and conditions.buffer_not_empty() and conditions.hide_in_width(80)
						end,
						color = { bg = colors.mantle },
					},
				},
			},
		})
	end,
}
