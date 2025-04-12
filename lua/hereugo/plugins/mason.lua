return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"pyright",
				"clangd",
				"html",
				"cssls",
				"eslint",
				"gopls",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettierd",
				"prettier",
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
				"sqlls",
				"sqlfmt",
				"rustfmt",
			},
		})
	end,
}
