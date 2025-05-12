-- requires nvim >= 0.11
if not vim.lsp.enable then
	return
end

vim.keymap.set("n", "gh", ":LspClangdSwitchSourceHeader<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		-- the default diagnostic binds don't auto-open the diagnostic float
		vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count=-vim.v.count1, float=true }) end, { buffer=args.buf })
		vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count=vim.v.count1, float=true }) end, { buffer=args.buf })
		vim.keymap.set("n", "[D", function() vim.diagnostic.jump({ count=-math.huge, wrap=false, float=true }) end, { buffer=args.buf })
		vim.keymap.set("n", "]D", function() vim.diagnostic.jump({ count=math.huge, wrap=false, float=true }) end, { buffer=args.buf })

		-- enable completion side effects
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger=true })
		end

		-- enable inlay hints
		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr=args.buf })
		end

		-- enable idle symbol highlighting
		if client:supports_method("textDocument/documentHighlight") then
			local augroup = vim.api.nvim_create_augroup("lsp_highlight", { clear=false })
			vim.api.nvim_clear_autocmds({ buffer=bufnr, group=augroup })
			vim.api.nvim_create_autocmd({ "CursorHold" }, { group=augroup, buffer=args.buf, callback=vim.lsp.buf.document_highlight })
			vim.api.nvim_create_autocmd({ "CursorMoved" }, { group=augroup, buffer=args.buf, callback=vim.lsp.buf.clear_references })
		end
	end,
})

vim.lsp.config.clangd.cmd = { "clangd", "--background-index", "--header-insertion=never" }

-- sourcekit also tries to spawn for cpp files, and warns when it fails...
vim.lsp.config.sourcekit.filetypes = { "swift" }

-- https://github.com/sveltejs/language-tools/issues/2311
vim.lsp.config.svelte.root_markers = { ".git", "package.json" }
vim.lsp.config("svelte", {
	workspace = {
		didChangeWatchedFiles = {
			dynamicRegistration = true,
		},
	},
})

vim.lsp.enable("clangd")
vim.lsp.enable("cssls")
vim.lsp.enable("gopls")
vim.lsp.enable("html")
vim.lsp.enable("pyright")
vim.lsp.enable("sourcekit")
vim.lsp.enable("svelte")
vim.lsp.enable("ts_ls")
vim.lsp.enable("zls")
