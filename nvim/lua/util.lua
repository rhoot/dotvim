local m = {}

m.path = {}

function m.dirname(path)
	if vim.fn.has("win32") then
		return path:match("(.*)[/\\].*")
	else
		return path:match("(.*)/.*")
	end
end

function m.path.join(...)
	local path = ""
	local win = vim.fn.has("win32")
	local sep = win and "\\" or "/"

	local function is_sep(c)
		return c == "/" or (win and c == "\\")
	end

	for _, s in ipairs({...}) do
		if #path > 0 then
			if not is_sep(path:sub(-1)) then
				path = path..sep
			end
			if is_sep(s:sub(1, 1)) then
				s = s:sub(2)
			end
		end

		path = path..s
	end

	return path
end

function m.scriptdir()
	local path = debug.getinfo(2, "S").source:sub(2)
	return m.dirname(path)
end

function m.scriptpath()
	return debug.getinfo(2, "S").source:sub(2)
end

return m
