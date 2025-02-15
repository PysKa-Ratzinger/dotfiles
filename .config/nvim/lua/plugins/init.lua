return {
	-- syntax
	{ "tikhomirov/vim-glsl" },
	{ "jbyuki/venn.nvim" },

	{
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		lazy = false,
		keys = {
			{ "<leader>f",  group = "finders",                                         desc = "Find..." },
			{ "<leader>ff", function() require("telescope.builtin").find_files() end,  desc = "Search files", },
			{ "<leader>/",  function() require("telescope.builtin").live_grep() end,   desc = "Live grep", },
			{ "<leader>fb", function() require("telescope.builtin").buffers() end,     desc = "Search buffers", },
			{ "<leader>fh", function() require("telescope.builtin").help_tags() end,   desc = "Search help tags", },
			{ "<leader>fr", function() require("telescope.builtin").resume() end,   desc = "Search help tags", },
			{ "<leader>uC", function() require("telescope.builtin").colorscheme() end, desc = "Live colorscheme preview", },

		},
		opts = {
			defaults = {
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
					},
					width = 0.87,
					height = 0.86
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true
				}
			},
		}
	},

	{
		"goolord/alpha-nvim",
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

			local logo2 = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡳⣝⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⡀⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⡀⡀⠀⠀⠀⡀⣤⣲⢮⣗⢷⣻⣺⣺⣲⣔⢄⠀⠀⠀⢀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⢔⢕⢕⠕⠀⣄⡮⣯⢗⠝⠑⠈⠈⠀⠁⠑⠓⢽⢽⣳⣢⠀⠊⡎⡎⡖⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢠⢸⢸⠸⠘⠀⠀⡮⡾⣝⠇⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣞⢷⢽⡀⠀⠑⢱⢱⢱⢠⠀⠀⠀⠀
⠀⢀⢜⢜⠌⠂⠀⠀⠀⡮⡿⣽⠁⠀⠀⠀⢠⣒⡮⣮⣲⣀⠀⠀⠀⠈⡯⣟⡾⡀⠀⠀⠈⠸⡸⡨⣂⠀⠀
⢀⢇⢇⠇⠀⠀⠀⠀⠀⡿⣽⡳⠀⠀⠀⠰⡵⣳⢯⣗⣗⢷⡅⠀⠀⠀⢸⣗⣟⡆⠀⠀⠀⠀⠈⡎⡎⡆⠀
⠐⡕⡕⡅⠀⠀⠀⠀⠀⡿⣵⣻⠀⠀⠀⠘⢮⢯⣗⢷⣝⣗⠇⠀⠀⠀⣸⣺⣞⠆⠀⠀⠀⠀⢀⢎⢎⠆⠀
⠀⠑⢕⢕⠥⡀⠀⠀⠀⢫⢷⣳⣄⠀⠀⠀⠈⠳⡹⡓⠗⠁⠀⠀⠀⢀⣗⡷⡽⠀⠀⠀⠀⡠⡕⡕⠝⠀⠀
⠀⠀⠀⠑⠕⡕⡕⡄⡀⠀⠯⣗⣷⣢⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣐⣗⡷⡻⠀⢀⢀⢆⢇⢇⠇⠁⠀⠀⠀
⠀⠀⢤⢦⡀⠑⠱⡱⡱⡰⠀⠑⢳⢽⣳⢵⣠⢀⠀⠀⢀⡠⣲⣺⢮⠷⠙⠀⢐⢜⢜⠜⠌⢀⢴⢔⡀⠀⠀
⠀⠀⠙⠕⠁⠀⠀⠀⠁⠁⠀⠀⠀⠘⠪⡻⣞⡷⠀⠀⢰⣻⣳⠝⠈⠀⠀⠀⠀⠁⠁⠀⠀⠀⠋⠓⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣳⣻⠀⠀⢸⣳⡳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣺⢵⠀⠀⢸⣺⣝⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢐⣞⣖⣀⠀⠀⠀⠀⡸⣺⠽⠀⠀⢸⣺⣺⠀⠀⠀⠀⢀⣢⣗⡆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠘⢺⡳⣳⢵⢴⣕⢯⡓⠁⠀⠀⠀⠚⡾⣝⡦⣦⣳⢽⡚⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠑⠑⠈⠀⠀⠀⠀⠀⠀⠀⠀⠐⠉⠂⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]]

			local logo3 = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣴⣶⣦⣤⣤⣤⣶⡦⡠⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣀⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⣀⣰⡆⠀⠀⠀⠀⠀⠀⠀⢸⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢴⣿⣿⣿⣿⣿⣿⣏⣻⣿⣿⣿⢀⡌⡔⠀⠐⣠⠀⠀⢀⠀⠀⠀⠀⢸⣿⣷⣂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢠⠔⣥⣿⣿⣿⣿⣿⠿⣿⣿⣿⡯⡿⡾⣿⠃⠀⡀⠂⡀⠀⢊⠀⠀⠀⠀⢸⣿⣿⣷⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢰⣽⣿⣿⣿⣼⣯⠭⠬⠉⠁⠁⠃⠃⠉⠀⢈⡭⠉⠉⠚⢺⠔⣠⡤⣠⣼⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠘⠹⣿⣿⡏⠉⢀⡤⣬⢔⠄⠀⠀⠀⠀⠀⠚⠐⣨⣿⢈⢶⠀⠘⣾⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠻⢻⣇⠀⠪⠸⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⢃⡾⣛⡀⠁⠀⢻⡿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢛⡀⠀⠓⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡬⠊⢻⡛⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠸⠃⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠇⣸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠨⣳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣬⣁⣴⣿⡯⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣺⣾⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣯⣿⡗⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣠⣽⣿⣿⣿⣿⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢰⣿⣿⣿⡿⠁⣿⣿⣿⣦⣀⠀⠀⠀⠀⢀⣀⣤⣶⣿⣿⣿⣿⣿⣿⢿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢠⣿⣿⢿⡏⠀⠘⢻⣿⣿⣿⣿⣿⣶⣴⣾⣿⣿⣿⣿⣿⣿⣿⠟⠟⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣾⣿⡏⡏⠀⠀⠀⠈⠀⠀⠉⠛⠛⠻⣿⣿⣿⡟⠋⠙⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠋⠁⠀⢠⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠘⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠘⠿⣿⣿⣿⣷⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⢀⠠⠂⠀⠁⠐⠋⠂⠀⠀⠀⠀⠀⠁⠀⠀⠀⠉⠁⠈⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]]

			local logo4 = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⣶⣶⣶⣿⣿⣿⣶⣶⣶⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠉⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⠇⠀⠀⢸⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠸⠀⠀⠀⠸⢸⣿⣿⡟⢸⣿⣿⣿⠻⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⠽⠛⠚⠺⠦⡤⡀⠀⠀⠀⠁⠀⡡⠤⡭⠾⠟⠠⠿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⡇⡴⠫⢥⣢⡕⠓⠇⠀⠀⠀⠀⠀⠒⠕⢅⣤⣜⢲⡀⠉⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⠁⢁⣊⣿⠿⠆⠀⠀⠀⠀⠀⠀⠀⠀⢤⠻⣿⠟⡒⠉⠀⢿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢹⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣽⣻⣿⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠘⣿⡟⡟⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⣶⣣⣿⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢿⣇⠂⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠸⢻⣿⣶⣷⡀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠸⠻⣿⣿⣿⣿⣶⡄⡀⠀⠀⠀⠀⠀⠀⠀⢀⢤⣶⣿⣿⣿⣿⣿⡟⠃⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⢻⣿⣿⣿⡇⠀⠁⠐⠀⠀⠐⠂⠈⠀⢸⠿⣿⣿⢿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⢀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡀⣴⣿⠃⠀⠀⠀⢀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡏⠀⢲⣦⡄⠀⠀⠀⠀⠀⠀⠀
