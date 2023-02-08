if vim.fn.has("mac") ~= 0 then
	vim.o.guifont = "JetBrains Mono:h12"
else
	vim.o.guifont = "JetBrains Mono:h10"
end

vim.o.mouse = "nvi"
