local cursors = require("multiple-cursors")
local virtual_cursors = require("multiple-cursors.virtual_cursors")

local function offset_cursor_col(offset)
		local pos = vim.api.nvim_win_get_cursor(0)
		pos[2] = pos[2] + offset
		vim.api.nvim_win_set_cursor(0, pos)
end

-- Override of the original function that also maintains the relative cursor position within each match
local function add_cursor_and_jump_to_next_match()
	-- Move the cursor to the start of the word to ensure it matches the current instance of it
	local curr_pos = vim.fn.getcurpos()
	local start_pos = vim.fn.searchpos("\\<", "bcW")
	cursors.add_cursor_and_jump_to_next_match()

	local curr_col = curr_pos[3]
	local start_col = start_pos[2]

	if curr_col > start_col then
		-- Move the virtual cursor to where the cursor was originally, instead of at the start of the word
		virtual_cursors.remove_by_pos(start_pos[1], start_pos[2])
		virtual_cursors.add(curr_pos[2], curr_pos[3], curr_pos[5], true)

		-- Move the real cursor to the correct offset
		offset_cursor_col(curr_col - start_col)
	end
end

-- Override of the original function that also maintains the relative cursor position within each match
local function jump_to_next_match()
	local curr_pos = vim.fn.getcurpos()
	local start_pos = vim.fn.searchpos("\\<", "bcW")
	cursors.jump_to_next_match()

	local curr_col = curr_pos[3]
	local start_col = start_pos[2]

	if curr_col > start_col then
		offset_cursor_col(curr_col - start_col)
	end
end


-- Override of the original function that also maintains the relative cursor position within each match
local function add_cursors_to_matches()
	local initial_pos = vim.fn.getcurpos()
	cursors.add_cursors_to_matches()

	local new_pos = vim.fn.getcurpos()
	local offset = initial_pos[3] - new_pos[3]

	if offset > 0 then
		virtual_cursors.move_with_normal_command(offset, "l")
		offset_cursor_col(offset)
	end
end

cursors.setup({
	custom_key_maps = {
		{"i", "<C-d>", add_cursors_and_jump_to_next_match},
	},
})

vim.keymap.set({"n", "x", "i"}, "<C-Up>", cursors.add_cursor_up)
vim.keymap.set({"n", "x", "i"}, "<C-Down>", cursors.add_cursor_down)
vim.keymap.set({"n", "x", "i"}, "<C-LeftMouse>", cursors.mouse_add_delete_cursor)
vim.keymap.set({"n", "x", "i"}, "<C-.>", add_cursors_to_matches)
vim.keymap.set({"n", "i"}, "<C-d>", add_cursor_and_jump_to_next_match)
vim.keymap.set({"n", "i"}, "<C-k>", jump_to_next_match)
vim.keymap.set("x", "<C-i>", cursors.add_cursors_to_visual_area)
