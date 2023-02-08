-- vimrc
vim.cmd [[
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath=&runtimepath
	source ~/.vimrc
]]

-- packages
vim.cmd [[
	packadd! cmp-nvim-lsp
	packadd! cmp-nvim-lsp-signature-help
	packadd! nvim-cmp
	packadd! nvim-lspconfig
]]

-- configs
local paths = vim.split(vim.fn.glob("~/.config/nvim/init/*.lua"), "\n")
for _,f in ipairs(paths) do
	dofile(f)
end