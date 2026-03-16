return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		or "make",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"stevearc/dressing.nvim",
		"zbirenbaum/copilot.lua",
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = { insert_mode = true },
					use_absolute_path = true,
				},
			},
		},
	},
	---@module 'avante'
	---@type avante.Config
	opts = {
		provider = "copilot",
		providers = {
			copilot = {
				model = "gpt-4o",
				timeout = 60000,
				extra_request_body = {
					temperature = 0.75,
					max_tokens = 4096,
				},
			},
		},
	},
}