⠀⡀⠀⠀⠈⠀⠀⢹⣿⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠁⡠⠀⠀⠀⢸⡿⠀⠀⢸⣿⡇⠉⠀⠂⠀⠄⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⡿⠁⠀⠀⢸⣿⠇⠀⠀⠀⠀⠀⠀⠄
⠀⠀⠀⠀⠀⠀⠀⠸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠁⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀
]]

			local logo5 = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⣄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣤⣴⣶⣶⣶⣶⣶⣦⣤⡄⠊⠀⠀⠀⠀⠀
⠀⠦⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀
⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀
⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀
⣠⣿⣿⣿⡿⢻⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⡧⠀
⠉⢹⣿⣿⢓⣺⡿⠟⠛⠛⢻⣿⣼⣿⣿⣿⣿⣿⣿⣿⣇⠀
⠀⢸⣿⣿⠉⠀⠀⠀⠀⠀⠀⠀⠈⢀⣿⡿⠿⢿⣿⣿⣿⠀
⡀⠈⣿⣿⡀⠀⠀⠠⠄⠀⠀⠀⠀⢸⣿⣗⠏⢪⣿⣿⣿⡇
⠀⢀⡈⣿⣷⣤⣄⣀⠀⠀⠀⢀⣤⣿⣿⣷⣾⣿⣿⣿⣿⣧
⠀⠘⠉⢹⣿⣿⣿⣿⣿⡇⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠀⠀⣾⣿⣿⠟⡿⠟⡁⠄⠚⠉⠀⠘⢿⣿⣿⣿⣿⣿⡇
⠀⠀⠀⣿⠟⠁⠈⠉⠁⠀⠀⠀⠀⠀⠀⠀⠙⡿⠿⠏⠿⠃
⠀⠀⠀⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄
]]

			local logo6 = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣶⠿⠿⠿⣶⣦⣀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠛⠉⠀⠀⠀⠀⠀⠀⠉⠻⣧⡀⠀
