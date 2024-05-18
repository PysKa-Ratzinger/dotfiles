return {
	-- colorschemes
	"rebelot/kanagawa.nvim",
	"widatama/vim-phoenix",

	-- QoL
	{
		"famiu/feline.nvim",
		config = {
			require = function()
				require("feline").setup()
			end,
		},
	},
	{ "ryanoasis/vim-devicons", lazy = true },
	"mhinz/vim-startify",

	-- Misc tools
	"voldikss/vim-translator",
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- Dev Utils
	"tikhomirov/vim-glsl",
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
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
	"sindrets/diffview.nvim",
	"vim-scripts/DoxygenToolkit.vim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = {
			require = function()
				require("nvim-treesitter.configs").setup({
					-- A list of parser names, or "all"
					-- (the five listed parsers should always be installed)
					ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

					-- Install parsers synchronously
					-- (only applied to `ensure_installed`)
					sync_install = false,

					-- Automatically install missing parsers when entering buffer
					-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
					auto_install = true,

					-- List of parsers to ignore installing (or "all")
					ignore_install = { "javascript" },

					---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
					-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

					highlight = {
						enable = true,

						-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
						-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
						-- the name of the parser)
						-- list of language that will be disabled
						disable = { "c", "rust" },
						-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
						disable = function(lang, buf)
							local max_filesize = 100 * 1024 -- 100 KB
							local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
							if ok and stats and stats.size > max_filesize then
								return true
							end
						end,

						-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
						-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
						-- Using this option may slow down your editor, and you may see some duplicate highlights.
						-- Instead of true it can also be a list of languages
						additional_vim_regex_highlighting = false,
					},
				})
			end,
		},
	},
	"mbbill/undotree",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
