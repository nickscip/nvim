return {
  "catppuccin/nvim",
  config = function()
    local catppuccin = require("catppuccin")
    catppuccin.setup({
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },
      color_overrides = {
        latte = {
          base = "#e6e9ef",
          mantle = "#dce0e8",
          crust = "#d2d6de",
        },
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end,
}
