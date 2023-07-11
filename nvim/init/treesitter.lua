local configs = require('nvim-treesitter.configs')

configs.setup {
	auto_install = vim.fn.executable("tree-sitter") ~= 0,
	ensure_installed = { "cpp", "lua" },

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
	},
}
