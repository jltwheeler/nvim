local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	"lewis6991/impatient.nvim", -- Faster initial load time of neovim
	"nathom/filetype.nvim", -- Boost startup time of opening files
	-- Color scheme
	"folke/tokyonight.nvim",
	-- Color highlighter
	"norcalli/nvim-colorizer.lua",
	-- Treesitter
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/playground",
	"nvim-treesitter/nvim-treesitter-textobjects", -- Additional textobjects for treesitter
	"romgrk/nvim-treesitter-context",
	"windwp/nvim-ts-autotag", -- Use treesitter to auto close and auto rename html tag
	"JoosepAlviste/nvim-ts-context-commentstring",
	-- LSP and completion
	"VonHeikemen/lsp-zero.nvim",
	-- LSP Support
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- Autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"lukas-reineke/lsp-format.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	-- rust
	"rust-lang/rust.vim",
	"simrat39/rust-tools.nvim",
	-- cmp plugins
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"onsails/lspkind-nvim", -- Custom icons on completion menu
	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	"dhruvmanila/telescope-bookmarks.nvim",
	-- version control
	"lewis6991/gitsigns.nvim",
	"petertriho/nvim-scrollbar",
	"ruifm/gitlinker.nvim",
	-- File explorer
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",
	"mbbill/undotree", -- https://github.com/mbbill/undotree
	-- Tree view for outlining lsp symbols
	"simrat39/symbols-outline.nvim",
	-- Buffer line
	"akinsho/bufferline.nvim",
	-- Status line
	"hoob3rt/lualine.nvim",
	-- Add indentation guides even on blank lines
	"lukas-reineke/indent-blankline.nvim",
	-- Dashboard
	"goolord/alpha-nvim",
	-- Utilities
	"windwp/nvim-autopairs",
	"b3nj5m1n/kommentary",
	"tpope/vim-surround",
	"christoomey/vim-tmux-navigator",
	"yamatsum/nvim-cursorline",
}

local opts = {}

require("lazy").setup(plugins, opts)
