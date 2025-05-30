local util = require("util")

local function set_cwd_title(cwd)
	vim.o.titlestring = vim.fn.fnamemodify(cwd, ":t").." — nvim"
end

if util.has("mac") then
	vim.o.guifont = "JetBrains Mono:h12"
else
	vim.o.guifont = "VictorMono NF:h10"
end

vim.o.mouse = "nvi"
vim.o.title = true

set_cwd_title(vim.fn.getcwd())

vim.api.nvim_create_augroup("dirchange", { clear = true })
vim.api.nvim_create_autocmd("DirChanged", {
	group = "dirchange",
	callback = function() set_cwd_title(vim.v.event.cwd) end,
})
