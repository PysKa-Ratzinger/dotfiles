vim.cmd("set runtimepath^=~/.vim runtimepath+=~/.vim/after")
vim.o.packpath = vim.o.runtimepath
-- vim.cmd('source ~/.vimrc')

vim.g.mapleader = "<space>"
vim.g.maplocalleader = "<space>"

vim.opt.termguicolors = true

require("config.lazy")({
	debug = false,
	profiling = {
		loader = false,
		require = false,
	},
})

require("lazy").setup("plugins")

local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.clangd.setup({
	capabilities = lsp_capabilities,
	cmd = { "clangd", "--query-driver=/usr/bin/c++" },
})

require("mason").setup({})
require("mason-lspconfig").setup({})

local lspsaga = require("lspsaga")
lspsaga.setup({ -- defaults ...
	debug = false,
	use_saga_diagnostic_sign = true,
	-- diagnostic sign
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
	diagnostic_header_icon = "   ",
	-- code action title icon
	code_action_icon = " ",
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	finder_definition_icon = "  ",
	finder_reference_icon = "  ",
	max_preview_lines = 10,
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	code_action_keys = {
		quit = "q",
		exec = "<CR>",
	},
	rename_action_keys = {
		quit = "<C-c>",
		exec = "<CR>",
	},
	definition_preview_icon = "  ",
	border_style = "single",
	rename_prompt_prefix = "➤",
	rename_output_qflist = {
		enable = false,
		auto_open_qflist = false,
	},
	server_filetype_map = {},
	diagnostic_prefix_format = "%d. ",
	diagnostic_message_format = "%m %c",
	highlight_prefix = false,
})

require("diffview").setup()

--
-- COLORSCHEME CONFIG
--

vim.cmd([[colorscheme kanagawa-dragon]])

function SetPhoenixColorscheme()
	local day = os.date("%w")

	vim.cmd([[colorscheme phoenix]])

	if day == 1 then
		vim.cmd([[:PhoenixBlue]])
	elseif day == 2 then
		vim.cmd([[:PhoenixGreen]])
	elseif day == 3 then
		vim.cmd([[:PhoenixYellow]])
	elseif day == 4 then
		vim.cmd([[:PhoenixPurple]])
	elseif day == 5 then
		vim.cmd([[:PhoenixOrange]])
	else
		vim.cmd([[:PhoenixRed]])
	end
end

SetPhoenixColorscheme()

-- ===========================================================================
--
-- COMMANDS, MAPS, AND IMAPS

vim.api.nvim_create_user_command("Bclose", "bp|bd#", {})

local opts = { remap = false }
vim.keymap.set("", "<F5>", "<cmd>!make -j4<CR>", opts)
vim.keymap.set("", "<F6>", "<cmd>!make -j4 run<CR>", opts)

local opts = { remap = true }
vim.keymap.set("i", ";hash", '<C-R>=system("head -c 16 /dev/urandom \\| xxd -p")<CR><BS>', opts)
vim.keymap.set("i", ";guard", "<C-O>mz#ifndef %%%<CR>#define %%%<CR>#endif  // %%%<C-O>'z;;", opts)
vim.keymap.set("i", ";struct", "<C-O>mzstruct %%% {<CR>%%%<CR><BS><BS>};<C-O>'z;;", opts)
vim.keymap.set("i", ";main", "<C-O>mzint main (int argc, char* argv[]) {<CR>%%%<CR><BS><BS>}<C-O>'z;;", opts)
vim.keymap.set("i", ";wh", "<C-O>mzwhile (%%%) {<CR>%%%<CR><BS><BS>}<C-O>'z;;", opts)
vim.keymap.set("i", ";nm", "<C-O>mznamespace %%% {<CR><CR>} // namespace %%%<C-O>'z;;", opts)
vim.keymap.set("i", ";fo", "<C-O>mzfor (%%%; %%%; %%%) {<CR>%%%<CR><BS><BS>}<C-O>'z;;", opts)
vim.keymap.set("i", ";;", "<C-O>/%%%<CR><C-O>c3l", opts)
vim.keymap.set("n", ";;", "/%%%<CR>c3l", opts)

vim.keymap.set("", "<C-t><up>", "<cmd>:tabr<CR>", opts)
vim.keymap.set("", "<C-t><down>", "<cmd>:tabl<CR>", opts)
vim.keymap.set("", "<C-t><left>", "<cmd>:tabp<CR>", opts)
vim.keymap.set("", "<C-t><right>", "<cmd>:tabn<CR>", opts)

vim.keymap.set("", "<M-t>", "<cmd>:TranslateW<CR>", opts)

vim.cmd([[set number]])
vim.cmd([[set nornu]])

vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {})
vim.keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {})
vim.keymap.set("n", "<leader>gS", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {})
vim.keymap.set("n", "<leader>ge", "<cmd>lua vim.lsp.buf.references()<CR>", {})
vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {})
vim.keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {})
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {})
vim.keymap.set("n", "<leader>[g", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {})
vim.keymap.set("n", "<leader>]g", "<cmd>lua vim.diagnostic.goto_next()<CR>", {})
vim.keymap.set("n", "<leader>K", "<cmd>lua vim.lsp.buf.hover()<CR>", {})

require("lazyvim.util").lsp.on_attach(function(_, buffer)
	--- In lsp attach function
	local map = vim.api.nvim_buf_set_keymap
	map(0, "n", "gr", "<cmd>Lspsaga rename<cr>", { silent = true, noremap = true })
	map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", { silent = true, noremap = true })
	map(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", { silent = true, noremap = true })
	map(0, "n", "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true, noremap = true })
	map(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", { silent = true, noremap = true })
	map(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", { silent = true, noremap = true })
	map(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { silent = true, noremap = true })
	map(0, "n", "gd", "<cmd>Lspsaga peek_definition<cr>", { silent = true, noremap = true })
	map(0, "n", "gt", "<cmd>Lspsaga peek_type_definition<cr>", { silent = true, noremap = true })
end)
