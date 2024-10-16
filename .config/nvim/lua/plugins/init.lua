return {
	-- Configure LazyVim to load everforest
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "everforest",
		},
	},

	-- colorschemes
	{ "rebelot/kanagawa.nvim" },
	{ "widatama/vim-phoenix" },
	{ "L-Colombo/atlantic-dark.nvim" },
	{ "andreasvc/vim-256noir" },
	{ "dracula/vim" },
	{ "neanias/everforest-nvim", lazy = false, priority = 1000 },
	{ "EdenEast/nightfox.nvim" },
	{ "folke/tokyonight.nvim", enabled = false },
	{ "projekt0n/github-nvim-theme" },

	-- notify
	{
		"rcarriga/nvim-notify",
		opts = {
			render = "compact",
			stages = "fade_in_slide_out",
			fps = 144,
		},
	},

	-- syntax
	{ "tikhomirov/vim-glsl" },
	{ "jbyuki/venn.nvim" },

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			local logo = [[

      .                             .x+=:.        s             ...                         ..                 
  .x88888x.                        z`    ^%      :8          xH88"`~ .x8X                 dF                   
 :8**888888X.  :>    x.    .          .   <k    .88        :8888   .f"8888Hf        u.   '88bu.                
 f    `888888x./   .@88k  z88u      .@8Ned8"   :888ooo    :8888>  X8L  ^""`   ...ue888b  '*88888bu        .u   
'       `*88888~  ~"8888 ^8888    .@^%8888"  -*8888888    X8888  X888h        888R Y888r   ^"*8888N    ud8888. 
 \.    .  `?)X.     8888  888R   x88:  `)8b.   8888       88888  !88888.      888R I888>  beWE "888L :888'8888.
  `~=-^   X88> ~    8888  888R   8888N=*8888   8888       88888   %88888      888R I888>  888E  888E d888 '88%"
         X8888  ~   8888  888R    %8"    R88   8888       88888 '> `8888>     888R I888>  888E  888E 8888.+"   
         488888     8888 ,888B .   @8Wou 9%   .8888Lu=    `8888L %  ?888   ! u8888cJ888   888E  888F 8888L     
 .xx.     88888X   "8888Y 8888"  .888888P`    ^%888*       `8888  `-*""   /   "*888*P"   .888N..888  '8888c. .+
'*8888.   '88888>   `Y"   'YP    `   ^"F        'Y"          "888.      :"      'Y"       `"888*""    "88888%  
  88888    '8888>                                              `""***~"`                     ""         "YP'   
  `8888>    `888                                                                                               
   "8888     8%                       What are you waiting for?                                                
    `"888x:-"                                                                                                  
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
						--[[
						{
							desc = " Apps",
							group = "DiagnosticHint",
							action = "Telescope app",
							key = "a",
						},
                                                --]]
						{
							desc = " dotfiles",
							group = "Number",
							action = 'require("telescope.builtin").find_files({cwd="~/dotfiles"})',
							key = "d",
						},
						{
							desc = "New buffer",
							action = "enew",
							key = "n",
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
			modes = {
				lsp = { -- Configure symbols mode
					win = {
						type = "split", -- split window
						relative = "win", -- relative to current window
						position = "right", -- right side
						size = 0.3, -- 30% of the window
					},
				},
				symbols = { -- Configure symbols mode
					win = {
						type = "split", -- split window
						relative = "win", -- relative to current window
						position = "right", -- right side
						size = 0.3, -- 30% of the window
					},
				},
			},
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
				finder = {
					methods = {
						tyd = "textDocument/typeDefinition",
					},
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
						"/usr/lib/llvm/19/bin/clangd",
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
				rust_analyzer = {},

				pylsp = {
					plugins = {
						-- formatter options
						black = { enabled = true },
						autopep8 = { enabled = false },
						yapf = { enabled = false },
						-- linter options
						pylint = { enabled = true, executable = "pylint" },
						pyflakes = { enabled = false },
						pycodestyle = { enabled = false },
						-- type checker
						pylsp_mypy = { enabled = true },
						-- auto-completion options
						jedi_completion = { fuzzy = true },
						-- import sorting
						pyls_isort = { enabled = true },
					},
				},
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
				"black",
				"codelldb",
				"rust-analyzer",
				"pyright",
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
