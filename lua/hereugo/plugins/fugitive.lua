return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", ":Git<CR>", { noremap = true, desc = "git status" })
		vim.keymap.set("n", "<leader>ga", ":Git add ", { noremap = true, desc = "git add " })
		vim.keymap.set("n", "<leader>gA", ":Git add .<CR>", { noremap = true, desc = "git add ." })
		vim.keymap.set("n", "<leader>gp", ":Git push --quiet<CR>", { noremap = true, desc = "git push" })
		vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { noremap = true, desc = "git diff" })
		vim.keymap.set("n", "<leader>gl", ":silent! GlLog<CR>", { noremap = true, desc = "git log" })
		vim.keymap.set("n", "<leader>gb", ":Git branch<Space>", { noremap = true, desc = "git branch" })
		vim.keymap.set("n", "<leader>go", ":Git checkout<Space>", { noremap = true, desc = "git checkout" })

		vim.keymap.set("n", "<leader>gc", function()
			local Job = require("plenary.job")

			-- Use staged diff if available; that's usually what a commit message should describe
			Job:new({
				command = "git",
				args = { "diff", "--cached", "--stat" },
				on_exit = function(j)
					local diff_summary = table.concat(j:result(), "\n")

					if diff_summary == "" then
						vim.schedule(function()
							vim.notify("No staged changes found. Stage changes first.", vim.log.levels.WARN)
						end)
						return
					end

					vim.schedule(function()
						require("avante.api").ask({
							without_selection = true,
							prompt = table.concat({
								"Write a concise git commit message for these staged changes.",
								"Use imperative mood.",
								"Return only the commit subject line, no quotes, no code block.",
								"",
								diff_summary,
							}, "\n"),
						})

						-- You may need to manually paste/copy from Avante if your installed version
						-- does not expose a programmatic text-return callback.
					end)
				end,
			}):start()
		end, { noremap = true, desc = "generate commit message with Avante" })
	end,
}
