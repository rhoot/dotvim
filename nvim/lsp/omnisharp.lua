return {
	cmd = { "omnisharp", "-z", "--hostPID", tostring(vim.fn.getpid()), "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" },
	filetypes = { "cs" },
	root_dir = function(bufnr, on_dir)
		local fpath = vim.api.nvim_buf_get_name(bufnr)
		for dir in vim.fs.parents(fpath) do
			for name, type in vim.fs.dir(dir) do
				if name:match("%.sln$")
					or name:match("%.csproj$")
					or name == "omnisharp.json"
					or name == ".git"
				then
					on_dir(dir)
					return
				end
			end
		end
	end,
	capabilities = {
		workspace = {
			workspaceFolders = false, -- https://github.com/OmniSharp/omnisharp-roslyn/issues/909
		},
	},
}
