return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-keys)", },
			{ "<leader>l", function() vim.cmd([[Lazy]]) end, desc = "Lazy" },
			{ "<leader>m", function() vim.cmd([[Mason]]) end, desc = "Mason" },
			{ "<leader>u", group = "ui", desc = "UI" },
		}
	}
}

