-- requires nvim >= 0.11
if not vim.lsp.enable then
	return
end

local util = require("util")

local function enable_lsp(name)
	if util.executable(vim.lsp.config[name].cmd[1]) then
		vim.lsp.enable(name)
	end
end

enable_lsp("clangd")
enable_lsp("slangd")
enable_lsp("sourcekit")
enable_lsp("svelte")
-- enable_lsp("cssls")
-- enable_lsp("gopls")
-- enable_lsp("html")
-- enable_lsp("pyright")
-- enable_lsp("ts_ls")
-- enable_lsp("zls")
