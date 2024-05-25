return {
	-- colorschemes
	{ "rebelot/kanagawa.nvim" },
	{ "widatama/vim-phoenix" },

	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "kanagawa",
		},
	},

	-- change trouble config
	{
		"folke/trouble.nvim",
		opts = {
			use_diagnostic_signs = true,
		},
	},

	-- override nvim-cmp and add cmp-emoji
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })
		end,
	},

	-- add more treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
		},
	},

	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({})
		end,
	},

	{
		"nvimdev/lspsaga.nvim",
		init = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			keys[#keys + 1] = { "gpd", "<cmd>Lspsaga peek_definition<cr>" }
			keys[#keys + 1] = {
				"gpt",
				"<cmd>Lspsaga peek_type_definition<cr>",
			}
			keys[#keys + 1] = { "gd", "<cmd>Lspsaga goto_definition<cr>" }
			keys[#keys + 1] = {
				"gt",
				"<cmd>Lspsaga goto_type_definition<cr>",
			}
			keys[#keys + 1] = {
				"gj",
				"<cmd>Lspsaga diagnostic_jump_next<cr>",
			}
			keys[#keys + 1] = {
				"gk",
				"<cmd>Lspsaga diagnostic_jump_prev<cr>",
			}
			keys[#keys + 1] = { "rn", "<cmd>Lspsaga rename<cr>" }
			keys[#keys + 1] = { "gx", "<cmd>Lspsaga code_action<cr>" }
			keys[#keys + 1] = {
				"go",
				"<cmd>Lspsaga show_line_diagnostics<cr>",
			}
			keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<cr>" }
		end,
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		enabled = true,
	},

	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				bashls = {},
				clangd = {
					cmd = {
						"clangd",
						"--background-index",
						"--suggest-missing-includes",
						"--clang-tidy",
						"--cross-file-rename",
					},
					filetypes = {
						"c",
						"cpp",
						"objc",
						"objcpp",
						"h",
						"hpp",
					},
				},
				html = {},
				jsonls = {},
				solidity_ls = {},
				tsserver = {},
			},
		},
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		---@class MasonSettings
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
			},
			PATH = "append",
		},
	},
}
