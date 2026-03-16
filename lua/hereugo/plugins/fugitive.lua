return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", ":Git<CR>", { noremap = true, desc = "git status" })
		vim.keymap.set("n", "<leader>ga", ":Git add ", { noremap = true, desc = "git add " })
		vim.keymap.set("n", "<leader>gA", ":Git add .<CR>", { noremap = true, desc = "git add ." })
		vim.keymap.set("n", "<leader>gp", ":Git push <CR>", { noremap = true, desc = "git push" })
		vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { noremap = true, desc = "git diff" })
		vim.keymap.set("n", "<leader>gl", ":silent! GlLog<CR>", { noremap = true, desc = "git log" })
		vim.keymap.set("n", "<leader>gb", ":Git branch<Space>", { noremap = true, desc = "git branch" })
		vim.keymap.set("n", "<leader>go", ":Git checkout<Space>", { noremap = true, desc = "git checkout" })

		-- Testing
		vim.keymap.set("n", "<leader>gc", function()
			local Job = require("plenary.job")

			Job
				:new({
					command = "git",
					args = { "diff", "--cached", "--quiet" },
					on_exit = function(_, return_val)
						vim.schedule(function()
							if return_val == 0 then
								vim.notify("No staged changes to commit.", vim.log.levels.WARN)
								return
							elseif return_val ~= 1 then
								vim.notify("Failed to check staged changes.", vim.log.levels.ERROR)
								return
							end

							vim.cmd("Git commit")

							vim.defer_fn(function()
								require("avante.api").ask({
									new_chat = true,
									without_selection = true,
									question = "Write a concise git commit message for the staged changes. Return only the subject line and list of details if subject line can't capture everything.",
								})
							end, 100)
						end)
					end,
				})
				:start()
		end, { noremap = true, desc = "commit with Avante assist" })
	end,
}
