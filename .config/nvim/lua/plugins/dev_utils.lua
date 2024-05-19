return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = true,
		keys = {
			{ "<C-n>", "<cmd>Neotree toggle<CR>" },
		},
		config = {
			require = function()
				require("neo-tree").setup()
			end,
		},
	},
	{ "sindrets/diffview.nvim" },
}
