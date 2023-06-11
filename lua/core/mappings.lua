local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Wipe leader mappings
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap nicely
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move text under selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- set leader key to spacebar
keymap("n", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "

-- ctrl backspace to delete entire word backwards in insert mode
keymap("i", "<C-H>", "<C-W>", opts)

-- ctrl delete to delete entire word forwards in insert mode
keymap("i", "<C-Del>", "<C-o>dw", opts)

-- Split window
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Buffer switching
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Easier indenting
keymap("v", "<", "<gv", opts) -- reselect after indent left
keymap("v", ">", ">gv", opts) -- reselect after indent right

-- Git diff split view
keymap("n", "<leader>gs", ":Gdiffsplit<CR>", opts)

-- Toggle checker
keymap("n", "<leader>sc", "spell!<CR>", opts)

-- Yanking to behave like other Vim commands.
keymap("n", "Y", "y$", opts)

-- Keep searches and joins centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Moving between splits
keymap("n", "<C-J>", "<C-W><C-J>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)

-- Add undo break points for special characters
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- File explorer
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)

-- nvim-git-link
keymap("n", "<leader>gl", [[<cmd>lua require('nvim-git-link').get_remote_link()<cr>]], opts)

-- Add Telescope leader shortcuts
keymap("n", "<leader><space>", [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], opts)
keymap("n", "<leader>ff", ":Telescope find_files find_command=rg,--ignore,--hidden,--files,--iglob=!.git <cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').git_files()<cr>", opts)
keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
keymap("n", "<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>fd", [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], opts)
keymap("n", "<leader>fm", [[<cmd>lua require('telescope.builtin').keymaps()<cr>]], opts)
keymap("n", "<leader>fo", [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], opts)
keymap("n", "<leader>fv", [[<cmd>lua require('core.jw.telescope').search_config_nvim()<cr>]], opts)
keymap("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions({show_line = false})<cr>", opts)
keymap("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references({show_line = false})<cr>", opts)
keymap("n", "<leader>bm", "<cmd>lua require('telescope').extensions.bookmarks.bookmarks()<cr>", opts)
keymap("n", "<leader>ltd", "<cmd>lua require('telescope.builtin').lsp_type_definitions({show_line = false})<cr>", opts)
keymap("n", "<leader>ld", "<cmd>lua require('telescope.builtin').lsp_definitions({show_line = false})<cr>", opts)

-- Gitsigns hunk navigation
keymap("n", "<leader>gk", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>gj", ":Gitsigns next_hunk<CR>", opts)

-- Actions
keymap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", opts)
keymap("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_lineopts<CR>', opts)
keymap("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>", opts)
keymap("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>', opts)
keymap("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>", opts)

-- Bufferline
keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", opts)

-- Dashboard
keymap("n", "<leader>fn", "<cmd>DashboardNewFile<CR>", opts)

keymap("n", "<leader>rf", "<cmd>lua vim.lsp.buf.formatting_sync({}, 5000)<CR>", opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Centralise cursor after certain actions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "}", "}zzzv")
vim.keymap.set("n", "{", "{zzzv")

-- Gitlinker
vim.api.nvim_set_keymap(
	"n",
	"<leader>gb",
	'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
	{ silent = true }
)
vim.api.nvim_set_keymap(
	"v",
	"<leader>gb",
	'<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
	{}
)
