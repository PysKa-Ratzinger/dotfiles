return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "±" },
				delete = { text = "-" },
				topdelete = { text = "-" },
				changedelete = { text = "±" },
				untracked = { text = "u" },
			},
			signs_staged = {
				add = { text = "+" },
				change = { text = "±" },
				delete = { text = "-" },
				topdelete = { text = "-" },
				changedelete = { text = "±" },
			},
		}
	},

	{
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			require('blame').setup {}
		end,
	},
}
