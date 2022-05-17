local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

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
