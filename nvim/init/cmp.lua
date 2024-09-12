local cmp = require("cmp")

-- Can be removed after nvim 0.10
local expand_snippet = vim.snippet and vim.snippet.expand or require("snippy").expand_snippet

cmp.setup {
	snippet = {
		expand = function(args)
			expand_snippet(args.body)
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
	},
}
