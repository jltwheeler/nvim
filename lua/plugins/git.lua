return {
    {
        "zbirenbaum/copilot.lua", -- https://github.com/zbirenbaum/copilot.lua
        lazy = true,
        cmd = "Copilot",
        event = "InsertEnter",
        build = ":Copilot auth",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = false,
                    auto_refresh = false,
                    keymap = {
                        jump_prev = "[[",
                        jump_next = "]]",
                        accept = "<CR>",
                        refresh = "gr",
                        open = "<M-CR>"
                    },
                    layout = {
                        position = "bottom", -- | top | left | right
                        ratio = 0.4
                    },
                },
                suggestion = {
                    enabled = false,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                filetypes = {
                    ["*"] = true,
                },
                copilot_node_command = 'node', -- Node.js version must be > 18.x
                server_opts_overrides = {},
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },
    {
        "ruifm/gitlinker.nvim", -- https://github.com/ruifm/gitlinker.nvim
        lazy = true,
        keys = {
            {
                "<leader>gl",
                "<CMD>lua require('gitlinker').get_buf_range_url('n')<CR>",
                desc = "Remote line link"
            }, {
            "<leader>gy",
            "<CMD>lua require('gitlinker').get_buf_range_url('v')<CR>",
            mode = "v",
            desc = "Remote range link"
        }
        },
        opts = { mappings = nil }
    }, {
    "lewis6991/gitsigns.nvim", -- https://github.com/lewis6991/gitsigns.nvim
    dependencies = { "petertriho/nvim-scrollbar" },
    config = function()
        require("gitsigns").setup({
            signs = {
                add = {
                    hl = "GitSignsAdd",
                    text = "│",
                    numhl = "GitSignsAddNr",
                    linehl = "GitSignsAddLn"
                },
                change = {
                    hl = "GitSignsChange",
                    text = "│",
                    numhl = "GitSignsChangeNr",
                    linehl = "GitSignsChangeLn"
                },
                delete = {
                    hl = "GitSignsDelete",
                    text = "_",
                    numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn"
                },
                topdelete = {
                    hl = "GitSignsDelete",
                    text = "‾",
                    numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn"
                },
                changedelete = {
                    hl = "GitSignsChange",
                    text = "~",
                    numhl = "GitSignsChangeNr",
                    linehl = "GitSignsChangeLn"
                }
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = true,      -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = { interval = 1000, follow_files = true },
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000,
            preview_config = {
                -- Options passed to nvim_open_win
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1
            },
            yadm = { enable = false },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then return "]c" end
                    vim.schedule(function() gs.next_hunk() end)
                    return "<Ignore>"
                end, { expr = true })

                map("n", "[c", function()
                    if vim.wo.diff then return "[c" end
                    vim.schedule(function() gs.prev_hunk() end)
                    return "<Ignore>"
                end, { expr = true })

                -- Actions
                map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
                map("n", "<leader>hR", gs.reset_buffer)
                map("n", "<leader>hp", gs.preview_hunk)
                map("n", "<leader>hb", function() gs.blame_line({ full = true }) end)
                map("n", "<leader>hd", gs.diffthis)
                map("n", "<leader>hD", function() gs.diffthis("~") end)
                map("n", "<leader>tb", gs.toggle_current_line_blame)
                map("n", "<leader>td", gs.toggle_deleted)
            end
        })

        local scrollbar_status_ok, _ = pcall(require, "scrollbar")
        if not scrollbar_status_ok then return end

        require("scrollbar.handlers.gitsigns").setup()
    end,
}, {
    "f-person/git-blame.nvim", -- https://github.com/f-person/git-blame.nvim#configuration
    lazy = false,
    opts = {
        enabled = 1,
        display_virtual_text = 1,
        delay = 1000,
        set_extmark_options = { -- this solves the git blame overriding cursorline highlighting
            hl_mode = "combine"
        },
        date_format = '(%r) • %d/%m/%y',
        message_template = '  <author> <date> • <summary>'
    },
    keys = {
        {
            "<leader>go",
            "<CMD>GitBlameOpenCommitURL<CR>",
            desc = "Open commit URL"
        }
    }
}
}
