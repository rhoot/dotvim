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
	packadd! fzf-lua
	packadd! nvim-cmp
	packadd! nvim-lspconfig
	packadd! nvim-treesitter
	packadd! nvim-web-devicons
	packadd! toggleterm.nvim
]]

if not vim.snippet then
	vim.cmd "packadd! nvim-snippy"
end

-- configs
local paths = vim.split(vim.fn.glob("~/.vim/nvim/init/*.lua"), "\n")
for _,f in ipairs(paths) do
	local ok, err = pcall(dofile, f)
	if not ok then
		vim.notify(err, vim.log.levels.ERROR)
	end
end
