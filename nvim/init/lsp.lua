local cmp = require("cmp")
local lspconfig = require("lspconfig")

local root_pattern = require('lspconfig.util').root_pattern

cmp.setup {
	snippet = {
		expand = function(args)
			if vim.snippet then
				vim.snippet.expand(args.body)
			else
				require("snippy").expand_snippet(args.body)
			end
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
	},
}

local opts = { noremap=true, silent=true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<leader>h", ":ClangdSwitchSourceHeader<CR>", opts)

local function on_attach(client, bufnr)
	-- Enable completion triggerd by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
end

-- https://github.com/sveltejs/language-tools/issues/2311
local svelte_capabilities = vim.lsp.protocol.make_client_capabilities()
svelte_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

lspconfig.clangd.setup {
	on_attach = on_attach,
	cmd = {"clangd", "--background-index", "--header-insertion=never"},
}

lspconfig.svelte.setup {
	on_attach = on_attach,
	capabilities = svelte_capabilities,
	root_dir = root_pattern(".git"),
}

lspconfig.cssls.setup { on_attach = on_attach }
lspconfig.glslls.setup { on_attach = on_attach }
lspconfig.gopls.setup { on_attach = on_attach }
lspconfig.html.setup { on_attach = on_attach }
lspconfig.pyright.setup { on_attach = on_attach }
lspconfig.tsserver.setup { on_attach = on_attach }
lspconfig.zls.setup { on_attach = on_attach }
