local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
MyGroup = augroup("MyGroup", {})

-- Disable continuation of comments on next line apart from on enter in insert
autocmd("BufWinEnter,BufRead,BufNewFile", {
	group = MyGroup,
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Highlight on yank
autocmd("TextYankPost", {
	group = MyGroup,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 175,
		})
	end,
})

-- Change tabs to be 4 spaces for python files only
autocmd("FileType", {
	group = MyGroup,
	pattern = "python",
	command = "setl shiftwidth=4 sts=4 ts=2 et",
})

-- Auto-resize splits when Vim gets resized.
autocmd("VimResized", {
	group = MyGroup,
	pattern = "*",
	command = "wincmd =",
})

-- Auto-resize splits when Vim gets resized.
autocmd("FocusGained,BufEnter", {
	group = MyGroup,
	pattern = "*",
	command = "checktime",
})

-- HCL file type detection
autocmd("BufRead,BufNewFile", {
	group = MyGroup,
	pattern = "*.hcl",
	command = "set filetype=hcl",
})

autocmd("BufRead,BufNewFile", {
	group = MyGroup,
	pattern = "*.tf,*.tfvars",
	command = "set filetype=terraform",
})

-- Disable indent blank line on nvim-dashboard
vim.cmd("let g:indentLine_fileTypeExclude = ['dashboard']")
