return {
    {
        "nvim-telescope/telescope.nvim", -- https://github.com/nvim-telescope/telescope.nvim
        dependencies = { 'nvim-lua/plenary.nvim' },
        tag = '0.1.1',
        cmd = "Telescope",
        version = false,
        opts = {
          defaults = {
            layout_config = {
                horizontal = {
                  prompt_position = "top",
                  preview_width = 0.55,
                  results_width = 0.8,
                },
                vertical = {
                  mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
            },
          }
        },
        config = function()
            local telescope = require('telescope')
            telescope.load_extension('dir')
        end,
        keys = {
            {
                '<leader>fd',
                function()
                    require("telescope.builtin").diagnostics({ line_width = 99 })
                end,
                desc = "[F]ind [D]iagnostics"
            }, {
            '<leader>fv',
            function()
                require('telescope.builtin').find_files({
                    prompt_title = "< NVIM RC >",
                    cwd = "~/.config/nvim/",
                    hidden = true
                })
            end,
            desc = "[F]ind Neovim [C]onfig"
        }, {
            '<leader>fs',
            function()
                require("telescope.builtin").git_status()
            end,
            desc = "[F]ind [E]dited files"
        }, {
            '<leader>ff',
            function()
                require("telescope.builtin").find_files({ hidden = true })
            end,
            desc = "[F]ind [F]iles"
        }, {
            '<leader>fg',
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "[F]ind [G]it files"
        }, {
            '<leader>fh',
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "[F]ind Neovim [H]elp"
        }, {
            '<leader>fk',
            function() require("telescope.builtin").keymaps() end,
            desc = "[F]ind [K]eymaps"
        }, {
            '<leader>fo',
            function()
                require("telescope.builtin").oldfiles()
            end,
            desc = "[F]ind [O]ld files"
        }, {
                '<leader>ft',
                vim.cmd.TodoTelescope,
                desc = "[F]ind [T]odo comments"
            }, {
            '<leader>fw',
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "[F]ind [W]ord"
        }, {
            '<leader>fu',
            function()
                require("telescope").extensions.dir.live_grep()
            end,
            desc = "[F]ind word in directory"
        }, {
            '<leader>fi',
            function()
                require("telescope").extensions.dir.find_files()
            end,
            desc = "[F]ind file in directory"
        }
        }
    }, {
    "princejoogie/dir-telescope.nvim",     -- https://github.com/princejoogie/dir-telescope.nvim
    dependencies = { "nvim-telescope/telescope.nvim" }
}, {
    "dhruvmanila/telescope-bookmarks.nvim",     -- https://github.com/dhruvmanila/telescope-bookmarks.nvim
    dependencies = { "nvim-telescope/telescope.nvim" }
}
}
