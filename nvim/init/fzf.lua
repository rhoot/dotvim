local fzf_lua = require("fzf-lua")

fzf_lua.setup()

local cmdopts = { nargs='?', force=true }
vim.api.nvim_create_user_command("Files", function() fzf_lua.files() end, cmdopts)
vim.api.nvim_create_user_command("Buffers", function() fzf_lua.buffers() end, cmdopts)
vim.api.nvim_create_user_command("Ag", function(o) fzf_lua.grep({ search = o.args }) end, cmdopts)
