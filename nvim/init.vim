set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

if has("mac")
	set guifont=JetBrains\ Mono:h12
elseif has("linux")
	set guifont=JetBrains\ Mono:h10
else
	set guifont=JetBrains\ Mono:h9
endif

set mouse=nvi

lua <<EOF
	local cmp = require("cmp")
	cmp.setup {
		mapping = {
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<Tab>"] = cmp.mapping.confirm({ select = true }),
		},
		sources = {
			{ name = "nvim_lsp" },
		},
	}

	require("lspconfig").clangd.setup {
		cmd = {"clangd", "--background-index", "--log=verbose"},
	}
EOF
