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

	{
		'mikesmithgh/borderline.nvim',
		enabled = true,
		lazy = true,
		event = 'VeryLazy',
		config = function()
			local bl_borders = require("borderline.borders")
			require('borderline').setup({
				border = bl_borders.single
			})
		end,
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

