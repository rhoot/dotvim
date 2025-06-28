return {
	cmd = { "svelteserver", "--stdio" },
	filetypes = { "svelte" },

	-- .git before package.json for mono repos
	root_markers = { ".git", "package.json" },

	-- https://github.com/sveltejs/language-tools/issues/2311
	workspace = {
		didChangeWatchedFiles = {
			dynamicRegistration = true,
		},
	},
}
