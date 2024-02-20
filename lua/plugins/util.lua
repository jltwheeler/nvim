return {
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        init = function() vim.g.startuptime_tries = 10 end
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    }
}
