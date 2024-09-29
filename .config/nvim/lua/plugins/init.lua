return {
	-- colorschemes
	{ "rebelot/kanagawa.nvim" },
	{ "widatama/vim-phoenix" },
	{ "L-Colombo/atlantic-dark.nvim" },
	{ "andreasvc/vim-256noir" },
	{ "dracula/vim" },
	{ "AbdelrahmanDwedar/awesome-nvim-colorschemes" },
	{ "EdenEast/nightfox.nvim" },

	-- syntax
	{ "tikhomirov/vim-glsl" },
	{ "jbyuki/venn.nvim" },

	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "atlantic-dark",
		},
	},

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			local logo = [[     ▄█ ███    █▄     ▄████████     ███      
    ███ ███    ███   ███    ███ ▀█████████▄  
    ███ ███    ███   ███    █▀     ▀███▀▀██  
    ███ ███    ███   ███            ███   ▀  
    ███ ███    ███ ▀███████████     ███      
    ███ ███    ███          ███     ███      
    ███ ███    ███    ▄█    ███     ███      
█▄ ▄███ ████████▀   ▄████████▀     ▄████▀    
▀▀▀▀▀▀                                       
 ▄████████  ▄██████▄  ████████▄     ▄████████
███    ███ ███    ███ ███   ▀███   ███    ███
███    █▀  ███    ███ ███    ███   ███    █▀ 
███        ███    ███ ███    ███  ▄███▄▄▄    
███        ███    ███ ███    ███ ▀▀███▀▀▀    
███    █▄  ███    ███ ███    ███   ███    █▄ 
███    ███ ███    ███ ███   ▄███   ███    ███
████████▀   ▀██████▀  ████████▀    ██████████

What are you waiting for?
]]

			require("dashboard").setup({
				theme = "hyper",
				config = {
					header = vim.split(logo, "\n"),
					shortcut = {
						{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = " Apps",
							group = "DiagnosticHint",
							action = "Telescope app",
							key = "a",
						},
						{
							desc = " dotfiles",
							group = "Number",
							action = "Telescope dotfiles",
							key = "d",
						},
						{
							desc = "Quit",
							group = "@property",
							action = "q",
							key = "q",
						},
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	{
		"martineausimon/nvim-xresources",
		lazy = false,
		priority = 1000,
		config = function()
			require("nvim-xresources").setup({
				xresources_path = os.getenv("HOME") .. "/.Xresources",
				auto_light = {
					enable = true,
					value = 0.5,
					exclude = {
						"light_green",
						"light_blue",
					},
				},
				contrast = 0.6,
				bold = false,
				palette_overrides = {
					green = "#3CB371",
				},
			})

			local C = require("nvim-xresources.colors")

			require("nvim-xresources").custom_highlight_groups({
				-- link to a existing group :
				pythonBuiltin = "PreProc",
				-- or define highlights :
				pythonFunction = { guifg = C.cyan, guibg = nil, gui = C.bold, guisp = nil }, -- use "bold" if you want to bypass bold true/false option
			})
			vim.cmd("colorscheme xresources")
		end,
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
				"rust",
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
		keys = {
			{
				"<leader>gs",
				function()
					vim.cmd("Lspsaga document_symbol")
				end,
			},
			{
				"<leader>gpd",
				function()
					vim.cmd("Lspsaga peek_definition")
				end,
			},
			{
				"<leader>gpt",
				function()
					vim.cmd("Lspsaga peek_type_definition")
				end,
			},
			{
				"<leader>gd",
				function()
					vim.cmd("Lspsaga goto_definition")
				end,
			},
			{
				"<leader>gt",
				function()
					vim.cmd("Lspsaga goto_type_definition")
				end,
			},
			{
				"<leader>gj",
				function()
					vim.cmd("Lspsaga diagnostic_jump_next")
				end,
			},
			{
				"<leader>gk",
				function()
					vim.cmd("Lspsaga diagnostic_jump_prev")
				end,
			},
			{
				"<leader>rn",
				function()
					vim.cmd("Lspsaga rename")
				end,
			},
			{
				"<leader>gx",
				function()
					vim.cmd("Lspsaga code_action")
				end,
			},
			{
				"<leader>go",
				function()
					vim.cmd("Lspsaga show_line_diagnostics")
				end,
			},
			{
				"<leader>k",
				function()
					vim.cmd("Lspsaga hover_doc")
				end,
			},
		},
		config = function()
			require("lspsaga").setup({
				lighbulb = {
					enable = false,
					virtual_text = false,
				},
				ui = {
					code_action = " ",
				},
			})
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
						"/usr/lib/llvm/18/bin/clangd",
						-- "clangd",
						"--background-index",
						"--query-driver=/usr/lib/llvm/*/bin/clang*,/usr/bin/gcc,/usr/bin/g++",
						"--clang-tidy",
						"--all-scopes-completion",
						"--completion-style=detailed",
						"--header-insertion-decorators",
						"--header-insertion=iwyu",
						"--pch-storage=memory",
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
				"codelldb",
			},
			PATH = "append",
		},
	},

	-- DAP
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		keys = {
			{ "<F6>", "<cmd>DapStepOut<CR>" },
			{ "<F7>", "<cmd>DapStepInto<CR>" },
			{ "<F8>", "<cmd>DapStepOver<CR>" },
			{ "<F9>", "<cmd>DapContinue<CR>" },
		},
	},
}
