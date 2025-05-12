-- vimrc
vim.cmd [[
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath=&runtimepath
	source ~/.vimrc
]]

-- init.d
local paths = vim.split(vim.fn.glob("~/.vim/nvim/init.d/*.lua"), "\n")
for _,f in ipairs(paths) do
	local ok, err = pcall(dofile, f)
	if not ok then
		vim.notify(err, vim.log.levels.ERROR)
	end
end
