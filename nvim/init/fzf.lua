require("fzf-lua").setup({ "default" })

local cmdopts = { nargs='?', force=true }
vim.api.nvim_create_user_command("Files", "FzfLua files", cmdopts)
vim.api.nvim_create_user_command("Buffers", "FzfLua buffers", cmdopts)
