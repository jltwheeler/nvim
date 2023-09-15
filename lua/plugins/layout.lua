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
    dependencies = "kyazdani42/nvim-web-devicons"
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
        auto_reload_on_write = true,
        update_focused_file = { enable = true, update_cwd = false },
        git = { enable = true, ignore = false, timeout = 500 },
        view = {
            width = 60,
            hide_root_folder = true,
            side = 'right',
            number = false,
            relativenumber = true,
            signcolumn = "no"
        },
        actions = { open_file = { quit_on_open = true } },
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
