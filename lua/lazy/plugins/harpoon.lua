return {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
                "nvim-lua/plenary.nvim",
        },
        config = function()
                local harpoon = require("harpoon")

                harpoon:setup()

                local keymap = vim.keymap

                keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
                keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

                keymap.set("n", "<leader>hq", function() harpoon:list():select(1) end)
                keymap.set("n", "<leader>hw", function() harpoon:list():select(2) end)
                keymap.set("n", "<leader>he", function() harpoon:list():select(3) end)
                keymap.set("n", "<leader>hr", function() harpoon:list():select(4) end)
                keymap.set("n", "<leader>ht", function() harpoon:list():select(5) end)
                keymap.set("n", "<leader>hy", function() harpoon:list():select(6) end)
                end,
}
