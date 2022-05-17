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
	use("p00f/nvim-ts-rainbow") -- Raindbow brackets for TS
	use("nvim-treesitter/nvim-treesitter-textobjects") -- Additional textobjects for treesitter
	use({
		"romgrk/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup()
		end,
	})
	use("windwp/nvim-ts-autotag") -- Use treesitter to auto close and auto rename html tag
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- lsp plugins
	use("neovim/nvim-lspconfig") -- Configure the built-in LSP client
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- formatting, linting etc.
	use("jose-elias-alvarez/nvim-lsp-ts-utils") -- Utilities to improve the TS dev ex

	-- rust
	use("rust-lang/rust.vim")
	use("simrat39/rust-tools.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions
	use("hrsh7th/cmp-nvim-lua") -- lua completions
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("onsails/lspkind-nvim") -- Custom icons on completion menu

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- git
	use("lewis6991/gitsigns.nvim")

	-- File explorer
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

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

	use({ "akinsho/toggleterm.nvim" }) -- terminal within neovim

	-- smooth scrolling
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	})

	-- Utilities
	use("windwp/nvim-autopairs")
	use("b3nj5m1n/kommentary") -- commenting code
	use("tpope/vim-surround")
	use("jltwheeler/nvim-git-link")
	use("christoomey/vim-tmux-navigator") -- Easy navigation between tmux panes and vim

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
