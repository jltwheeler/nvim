local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local code_actions = null_ls.builtins.code_actions

local sources = {
	diagnostics.eslint_d,
	-- diagnostics.eslint,
	code_actions.eslint_d,
	--[[ formatting.eslint_d.with({
		condition = function(utils)
			return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
		end,
		prefer_local = "node_modules/.bin",
		filetype = { "javascript", "typescript" },
	}), ]]
	formatting.prettier.with({
		--[[ condition = function(utils)
			return not utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
		end, ]]
		filetypes = {
			"yaml",
			"html",
			"css",
			"scss",
			"json",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		-- extra_args = { "--single-quote", "--print-width", "140" },
	}),
	-- formatting.black.with({ extra_args = { "--fast" } }),
	formatting.stylua,
	formatting.terraform_fmt.with({
		filetypes = { "terraform", "tf", "terraform-vars", "hcl" },
	}),
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 1000 })
			end,
		})
	end
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
