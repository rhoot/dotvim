return {
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift" },
	root_markers = { "Package.swift", ".git" },
	handlers = {
		-- https://github.com/swiftlang/sourcekit-lsp/issues/2021
		['textDocument/inlayHint'] = function() end,
	},
}
