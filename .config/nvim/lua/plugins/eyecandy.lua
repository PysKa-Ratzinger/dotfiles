return {
	-- notify
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				render = "compact",
				stages = "fade_in_slide_out",
				fps = 60,
				top_down = false,
			})

			vim.notify = require("notify")
		end
	},

	--[[
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		}
	},
	]]--
}

