return {
	{
		"akinsho/bufferline.nvim", -- https://github.com/akinsho/bufferline.nvim
		opts = {
			options = {
				numbers = "ordinal",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left"
					}
				},
				show_buffer_icons = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_tab_indicators = true,
				persist_buffer_sort = false,
				separator_style = "thin",
				enforce_regular_tabs = true,
				always_show_bufferline = true,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, _, _)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end
			}
		}
	}, {
	"hoob3rt/lualine.nvim", -- https://github.com/nvim-lualine/lualine.nvim
	dependencies = "kyazdani42/nvim-web-devicons",
	config = function()
		local lualine = require("lualine")
		-- Color table for highlights
		local colors = {
			bg = "#2c3043",
			fg = "#c3ccdc",
			yellow = "#ECBE7B",
			cyan = "#008080",
			darkblue = "#081633",
			green = "#98be65",
			orange = "#FF8800",
			violet = "#a9a1e1",
			magenta = "#c678dd",
			blue = "#51afef",
			red = "#ec5f67"
		}

		local conditions = {
			hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end
		}

		local config = {
			options = {
				disabled_filetypes = { "NvimTree" },
				component_separators = "",
				section_separators = "",
				theme = 'auto',
				globalstatus = true
				-- theme = {
				-- 	-- We are going to use lualine_c an lualine_x as left and
				-- 	-- right section. Both are highlighted by c theme .  So we
				-- 	-- are just setting default looks o statusline
				-- 	normal = { c = { fg = colors.fg, bg = colors.bg } },
				-- 	inactive = { c = { fg = colors.fg, bg = colors.bg } },
				-- },
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- These will be filled later
				lualine_c = {},
				lualine_x = {}
			},
			inactive_sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_v = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {}
			}
		}

		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x ot right section
		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		-- TODO: work out how to make this an actual highlight group rather than an insert into the status line
		ins_left({
			function()
				local mode_color = {
					n = colors.red,
					i = colors.green,
					v = colors.blue,
					[""] = colors.blue,
					V = colors.blue,
					c = colors.magenta,
					no = colors.red,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					R = colors.violet,
					Rv = colors.violet,
					cv = colors.red,
					ce = colors.red,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.red,
					t = colors.red
				}
				vim.api.nvim_command("hi! LualineMode guibg=" ..
					mode_color[vim.fn.mode()] .. " guifg=" ..
					colors.bg)
				return ""
			end,
			color = "LualineMode",
			left_padding = 0
		})

		ins_left({ "mode", color = "LualineMode" })

		ins_left({ "branch", icon = "", cond = conditions.check_git_workspace })

		ins_left({
			"diff",
			symbols = { removed = " ", modified = " ", added = " " },
			cond = conditions.check_git_workspace and conditions.hide_in_width
		})

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " }
			-- NOTE: have a think about these options below
			-- sections = { "error", "warn" },
			-- always_visible = true,
		})

		ins_right({
			function()
				local row, column = unpack(vim.api.nvim_win_get_cursor(0))
				return "Ln " .. row .. ", Col " .. column
			end
		})

		ins_right({
			function()
				return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
			end
		})

		ins_right({ "o:encoding", fmt = string.upper, cond = conditions.hide_in_width })

		ins_right({ "fileformat", fmt = string.upper, icons_enabled = false })

		local function title_case(first, rest) return first:upper() .. rest:lower() end

		ins_right({
			function()
				return string.gsub(vim.bo.filetype, "(%a)([%w_']*)", title_case)
			end,
			icons_enabled = false
		})

		lualine.setup(config)
	end
}, {
	"kyazdani42/nvim-web-devicons", -- https://github.com/kyazdani42/nvim-web-devicons
	lazy = true
}, {
	"kyazdani42/nvim-tree.lua", -- https://github.com/kyazdani42/nvim-tree.lua
	lazy = true,
	cmd = "NvimTreeToggle",
	commit = "94e3b0990017a42fa4581ea3d0bc08b897727d4d",
	keys = {
		{ "<C-n>", "<CMD>NvimTreeToggle<CR>", desc = "Toggle file tree" }
	},
	opts = {
		open_on_setup = false,
		disable_netrw = true,
		hijack_netrw = true,
		auto_reload_on_write = true,
		open_on_tab = false,
		actions = {
			open_file = {
				quit_on_open = true,
				resize_window = true,
				window_picker = {
					enable = false,
				},
			},
		},
		diagnostics = {
			enable = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		update_focused_file = {
			enable = true,
			update_root = false,
		},
		git = {
			enable = true,
			ignore = true,
			timeout = 500,
		},
		view = {
			width = 50,
			hide_root_folder = true,
			side = "right",
			number = false,
			relativenumber = false,
		},
		renderer = {
			highlight_git = false,
			highlight_opened_files = "icon",
			icons = {
				glyphs = {
					default = "",
					symlink = "",
					git = {
						unstaged = "",
						staged = "S",
						unmerged = "",
						renamed = "➜",
						deleted = "",
						untracked = "U",
						ignored = "◌",
					},
					folder = {
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
					},
				},
			},
		},
	}
}, {
	"petertriho/nvim-scrollbar", -- https://github.com/petertriho/nvim-scrollbar
	dependencies = { "kevinhwang91/nvim-hlslens" },
	config = function()
		require('scrollbar').setup()
		require("scrollbar.handlers.search").setup({
			override_lens = function()
			end
		})
	end
}, {
	"folke/trouble.nvim", -- https://github.com/folke/trouble.nvim
	cmd = "TroubleToggle",
	lazy = true,
	dependencies = "kyazdani42/nvim-web-devicons",
	opts = { padding = false, use_diagnostic_signs = true },
	keys = {

		{
			"<leader>x",
			"<CMD>TroubleToggle<CR>",
			desc = "Toggle language diagnostics bottom bar"
		}
	}
}, {
	'mbbill/undotree', -- https://github.com/mbbill/undotree
	config = true,
	lazy = true,
	cmd = "UndotreeToggle",
	keys = {
		{
			"<leader>u",
			"<CMD>UndotreeToggle<CR>",
			desc = "[U]ndo tree toggle"
		}
	}
}
}
