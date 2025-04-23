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
				buffer_close_icon = "X",
				modified_icon = "!",
				close_icon = "X",
				left_trunk_marker = ">",
				right_trunk_marker = "<",
				indicator = {
					icon = "|", -- if "icon"
					style = "underline", -- "icon" | "underline" | "none"
				},
				color_icons = false,
				separator_style = { "|", "|" },
			}
		},
	},

	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},

	{
		"sindrets/diffview.nvim"
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

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		config = function()
			local highlight = {
				"Whitespace",
				"NonText",
				"Function",
				"Label",
			}
			require("ibl").setup({
				indent = {
					highlight = highlight,
					char = ".",
					tab_char = "│",
				},
				whitespace = {
					highlight = highlight,
					remove_blankline_trail = false,
				},
				scope = { enabled = true }
			})
		end
	},
}
