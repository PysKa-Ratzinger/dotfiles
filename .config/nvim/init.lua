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
end

SetPhoenixColorscheme()
