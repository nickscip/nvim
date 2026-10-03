return {
  'nvim-telescope/telescope.nvim',
  -- Todo* commands come from the todo-comments dependency (plugin/todo.vim)
  cmd = { "Telescope", "TodoQuickFix", "TodoLocList", "TodoTelescope", "TodoFzfLua", "TodoTrouble" },
  dependencies = {
    'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "debugloop/telescope-undo.nvim",
  },
  init = function()
    -- Not a telescope mapping; set at startup so it exists regardless of when telescope loads
    vim.keymap.set("n", ":E", ":Oi<cr>", { desc = "Open Oil file explorer" })
  end,
  keys = {
    { "<leader>ff", function() require('telescope.builtin').find_files() end, desc = "Find files" },
    {
      "<leader>en",
      function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end,
      desc = "Find files in nvim config"
    },
    { "<leader>fg", function() require('telescope.builtin').live_grep() end, desc = "Grep in cwd" },
    {
      "<leader>eg",
      function()
        require('telescope.builtin').live_grep {
          cwd = vim.fn.stdpath("config")
        }
      end,
      desc = "Grep in nvim config"
    },
    { "<leader>fb", function() require('telescope.builtin').buffers() end,   desc = "List buffers" },
    { "<leader>fh", function() require('telescope.builtin').help_tags() end, desc = "Find help tags" },
    { "<leader>u",  "<cmd>Telescope undo<cr>",                               desc = "Undo history" },
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup {
      pickers = {
        find_files = {
          hidden = false,
          no_ignore = false,
        },
      }
    }
    telescope.load_extension('fzf')
    require("telescope").load_extension('undo')
  end,
}
