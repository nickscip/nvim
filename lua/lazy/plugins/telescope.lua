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

    keymap.set("n", "<leader>ff", require('telescope.builtin').find_files, { desc = "Find files" })
    keymap.set("n", "<leader>en", function()
      require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath("config")
      }
    end, { desc = "Find files in nvim config" })
    keymap.set("n", "<leader>fg", require('telescope.builtin').live_grep, { desc = "Grep in cwd" })
    keymap.set("n", "<leader>eg", function()
      require('telescope.builtin').live_grep {
        cwd = vim.fn.stdpath("config")
      }
    end, { desc = "Grep in nvim config" })
    keymap.set("n", "<leader>fb", require('telescope.builtin').buffers, { desc = "List buffers" })
    keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags, { desc = "Find help tags" })
  end,
}
