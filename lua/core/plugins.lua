local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- Performance
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("lewis6991/impatient.nvim") -- Faster initial load time of neovim
	use("nathom/filetype.nvim") -- Boost startup time of opening files

	-- Color scheme
	use("folke/tokyonight.nvim")

	-- Color highlighter
	use("norcalli/nvim-colorizer.lua")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")
	use("nvim-treesitter/nvim-treesitter-textobjects") -- Additional textobjects for treesitter
	use({
		"romgrk/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup()
		end,
	})
	use("windwp/nvim-ts-autotag") -- Use treesitter to auto close and auto rename html tag
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- LSP and completion
	use({
		"VonHeikemen/lsp-zero.nvim", -- https://github.com/VonHeikemen/lsp-zero.nvim
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use("lukas-reineke/lsp-format.nvim") -- https://github.com/lukas-reineke/lsp-format.nvim
	use("jose-elias-alvarez/null-ls.nvim") -- https://github.com/jose-elias-alvarez/null-ls.nvim

	-- rust
	use("rust-lang/rust.vim")
	use({
		"simrat39/rust-tools.nvim",
		config = function()
			require("rust-tools").setup()
		end,
	})

	-- cmp plugins
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("onsails/lspkind-nvim") -- Custom icons on completion menu

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("dhruvmanila/telescope-bookmarks.nvim") -- https://github.com/dhruvmanila/telescope-bookmarks.nvim

	-- version control
	use({
		"lewis6991/gitsigns.nvim", -- https://github.com/lewis6991/gitsigns.nvim
		requires = { "petertriho/nvim-scrollbar" },
	})
	use("ruifm/gitlinker.nvim") -- https://github.com/ruifm/gitlinker.nvim

	-- File explorer
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	use("mbbill/undotree") -- https://github.com/mbbill/undotree

	-- Tree view for outlining lsp symbols
	use("simrat39/symbols-outline.nvim")

	-- Buffer line
	use("akinsho/bufferline.nvim")

	-- Status line
	use("hoob3rt/lualine.nvim")

	-- Add indentation guides even on blank lines
	use("lukas-reineke/indent-blankline.nvim")

	-- Dashboard
	use({ "goolord/alpha-nvim" })

	-- Utilities
	use("windwp/nvim-autopairs")
	use("b3nj5m1n/kommentary") -- commenting code
	use("tpope/vim-surround")
	use("christoomey/vim-tmux-navigator") -- Easy navigation between tmux panes and vim
	use("yamatsum/nvim-cursorline") -- https://github.com/yamatsum/nvim-cursorline

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
