-- requires nvim >= 0.11
if not vim.lsp.enable then
	return
end

local util = require("util")

local function enable_lsp(name)
	local cmd = vim.lsp.config[name].cmd
	if type(cmd) ~= "table" or util.executable(cmd[1]) then
		vim.lsp.enable(name)
	end
end

enable_lsp("clangd")
enable_lsp("gdscript")
enable_lsp("omnisharp")
enable_lsp("slangd")
enable_lsp("sourcekit")
enable_lsp("svelte")
-- enable_lsp("cssls")
-- enable_lsp("gopls")
-- enable_lsp("html")
-- enable_lsp("pyright")
-- enable_lsp("ts_ls")
-- enable_lsp("zls")
