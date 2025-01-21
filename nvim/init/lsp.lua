local lspconfig = require("lspconfig")
local lsp_zero = require("lsp-zero")
local lsp_util = require("lspconfig.util")
local util = require("util")

-- Global binds
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev) -- default in nvim 0.10
vim.keymap.set("n", "]d", vim.diagnostic.goto_next) -- default in nvim 0.10
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<space>h", ":ClangdSwitchSourceHeader<CR>")

-- LSP attach callback
function on_attach(client, bufnr)
	lsp_zero.default_keymaps({
		buffer = bufnr,
		exclude = { "<F2>", "<F3>", "<F4>" },
		preserve_mappings = false,
	})

	local bufopts = { buffer=bufnr }
	vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.format, bufopts)
	vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, bufopts)
end

-- LSP setup
lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- https://github.com/sveltejs/language-tools/issues/2311
local svelte_capabilities = vim.lsp.protocol.make_client_capabilities()
svelte_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

lspconfig.clangd.setup {
	cmd = {"clangd", "--background-index", "--header-insertion=never"},
}

lspconfig.svelte.setup {
	capabilities = svelte_capabilities,
	root_dir = lsp_util.root_pattern(".git"),
}

lspconfig.cssls.setup {}
lspconfig.gopls.setup {}
lspconfig.html.setup {}
lspconfig.pyright.setup {}
lspconfig.ts_ls.setup {}
lspconfig.zls.setup {}

-- sourcekit also tries to spawn for cpp files, and warns when it fails...
if util.executable("sourcekit-lsp") then
	lspconfig.sourcekit.setup {}
end
