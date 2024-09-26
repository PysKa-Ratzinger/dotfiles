-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")({
	debug = false,
	profiling = {
		loader = false,
		require = false,
	},
	"plugins",
})

function SetPhoenixColorscheme()
	local day = os.date("%w")

	vim.cmd([[colorscheme phoenix]])

	if day == "1" then
		vim.cmd([[:PhoenixBlue]])
	elseif day == "2" then
		vim.cmd([[:PhoenixGreen]])
	elseif day == "3" then
		vim.cmd([[:PhoenixYellow]])
	elseif day == "4" then
		vim.cmd([[:PhoenixPurple]])
	elseif day == "5" then
		vim.cmd([[:PhoenixOrange]])
	else
		vim.cmd([[:PhoenixRed]])
	end
	vim.cmd([[:hi Normal guibg=NONE ctermbg=NONE]])
end

-- SetPhoenixColorscheme()
-- vim.cmd([[colorscheme atlantic-dark]])
-- vim.cmd([[colorscheme 256_noir]])
-- vim.cmd([[colorscheme kanagawa-dragon]])
-- vim.cmd([[colorscheme kanagawa]])
-- vim.cmd([[colorscheme xresources]])
-- vim.cmd([[colorscheme ayu-dark]])
vim.cmd([[colorscheme terafox]])
vim.cmd([[:hi Normal guibg=NONE ctermbg=NONE]])

vim.cmd([[:hi DiagnosticError gui=bold]])
vim.cmd([[:hi DiagnosticInfo gui=bold]])
vim.cmd([[:hi! link FloatBorder DiagnosticInfo]])
vim.cmd([[:hi NormalFloat guibg=black]])

vim.cmd([[set mouse=]])
