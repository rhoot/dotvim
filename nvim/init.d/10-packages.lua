local pkg_mgr = require("pkg_mgr")

pkg_mgr.load("cmp-nvim-lsp")
pkg_mgr.load("fzf-lua")
pkg_mgr.load("nvim-cmp")
pkg_mgr.load("nvim-treesitter")
pkg_mgr.load("nvim-web-devicons")
pkg_mgr.load("toggleterm.nvim")

pkg_mgr.load(
	"cmp-nvim-lsp-signature-help",
	{ dependencies={ "cmp-nvim-lsp", "nvim-cmp" } })

pkg_mgr.load(
	"nvim-lspconfig",
	{ requires_nvim=">=0.11" })

pkg_mgr.load(
	"nvim-snippy",
	{ requires_nvim="<0.10" })
