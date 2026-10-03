return {
  'stevearc/aerial.nvim',
  -- Load with the first file so on_attach still sets the buffer-local { / } maps on every buffer
  event = { "BufReadPost", "BufNewFile" },
  cmd = {
    "AerialToggle", "AerialOpen", "AerialOpenAll", "AerialClose", "AerialCloseAll", "AerialNext",
    "AerialPrev", "AerialGo", "AerialInfo", "AerialNavToggle", "AerialNavOpen", "AerialNavClose",
  },
  keys = { "<leader>a" },
  opts = {
    layout = {
      default_direction = "left",
      placement = "edge",
    },
  },
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local aerial = require('aerial')

    aerial.setup({
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    })
    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
  end,
}
