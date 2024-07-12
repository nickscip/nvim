return {
    'nvim-telescope/telescope.nvim',
      dependencies = {
	      'nvim-lua/plenary.nvim',
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
      config = function()
	local telescope = require('telescope')
	telescope.load_extension('fzf')
	-- set keymaps
	local keymap = vim.keymap -- for conciseness

	keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", {desc = "Find files" })
	keymap.set("n", "<leader>fr", ":Telescope recentfiles<cr>", {desc = "Fuzzy find recent files" })
	keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", {desc = "Live grep" })
	keymap.set("n", "<leader>fc", ":Telescope grep_string<cr>", {desc = "Find string under cursor in cwd" })
	end,
}
