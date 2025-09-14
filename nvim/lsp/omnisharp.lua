local function find_parent_dir(path, pattern, is_pattern)
	for dir in vim.fs.parents(path) do
		if is_pattern then
			for name, type in vim.fs.dir(dir) do
				if name:match(pattern) then
					return dir
				end
			end
		else
			if vim.uv.fs_stat(dir.."/"..pattern) then
				return dir
			end
		end
	end
	return nil
end

return {
	cmd = { "omnisharp", "-z", "--hostPID", tostring(vim.fn.getpid()), "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" },
	filetypes = { "cs" },
	root_dir = function(bufnr, on_dir)
		local fpath = vim.api.nvim_buf_get_name(bufnr)
		local parent_dir = find_parent_dir(fpath, "omnisharp.json", false)
			or find_parent_dir(fpath, "%.sln$", true)
			or find_parent_dir(fpath, "%.csproj$", true)
			or find_parent_dir(fpath, ".git", false)
		if parent_dir then
			on_dir(parent_dir)
		end
	end,
	capabilities = {
		workspace = {
			workspaceFolders = false, -- https://github.com/OmniSharp/omnisharp-roslyn/issues/909
		},
	},
}
