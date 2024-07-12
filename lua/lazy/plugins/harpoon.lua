return {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
                "nvim-lua/plenary.nvim",
        },
        config = function()
                local harpoon = require("harpoon")

                harpoon:setup({})

                local conf = require("telescope.config").values
                local function toggle_telescope(harpoon_files)
                    local file_paths = {}
                    for _, item in ipairs(harpoon_files.items) do
                        table.insert(file_paths, item.value)
                    end

                    require("telescope.pickers").new({}, {
                        prompt_title = "Harpoon",
                        finder = require("telescope.finders").new_table({
                            results = file_paths,
                        }),
                        previewer = conf.file_previewer({}),
                        sorter = conf.generic_sorter({}),
                    }):find()
                end

                local keymap = vim.keymap

                keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
                keymap.set("n", "<leader>hh", function() toggle_telescope(harpoon:list()) end)

                keymap.set("n", "<leader>hq", function() harpoon:list():select(1) end)
                keymap.set("n", "<leader>hw", function() harpoon:list():select(2) end)
                keymap.set("n", "<leader>he", function() harpoon:list():select(3) end)
                keymap.set("n", "<leader>hr", function() harpoon:list():select(4) end)
                keymap.set("n", "<leader>ht", function() harpoon:list():select(5) end)
                keymap.set("n", "<leader>hy", function() harpoon:list():select(6) end)
                end,
}