⢠⣄⣀⣀⣀⣀⣀⣀⣀⣴⠋⠀⠀⠀⠀⠀⣴⣆⠀⠀⠀⠀⠘⣿⡀
⠀⠙⠻⣿⣟⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀⠘⠿⠋⠀⠀⠀⠀⠀⣿⡇
⠀⠀⠀⠀⠙⢷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡇
⠀⠀⠀⠀⠀⠀⠘⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⠃
⠀⠀⠀⠀⠀⠀⢰⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀
⠀⠀⠀⠀⠀⠀⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡿⠀
⠀⠀⠀⠀⠀⢸⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃⠀
⠀⠀⠀⠀⢀⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀
⠀⠀⠀⠀⣾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠇⠀⠀
]]

			local logo7 = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀
⢸⠉⣹⠋⠉⢉⡟⢩⢋⠋⣽⡻⠭⢽⢉⠯⠭⠭⠭⢽⡍⢹⡍⠙⣯⠉⠉⠉⠉⠉⣿⢫⠉⠉⠉⢉⡟⠉⢿⢹⠉⢉⣉⢿⡝⡉⢩⢿⣻⢍⠉⠉⠩⢹⣟⡏⠉⠹⡉⢻⡍⡇
⢸⢠⢹⠀⠀⢸⠁⣼⠀⣼⡝⠀⠀⢸⠘⠀⠀⠀⠀⠈⢿⠀⡟⡄⠹⣣⠀⠀⠐⠀⢸⡘⡄⣤⠀⡼⠁⠀⢺⡘⠉⠀⠀⠀⠫⣪⣌⡌⢳⡻⣦⠀⠀⢃⡽⡼⡀⠀⢣⢸⠸⡇
⢸⡸⢸⠀⠀⣿⠀⣇⢠⡿⠀⠀⠀⠸⡇⠀⠀⠀⠀⠀⠘⢇⠸⠘⡀⠻⣇⠀⠀⠄⠀⡇⢣⢛⠀⡇⠀⠀⣸⠇⠀⠀⠀⠀⠀⠘⠄⢻⡀⠻⣻⣧⠀⠀⠃⢧⡇⠀⢸⢸⡇⡇
⢸⡇⢸⣠⠀⣿⢠⣿⡾⠁⠀⢀⡀⠤⢇⣀⣐⣀⠀⠤⢀⠈⠢⡡⡈⢦⡙⣷⡀⠀⠀⢿⠈⢻⣡⠁⠀⢀⠏⠀⠀⠀⢀⠀⠄⣀⣐⣀⣙⠢⡌⣻⣷⡀⢹⢸⡅⠀⢸⠸⡇⡇
⢸⡇⢸⣟⠀⢿⢸⡿⠀⣀⣶⣷⣾⡿⠿⣿⣿⣿⣿⣿⣶⣬⡀⠐⠰⣄⠙⠪⣻⣦⡀⠘⣧⠀⠙⠄⠀⠀⠀⠀⠀⣨⣴⣾⣿⠿⣿⣿⣿⣿⣿⣶⣯⣿⣼⢼⡇⠀⢸⡇⡇⠇
⢸⢧⠀⣿⡅⢸⣼⡷⣾⣿⡟⠋⣿⠓⢲⣿⣿⣿⡟⠙⣿⠛⢯⡳⡀⠈⠓⠄⡈⠚⠿⣧⣌⢧⠀⠀⠀⠀⠀⣠⣺⠟⢫⡿⠓⢺⣿⣿⣿⠏⠙⣏⠛⣿⣿⣾⡇⢀⡿⢠⠀⡇
⢸⢸⠀⢹⣷⡀⢿⡁⠀⠻⣇⠀⣇⠀⠘⣿⣿⡿⠁⠐⣉⡀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠉⠓⠳⠄⠀⠀⠀⠀⠋⠀⠘⡇⠀⠸⣿⣿⠟⠀⢈⣉⢠⡿⠁⣼⠁⣼⠃⣼⠀⡇
⢸⠸⣀⠈⣯⢳⡘⣇⠀⠀⠈⡂⣜⣆⡀⠀⠀⢀⣀⡴⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢽⣆⣀⠀⠀⠀⣀⣜⠕⡊⠀⣸⠇⣼⡟⢠⠏⠀⡇
⢸⠀⡟⠀⢸⡆⢹⡜⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠋⣾⡏⡇⡎⡇⠀⡇
⢸⠀⢃⡆⠀⢿⡄⠑⢽⣄⠀⠀⠀⢀⠂⠠⢁⠈⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠄⡐⢀⠂⠀⠀⣠⣮⡟⢹⣯⣸⣱⠁⠀⡇
⠈⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⠉⠉⠁
]]

			local alpha = require 'alpha'
			local dashboard = require 'alpha.themes.dashboard'

			vim.cmd [[autocmd User AlphaReady echo 'ready']]

			-- alpha.setup(dashboard.config)

			-- Set header
			dashboard.section.header.val = logo

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
				dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("s", "  > Settings",
					":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
				dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
			}

			-- Set footer
			--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
			--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
			--   ```init.lua
			--   return require('packer').startup(function()
			--       use 'wbthomason/packer.nvim'
			--       use {
			--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
			--           requires = {'BlakeJC94/alpha-nvim-fortune'},
			--           config = function() require("config.alpha") end
			--       }
			--   end)
			--   ```
			-- local fortune = require("alpha.fortune")
			-- dashboard.section.footer.val = fortune()

			local handle = io.popen 'fortune /usr/share/fortune/linux'
			local fortune = handle:read '*a'
			handle:close()

			dashboard.section.footer.val = fortune

			-- Send config to alpha
			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[
			autocmd FileType alpha setlocal nofoldenable
			]])
		end,
	},

	{
		"folke/trouble.nvim",
		cmd = "Trouble",
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
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
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
			highlight = {
				enable = true,
			},
		},
	},

	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},

	{
		"jbyuki/nabla.nvim",
		keys = {
			{
				"<leader>pp",
				group="Nabla"
			},
			{
				"<leader>pp",
				function() require("nabla").popup() end,
				desc = "Popup",
			},
			{
				"<leader>pv",
				function() require("nabla").toggle_virt() end,
				desc = "toggle_virt",
			},
		}
	},
}
