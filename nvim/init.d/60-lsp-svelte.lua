if not vim.lsp.config then
	return
end

-- look for .git before package.json, to support mono-repos
vim.lsp.config.svelte.root_markers = { ".git", "package.json" }

-- https://github.com/sveltejs/language-tools/issues/2311
vim.lsp.config("svelte", {
	workspace = {
		didChangeWatchedFiles = {
			dynamicRegistration = true,
		},
	},
})


