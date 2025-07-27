return {

	-- colorschemes
	{ "rebelot/kanagawa.nvim" },
	{ "widatama/vim-phoenix" },
	{ "L-Colombo/atlantic-dark.nvim" },
	{ "andreasvc/vim-256noir" },
	{ "dracula/vim" },
	{ "neanias/everforest-nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "ficcdaf/ashen.nvim" },
	{ "projekt0n/github-nvim-theme" },
	{ "sainnhe/sonokai" },
	{ "savq/melange-nvim" },
	{ "kepano/flexoki" },
	{ "jacoborus/tender.vim" },
	{ "bluz71/vim-moonfly-colors" },
	{ "Shatur/neovim-ayu" },
	{
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		-- config = function()
		--     vim.g.zenbones_darken_comments = 45
		--     vim.cmd.colorscheme('zenbones')
		-- end
	},
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('nordic').load()
		end
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
	},

	--{
	--	"rebelot/kanagawa.nvim",
	--	lazy = false,
	--	priority = 1000,
	--	config = function()
	--		vim.cmd([[colorscheme kanagawa-dragon]])
	--	end
	--}

}
