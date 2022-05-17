-- core neovim config
require("core.options")
require("core.mappings")
require("core.autocmds")
require("core.plugins")
require("core.colorscheme")

-- Speed up loading Lua modules in Neovim to improve startup time.
-- impatient needs to be setup before any other lua plugin is loaded
local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
	return
end

-- plugin configs
require("configs.alpha")

require("configs.autopairs")
require("configs.bufferline")
require("configs.cmp")
require("configs.filetype")
require("configs.gitsigns")
require("configs.indent-blank-line")
require("configs.kommentary")
require("configs.lsp-installer")
require("configs.nvim-tree")
require("configs.lsp")
require("configs.lualine")
require("configs.telescope")
require("configs.toggleterm")
require("configs.treesitter")
