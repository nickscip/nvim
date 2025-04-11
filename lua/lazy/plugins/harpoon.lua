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
        layout_strategy = "center",
        layout_config = {
          preview_cutoff = 1,
          width = function(_, max_columns, _)
            return math.min(max_columns, 80)
          end,
          height = function(_, _, max_lines)
            return math.min(max_lines, 15)
          end,
        },
        borderchars = {
          prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
          results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
          preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
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
    keymap.set("n", "<leader>hu", function() harpoon:list():select(7) end)
    keymap.set("n", "<leader>hi", function() harpoon:list():select(8) end)
    keymap.set("n", "<leader>ho", function() harpoon:list():select(9) end)
    keymap.set("n", "<leader>hp", function() harpoon:list():select(10) end)

    keymap.set("n", "<leader>hsq", function() harpoon:list():replace_at(1) end)
    keymap.set("n", "<leader>hsw", function() harpoon:list():replace_at(2) end)
    keymap.set("n", "<leader>hse", function() harpoon:list():replace_at(3) end)
    keymap.set("n", "<leader>hsr", function() harpoon:list():replace_at(4) end)
    keymap.set("n", "<leader>hst", function() harpoon:list():replace_at(5) end)
    keymap.set("n", "<leader>hsy", function() harpoon:list():replace_at(6) end)
    keymap.set("n", "<leader>hsu", function() harpoon:list():replace_at(7) end)
    keymap.set("n", "<leader>hsi", function() harpoon:list():replace_at(8) end)
    keymap.set("n", "<leader>hso", function() harpoon:list():replace_at(9) end)
    keymap.set("n", "<leader>hsp", function() harpoon:list():replace_at(10) end)
  end,
}
