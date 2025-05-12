if not require("pkg_mgr").is_loaded("nvim-lspconfig") then
	return
end

-- sourcekit also tries to spawn for cpp files, and warns when it fails...
vim.lsp.config.sourcekit.filetypes = { "swift" }
