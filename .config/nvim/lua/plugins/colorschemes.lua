return {

	-- colorschemes
	{ "rebelot/kanagawa.nvim" },
	{ "widatama/vim-phoenix" },
	{ "L-Colombo/atlantic-dark.nvim" },
	{ "andreasvc/vim-256noir" },
	{ "dracula/vim" },
	{ "neanias/everforest-nvim" },
	{ "EdenEast/nightfox.nvim" },

	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme github_dark_high_contrast]])
		end
	}

}

