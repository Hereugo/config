return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				lua = { "stylua" },
				python = { "isort", "black" },
				sql = { "sqlfmt" },
				rust = { "rustfmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				go = { "gofmt" },
				php = { "pint", "php_cs_fixer" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
			formatters = {
				sqlfmt = {
					prepend_args = { "--fast" },
				},
				php_cs_fixer = {
					command = "php-cs-fixer",
					args = {
						"fix",
						"$FILENAME",
					},
					stdin = false,
					env = {
						PHP_CS_FIXER_IGNORE_ENV = "1",
					},
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
