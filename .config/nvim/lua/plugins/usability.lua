return {
	{
		"preservim/nerdtree",
		lazy = false,
		keys = {
			{
				"<c-n>",
				function()
					if vim.bo.filetype == "nerdtree" then
						vim.cmd([[NERDTreeToggle]])
					else
						vim.cmd([[NERDTreeFind]])
					end
				end,
				desc = "NERD Tree Toggle",
			},
		},
	},

	{
		"akinsho/bufferline.nvim",
		lazy = false,
		opts = {
			options = {
			}
		},
	},

	{
		'nvim-lualine/lualine.nvim',
		lazy = false,
		opts = {},
	},

	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},

	-- notify
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				render = "compact",
				stages = "fade_in_slide_out",
				fps = 144,
				top_down = false,
			})

			vim.notify = require("notify")
		end
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			signs_staged = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
			},
		}
	},

	{
		"jiaoshijie/undotree",
		keys = {
			{
				"<leader>un",
				function() require("undotree").toggle() end,
				desc = "Undotree (toggle)"
			},
		},
		requires = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},

	{
		"gregorias/toggle.nvim",
		version = "2.0",
		config = function()
			require("toggle").setup({
				keymaps = {
					toggle_option_prefix = "<leader>y",
					status_dashboard = "ys"
				},
				-- The interface for registering keymaps.
				keymap_registry = require("toggle.keymap").keymap_registry(),
				-- See the default options section below.
				--- Whether to notify when a default option is set.
				notify_on_set_default_option = true,
			})
		end
	},
}
