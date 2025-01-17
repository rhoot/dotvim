local configs = require("nvim-treesitter.configs")
local util = require("util")

local options = {
	auto_install = false,

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

if util.executable("tree-sitter") then
	options.auto_install = true

	-- LSPs that _require_ tree-sitter to be installed
	table.insert(options.ensure_installed, "swift")
end

configs.setup(options)
