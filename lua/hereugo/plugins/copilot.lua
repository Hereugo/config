return {
	"zbirenbaum/copilot.lua",
	lazy = false,
	cmd = "Copilot",
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
}
