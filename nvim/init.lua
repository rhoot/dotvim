-- vimrc / packages
vim.cmd [[
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath=&runtimepath
	source ~/.vimrc
]]

-- nvim init scripts
local paths = vim.split(vim.fn.glob("~/.config/nvim/init/*.lua"), "\n")
for _,f in ipairs(paths) do
	dofile(f)
end
