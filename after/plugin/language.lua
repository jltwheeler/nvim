local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "vtsls", "eslint", "lua_ls", "rust_analyzer", "pyright",
    "cssls", "html", "jsonls", "taplo"
  },
  handlers = {
    lsp_zero.default_setup,
  },
})
