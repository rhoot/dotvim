local configs = require("nvim-treesitter.configs")
local util = require("util")

configs.setup {
	auto_install = util.executable("tree-sitter"),

	ensure_installed = {
		"asm",
		"bash",
		"c",
		"cpp",
		"css",
		"go",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"svelte",
		"swift",
		"toml",
		"typescript",
		"vim",
	},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = {
		-- Too much latency when entering insert mode...
		enable = false,
	},
}
