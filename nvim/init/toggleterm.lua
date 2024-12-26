local toggleterm = require("toggleterm")
local terminal = require("toggleterm.terminal")
local util = require("util")

toggleterm.setup {
	float_ops = {
		win_blend = 60,
	},
}

vim.keymap.set("n", "T", function() toggleterm.toggle_command() end)

-- Terminal bindings
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*toggleterm#*",
	callback = function(event)
		local opts = { buffer=event.buf }
		vim.keymap.set("t", "<esc>", "<C-\\><C-n>", opts)
		vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", opts)
	end,
})

-- Lazygit floating terminal
if util.executable("lazygit") then
	local lazygit_term

	local function toggle_lazygit()
		lazygit_term:toggle()
	end

	lazygit_term = terminal.Terminal:new {
		cmd = "lazygit",
		direction = "float",
		hidden = true,

		on_open = function(term)
			vim.keymap.del("t", "<esc>", { buffer=term.bufnr })
			vim.keymap.set("t", "<leader>g", toggle_lazygit, { buffer=term.bufnr, silent=true })
		end,
	}

	vim.keymap.set("n", "<leader>g", toggle_lazygit, { silent=true })
end
