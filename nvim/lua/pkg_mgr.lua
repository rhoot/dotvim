local pkg_mgr = {}

local packages = {}

function pkg_mgr.define(name, opts)
	opts = opts or {}
	packages[name] = opts
end

function pkg_mgr.is_loaded(name)
	local pkg = packages[name]
	return pkg and pkg.loaded or false
end

function pkg_mgr.load(name, opts)
	opts = opts or {}

	if not packages[name] then
		packages[name] = opts
	end

	if opts.requires_nvim then
		local range = vim.version.range(opts.requires_nvim)
		if not range:has(vim.version()) then
			return false
		end
	end

	if opts.dependencies then
		for _, dep in ipairs(opts.dependencies) do
			local dep_opts = packages[dep]
			if not dep_opts then
				vim.notify("Package "..dep.." is not defined, but is required by "..name, vim.log.levels.ERROR)
				return false
			end
			if not pkg_mgr.load(dep, dep_opts) then
				return false
			end
		end
	end

	if not opts.loaded then
		opts.loaded = true
		vim.cmd("packadd! "..name)
	end

	return true
end

return pkg_mgr
