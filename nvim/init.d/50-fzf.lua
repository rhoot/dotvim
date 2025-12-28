if not require("pkg_mgr").is_loaded("fzf-lua") then
	return
end

local fzf_lua = require("fzf-lua")
local util = require("util")

local find_opts = nil

if util.has("mac") and not util.executable("fd") then
	find_opts = "-type f"
end

fzf_lua.setup {
	files = {
		find_opts = find_opts,
	},
}

local cmdopts = { nargs='?', force=true }
vim.api.nvim_create_user_command("Files", function() fzf_lua.global() end, cmdopts)
vim.api.nvim_create_user_command("Buffers", function() fzf_lua.buffers() end, cmdopts)
vim.api.nvim_create_user_command("Ag", function(o) fzf_lua.grep({ search = o.args }) end, cmdopts)
