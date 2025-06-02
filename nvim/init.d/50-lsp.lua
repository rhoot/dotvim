-- requires nvim >= 0.11
if not vim.lsp.enable then
	return
end

local lsp_signature = require("lsp_signature")

local function toggle_inlay_hints()
	local clients = vim.lsp.get_clients({ bufnr=0 })

	if #clients == 0 or not clients[1]:supports_method("textDocument/inlayHint") then
		vim.notify("Inlay hints not supported in this buffer.", vim.log.levels.ERROR)
		return
	end

	local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr=0 })
	vim.lsp.inlay_hint.enable(not is_enabled, { bufnr=0 })
end

local function on_lsp_attach(client_id, bufnr)
	local client = vim.lsp.get_client_by_id(client_id)

	lsp_signature.on_attach({
		hint_enable = false,
		handler_opts = { border = "single" },
		toggle_key = "<C-S-Space>",
	}, bufnr)

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer=buf })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer=buf })

	-- the default diagnostic binds don't auto-open the diagnostic float
	vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count=-vim.v.count1, float=true }) end, { buffer=buf })
	vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count=vim.v.count1, float=true }) end, { buffer=buf })
	vim.keymap.set("n", "[D", function() vim.diagnostic.jump({ count=-math.huge, wrap=false, float=true }) end, { buffer=buf })
	vim.keymap.set("n", "]D", function() vim.diagnostic.jump({ count=math.huge, wrap=false, float=true }) end, { buffer=buf })

	-- enable completion side effects
	if client:supports_method("textDocument/completion") then
		vim.lsp.completion.enable(true, client.id, buf, { autotrigger=true })
		vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { buffer=buf })
	end

	-- enable inlay hints
	if client:supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true, { bufnr=buf })
	end

	-- enable idle symbol highlighting
	if client:supports_method("textDocument/documentHighlight") then
		local augroup = vim.api.nvim_create_augroup("lsp_highlight", { clear=false })
		vim.api.nvim_clear_autocmds({ buffer=bufnr, group=augroup })
		vim.api.nvim_create_autocmd({ "CursorHold" }, { group=augroup, buffer=buf, callback=vim.lsp.buf.document_highlight })
		vim.api.nvim_create_autocmd({ "CursorMoved" }, { group=augroup, buffer=buf, callback=vim.lsp.buf.clear_references })
	end
end

local function bind_cmp(key, cmp_input)
	vim.keymap.set("i", key, function()
		return vim.fn.pumvisible() == 1 and cmp_input or key
	end, { expr=true })
end

bind_cmp("<Up>", "<C-p>")
bind_cmp("<Down>", "<C-n>")
bind_cmp("<Esc>", "<C-e>")

vim.diagnostic.config({
	virtual_text = {},
})

vim.keymap.set("i", "<Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-y>"
	elseif vim.snippet.active({ direction=1 }) then
		return "<Cmd>lua vim.snippet.jump(1)<CR>"
	else
		return "<Tab>"
	end
end, { expr=1 })

vim.api.nvim_create_user_command(
	"LspHints",
	toggle_inlay_hints,
	{ desc = "Toggle LSP inline hints on or off for the current buffer" })

vim.api.nvim_create_autocmd(
	"LspAttach",
	{ callback=function(args) on_lsp_attach(args.data.client_id, args.bufnr) end })
