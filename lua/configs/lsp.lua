local status_lsp_ok, lsp = pcall(require, "lsp-zero")
if not status_lsp_ok then
	return
end

local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
	return
end

local status_luasnip_ok, luasnip = pcall(require, "luasnip")
if not status_luasnip_ok then
	return
end

local status_format_ok, lsp_format = pcall(require, "lsp-format")
if status_format_ok then
	lsp_format.setup()
end

require("mason.settings").set({
	ui = {
		border = "rounded",
	},
})

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"rust_analyzer",
	"pyright",
	"cssls",
	"html",
	"jsonls",
	"taplo",
})

lsp.setup_nvim_cmp({
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),
})

lsp.set_preferences({
	sign_icons = {
		error = "",
		warn = "",
		hint = "",
		info = "",
	},
})

lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp.on_attach(function(client, bufnr)
	if client.name ~= "null-ls" then
		lsp_format.on_attach(client)
	end
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	local builtin = require("telescope.builtin")
	nmap("gd", function()
		builtin.lsp_definitions({ show_line = false })
	end, "[G]o to [D]efinition")
	nmap("gD", function()
		builtin.lsp_type_definitions({ show_line = false })
	end, "[G]o to type [D]efinition")
	nmap("gr", function()
		builtin.lsp_references({ show_line = false })
	end, "[G]o [R]eferences")
	nmap("K", vim.lsp.buf.hover, "Hover documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature documentation")
	nmap("gi", vim.lsp.buf.implementation, "[G]o to [I]mplementation")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	nmap("[d", vim.diagnostic.goto_prev, "Go to previous [D]iagnostic message")
	nmap("]d", vim.diagnostic.goto_next, "Go to next [D]iagnostic message")
	nmap("gl", vim.diagnostic.open_float, "[G]o to [L]ine diagnostic float")
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

-- this inserts () after selecting a function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
