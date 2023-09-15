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

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Centralise cursor after certain actions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "}", "}zzzv")
vim.keymap.set("n", "{", "{zzzv")

-- Replace current word under cursor
vim.keymap.set("n", "<leader>rw",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "[R]eplace [W]ord under cursor" })

-- Void pasting, deleting and copying
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Void paste" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank movement to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Void delete movement" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Void delete selection" })

-- Gitsigns hunk navigation
keymap("n", "<leader>gk", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>gj", ":Gitsigns next_hunk<CR>", opts)
