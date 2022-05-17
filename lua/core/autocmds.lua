local utils = require('core.utils')

utils.define_augroups({
    _general_settings = {
        -- Disable continuation of comments on next line
        {'BufWinEnter', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'r\', \'o\'})'},
        {'BufRead', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'r\', \'o\'})'},
        {'BufNewFile', '*', 'lua vim.opt.formatoptions:remove({\'c\', \'r\', \'o\'})'},
        {'TextYankPost', '*', 'silent! lua vim.highlight.on_yank()'}, -- Highlight on yank
        {'FileType', 'python', 'setl shiftwidth=4 sts=4 ts=2 et'},  -- Change tabs to be 4 spaces for python files only
        {'VimResized','*','wincmd ='}, -- Auto-resize splits when Vim gets resized.
        {'FocusGained', '*', ':checktime'}, -- Auto-resize splits when Vim gets resized.
        {'BufEnter', '*', ':checktime'}, -- Update a buffer's contents on focus if it changed outside of Vim.
    },
    --_markdown = {{'FileType', 'markdown', 'setlocal wrap'}, {'FileType', 'markdown', 'setlocal spell'}},
    --_buffer_bindings = {
    --    {'FileType', 'dashboard', 'nnoremap <silent> <buffer> q :q<CR>'},
    --    {'FileType', 'lspinfo', 'nnoremap <silent> <buffer> q :q<CR>'},
    --    {'FileType', 'floaterm', 'nnoremap <silent> <buffer> q :q<CR>'},
    --},
    --_auto_formatters = auto_formatters
})

-- Disable indent blank line on nvim-dashboard
vim.cmd("let g:indentLine_fileTypeExclude = ['dashboard']")
