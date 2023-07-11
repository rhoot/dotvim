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

if vim.fn.has("linux") ~= 0 then
	vim.cmd("packadd! nvim-treesitter")
end

-- configs
local paths = vim.split(vim.fn.glob("~/.vim/nvim/init/*.lua"), "\n")
for _,f in ipairs(paths) do
	dofile(f)
end
