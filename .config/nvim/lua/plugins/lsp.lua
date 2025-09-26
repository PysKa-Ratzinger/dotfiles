return {
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({})
		end,
	},

	{
		"nvimdev/lspsaga.nvim",
		lazy = false,
		dependencies = {
			"folke/which-key.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{ "<leader>g",   group = "lsp",                                           desc = "LSP", },
			{ "<leader>gf",  function() vim.lsp.buf.format() end,                     desc = "Format code", },
			{ "<leader>gF",  function() vim.cmd("Lspsaga finder") end,                desc = "Find references and implementations", },
			{ "<leader>gs",  function() vim.cmd("Lspsaga document_symbol") end,       desc = "Document Symbol", },
			{ "<leader>gpd", function() vim.cmd("Lspsaga peek_definition") end,       desc = "Peek Definition", },
			{ "<leader>gpt", function() vim.cmd("Lspsaga peek_type_definition") end,  desc = "Peek Type Definition", },
			{ "<leader>gd",  function() vim.cmd("Lspsaga goto_definition") end,       desc = "Goto Definition", },
			{ "<leader>gD",  vim.lsp.buf.declaration,                                 desc = "Goto Declaration", },
			{ "<leader>gt",  function() vim.cmd("Lspsaga goto_type_definition") end,  desc = "Goto Type Definition", },
			{ "<leader>gj",  function() vim.cmd("Lspsaga diagnostic_jump_next") end,  desc = "Jump Next Diagnostic", },
			{ "<leader>gk",  function() vim.cmd("Lspsaga diagnostic_jump_prev") end,  desc = "Jump Previous Diagnostic", },
			{ "<leader>gr",  function() vim.cmd("Lspsaga rename") end,                desc = "Rename", },
			{ "<leader>gx",  function() vim.cmd("Lspsaga code_action") end,           desc = "Code Action", },
			{ "<leader>go",  function() vim.cmd("Lspsaga show_line_diagnostics") end, desc = "Show line diagnostics", },
			{ "<leader>gh",  function() vim.cmd("LspClangdSwitchSourceHeader") end,   desc = "Switch source/header", },
			{ "<leader>gi",  function() vim.cmd("Lspsaga incoming_calls") end,        desc = "Show incoming calls", },
			{ "<leader>gu",  function() vim.cmd("Lspsaga outgoing_calls") end,        desc = "Show outgoing calls", },
			{ "<leader>gl",  function() vim.cmd("Trouble symbols") end,               desc = "Show outline", },
			{ "<leader>k",   function() vim.cmd("Lspsaga hover_doc") end,             desc = "Hover doc", },
		},
		config = function()
			require("lspsaga").setup({
				callhierarchy = {
					layout = "normal",
				},
				outline = {
					win_width = 60,
					detail = true,
					layout = "float",
				},
				implement = {
					enable = true,
				},
				symbol_in_winbar = {
					enable = true,
				},
				lighbulb = {
					enable = false,
					virtual_text = false,
				},
				ui = {
					code_action = " ",
				},
				finder = {
					layout = "normal",
					methods = {
						tyd = "textDocument/typeDefinition",
					},
				},
			})
		end,
		enabled = true,
	},

	{
		"hrsh7th/cmp-nvim-lsp",
		opts = {},
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert {
					['<C-d>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete {},
					['<CR>'] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					},
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),
				},
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				},
			})
		end
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"jubnzv/virtual-types.nvim",
		},
		---@class PluginLspOpts
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			vim.lsp.config('bashls', {})
			vim.lsp.enable('bashls')
			vim.lsp.config('pyright', {})
			vim.lsp.enable('pyright')
			vim.lsp.config('clangd', {
				capabilities = capabilities,
				cmd = {
					"/usr/lib/llvm/22/bin/clangd",
					-- "clangd",
					"--background-index",
					"--cross-file-rename",
					"--pretty",
					-- "--query-driver=/usr/lib/llvm/*/bin/clang*,/usr/bin/gcc,/usr/bin/g++",
					"--clang-tidy",
					-- "--malloc-trim",
					"--all-scopes-completion",
					"--completion-style=detailed",
					"--header-insertion-decorators",
					"--header-insertion=iwyu",
					"--pch-storage=memory",
				},
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					clangdFileStatus = true,
				},
				filetypes = {
					"c",
					"cpp",
					"objc",
					"objcpp",
					"h",
					"hpp",
				},
				inlay_hints = {
					enable = true,
				},
			})
			vim.lsp.enable('clangd')
			vim.lsp.config('html', {
				settings = {
					html = { format = { wrapLineLength = '200' } }
				}
			})
			vim.lsp.enable('html')
			vim.lsp.config('jsonls', {})
			vim.lsp.enable('jsonls')
			vim.lsp.config('solidity_ls', {})
			vim.lsp.enable('solidity_ls')
			vim.lsp.config('ts_ls', {})
			vim.lsp.enable('ts_ls')
			vim.lsp.config('rust_analyzer', {})
			vim.lsp.enable('rust_analyzer')
			vim.lsp.config('cssls', {})
			vim.lsp.enable('cssls')
			vim.lsp.config('css_variables', {})
			vim.lsp.enable('css_variables')

			vim.lsp.config('lua_ls', {
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' }
						}
					}
				}
			})
			vim.lsp.enable('lua_ls')

			vim.lsp.config('pylsp', {
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
			})
			vim.lsp.enable('pylsp')
		end
	},

	{
		"MysticalDevil/inlay-hints.nvim",
		event = "LspAttach",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("inlay-hints").setup()

			-- This snippet happens in the context of an LSP attach event after checking
			-- that the language server supports inlay hints.
			local bufnr = … -- the current buffer
			local toggle = require "toggle"
			toggle.register(
				"i",
				-- Disables or enables inlay hints for the current buffer.
				toggle.option.NotifyOnSetOption(toggle.option.OnOffOption({
					name = "inlay hints",
					get_state = function()
						return vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
					end,
					set_state = function(new_value)
						vim.lsp.inlay_hint.enable(new_value, { bufnr = bufnr })
					end,
				})),
				{ buffer = bufnr }
			)
		end
	},

	{
		"williamboman/mason.nvim",
		---@class MasonSettings
		opts = {
			PATH = "append",
		},
		keys = {
			{
				"<leader>cL",
				function() vim.cmd([[LspInfo]]) end,
				desc = "LSP Info"
			},
			{
				"<leader>cL",
				function() vim.cmd([[LspInfo]]) end,
				desc = "LSP Info"
			},
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				'gopls',
				'lua_ls'
			}
		},
	},

	--[[
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {},
	},
	--]]

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				'bash-language-server',
				'typescript-language-server',
				'editorconfig-checker',
				'gofumpt',
				'golines',
				'gomodifytags',
				'gopls',
				'gotests',
				'impl',
				'json-to-struct',
				'luacheck',
				'misspell',
				'revive',
				'shellcheck',
				'shfmt',
				'staticcheck',
				'stylua',
				'vim-language-server',
				'vint',
			},
			auto_update = true,
			run_on_start = true,
			start_delay = 3000,
			debounce_hours = 5, -- at least 5 hours between attempts to install/update

			-- By default all integrations are enabled. If you turn on an integration
			-- and you have the required module(s) installed this means you can use
			-- alternative names, supplied by the modules, for the thing that you want
			-- to install. If you turn off the integration (by setting it to false) you
			-- cannot use these alternative names. It also suppresses loading of those
			-- module(s) (assuming any are installed) which is sometimes wanted when
			-- doing lazy loading.
			integrations = {
				['mason-lspconfig'] = false,
				['mason-null-ls'] = true,
				['mason-nvim-dap'] = true,
			},
		}
	},

	-- DAP
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
			}

			dap.adapters.lldb = {
				type = "executable",
				command = "codelldb",
				name = "lldb"
			}

			local args_askinput = function()
				local args_string = vim.fn.input("Input arguments: ");
				return vim.split(args_string, " ");
			end

			local program_askinput = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end

			local check_file_exists = function(name)
				local f = io.open(name, "r")
				if f ~= nil then
					io.close(f)
					return true
				else
					return false
				end
			end

			local cwd = vim.loop.cwd()
			local lldb_init_file = nil
			if check_file_exists(cwd .. "/lldb_commands.lldb") then
				lldb_init_file = cwd .. "/lldb_commands.lldb"
			end

			local initCommands = {}

			if lldb_init_file ~= nil then
				initCommands = {
					([[command source '%s']]):format(lldb_init_file),
				}
			end

			local launch_with_args_type = function(type)
				res = {
					name = "Launch (with args) (" .. type .. ")",
					type = type,
					request = "launch",
					args = args_askinput,
					program = program_askinput,
					cwd = "${workspaceFolder}",
					stopAtBeginningOfMainSubprogram = false,
					initCommands = initCommands,
				}
				return res
			end

			local gdb_configs = {
				launch_with_args_type("gdb"),
				launch_with_args_type("lldb"),
				{
					name = "Select and attach to process",
					type = "lldb",
					request = "attach",
					program = program_askinput,
					pid = function()
						local name = vim.fn.input('Executable name (filter): ')
						return require("dap.utils").pick_process({ filter = name })
					end,
					cwd = '${workspaceFolder}',
					initCommands = initCommands,
				},
				{
					name = 'Attach to gdbserver :1234',
					type = 'lldb',
					request = 'attach',
					target = 'localhost:1234',
					program = program_askinput,
					cwd = '${workspaceFolder}',
					initCommands = initCommands,
				},
			}

			dap.configurations.c = gdb_configs
			dap.configurations.cpp = gdb_configs
			dap.configurations.rust = gdb_configs
		end
	},

	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		},
		keys = {
			{ "<F6>",        "<cmd>DapStepOut<CR>" },
			{ "<F7>",        "<cmd>DapStepInto<CR>" },
			{ "<F8>",        "<cmd>DapStepOver<CR>" },
			{ "<F9>",        "<cmd>DapContinue<CR>" },
			{ "<leader>d",   group = "dap",                                 desc = "DAP" },
			{ "<leader>dt",  function() vim.cmd("DapTerminate") end,        desc = "Terminate DAP Session" },
			{ "<leader>du",  function() require("dapui").toggle() end,      desc = "Toggle UI" },
			{ "<leader>dn",  function() vim.cmd("DapNew") end,              desc = "New DAP Session" },
			{ "<leader>db",  function() vim.cmd("DapToggleBreakpoint") end, desc = "Toggle Breakpoint" },
			{ "<leader>de",  function() require("dapui").eval() end,        desc = "DAP Eval" },
			{ "<leader>dsp", function() require("dap").up() end,            desc = "DAP Stack Up" },
			{ "<leader>dsn", function() require("dap").down() end,          desc = "DAP Stack Down" },
		},
		opts = {
			element_mappings = {
				stacks = {
					open = "<CR>",
					expand = "o",
				}
			}
		},
	},

	{
		"folke/neodev.nvim",
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true }
			})
		end
	},

	{
		'Julian/lean.nvim',
		event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

		dependencies = {
			'neovim/nvim-lspconfig',
			'nvim-lua/plenary.nvim',
			-- you also will likely want nvim-cmp or some completion engine
		},

		-- see details below for full configuration options
		opts = {
			lsp = {},
			mappings = true,
		}
	},

}
