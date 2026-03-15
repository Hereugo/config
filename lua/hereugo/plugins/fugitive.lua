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

		-- Map <leader>gc to perform a Git commit and interact with the Avante API
		vim.keymap.set("n", "<leader>gc", function()
			-- Trigger the Git commit command
			vim.cmd("Git commit")

			-- After a short delay, open a vertical split and interact with the Avante API
			vim.defer_fn(function()
				vim.cmd("vsplit")
				-- Use the Avante API to ask a question related to the commit
				require("avante.api").ask({
					without_selection = true, -- No selection required
					question = "/commit",    -- Specify the commit-related question
				})
			end, 100) -- Delay of 100ms before executing the function
		end)
	end,
}
