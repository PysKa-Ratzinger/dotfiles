-- cppman
return {
	{
		'madskjeldgaard/cppman.nvim',
		dependencies = {
			{ 'MunifTanjim/nui.nvim' }
		},
		keys = {
			{ "<leader>c", group = "cppman", desc = "CPPMan", },
			{ "<leader>cm", function() require("cppman").open_cppman_for(vim.fn.expand("<cword>")) end, desc = "Open CPPman for word under cursor", },
			{ "<leader>cc", function() require("cppman").input() end, desc = "Search CPPMan", },
		},
		config = function()
			local cppman = require"cppman"
			cppman.setup()
		end
	}
}
