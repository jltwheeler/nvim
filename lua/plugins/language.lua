return {
    {
        { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
        --- Uncomment these if you want to manage LSP servers from neovim
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

        -- LSP Support
        {
            'neovim/nvim-lspconfig',
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp' },
            },
        },

        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            dependencies = {
                { 'L3MON4D3/LuaSnip' },
            }
        }
    }
    , {
    "j-hui/fidget.nvim", -- https://github.com/j-hui/fidget.nvim
    config = true,
    tag = 'legacy'
}, {
    "elentok/format-on-save.nvim", -- https://github.com/elentok/format-on-save.nvim
    config = function()
        local format_on_save = require("format-on-save")
        local formatters = require("format-on-save.formatters")

        format_on_save.setup({
            exclude_path_patterns = {
                "/node_modules/",
                ".local/share/nvim/lazy",
            },
            formatter_by_ft = {
                css = formatters.lsp,
                html = formatters.lsp,
                javascript = formatters.lsp,
                json = formatters.prettierd,
                jsonc = formatters.prettierd,
                lua = formatters.lsp,
                markdown = formatters.prettierd,
                python = formatters.black,
                rust = formatters.lsp,
                scss = formatters.lsp,
                sh = formatters.shfmt,
                typescript = formatters.prettierd,
                typescriptreact = formatters.prettierd,
                yaml = formatters.lsp,
                toml = formatters.lsp,
                go = {
                    formatters.shell({ cmd = { "gofmt" } }),
                },
            },
        })
    end
},
    {
        "marilari88/twoslash-queries.nvim", -- https://github.com/marilari88/twoslash-queries.nvim
        config = true,
        lazy = true,
        cmd = "InspectTwoslashQueries",
        keys = {
            {
                "<leader>it",
                "<CMD>InspectTwoslashQueries<CR>",
                desc = "[I]nspect [T]ype"
            }
        }
    },
    {
        'andythigpen/nvim-coverage', -- https://github.com/andythigpen/nvim-coverage
        opts = {
            auto_reload = true,
        },
        config = true,
        keys = {
            {
                "<leader>cl",
                "<CMD>Coverage<CR>",
                desc = "[C]overage [L]oad"
            },
            {
                "<leader>ct",
                "<CMD>CoverageToggle<CR>",
                desc = "[C]overage [T]oggle"
            },
            {
                "<leader>cs",
                "<CMD>CoverageSummary<CR>",
                desc = "[C]overage [S]ummary"
            }

        }

    }
}
