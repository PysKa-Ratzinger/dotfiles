return {
	-- notify
	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#000000",
			render = "compact",
			stages = "fade_in_slide_out",
			fps = 144,
		},
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

