if not require("pkg_mgr").is_loaded("nvim-lspconfig") then
	return
end

local prev_on_attach = vim.lsp.config.clangd.on_attach

vim.lsp.config.clangd.cmd = { "clangd", "--background-index", "--header-insertion=never" }

vim.lsp.config("clangd", {
	on_attach = function(client, bufnr)
		prev_on_attach(client, bufnr)
		vim.keymap.set("n", "gh", ":LspClangdSwitchSourceHeader<CR>", { buffer=bufnr })
	end,
})
