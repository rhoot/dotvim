if not vim.lsp.config then
	return
end

-- sourcekit also tries to spawn for cpp files, and warns when it fails...
vim.lsp.config.sourcekit.filetypes = { "swift" }
