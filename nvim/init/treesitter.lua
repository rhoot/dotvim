local configs = require("nvim-treesitter.configs")
local util = require("util")

configs.setup {
	auto_install = util.executable("tree-sitter"),
	ensure_installed = { "cpp", "lua" },

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = false,
	},
}
