local pkg_mgr = require("pkg_mgr")

pkg_mgr.load("fzf-lua")
pkg_mgr.load("multiple-cursors.nvim")
pkg_mgr.load("nvim-treesitter")
pkg_mgr.load("nvim-web-devicons")
pkg_mgr.load("toggleterm.nvim")

pkg_mgr.load(
	"lsp_signature.nvim",
	{ requires_nvim=">=0.10" })

pkg_mgr.load(
	"nvim-lspconfig",
	{ requires_nvim=">=0.11" })
