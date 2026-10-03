local function toggle_telescope(harpoon_files)
  local conf = require("telescope.config").values
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

local keys = {
  { "<leader>ha", function() require("harpoon"):list():add() end },
  { "<leader>hh", function() toggle_telescope(require("harpoon"):list()) end },
}
-- <leader>h{q..p} selects slot 1-10; <leader>hs{q..p} replaces slot 1-10
for i, k in ipairs({ "q", "w", "e", "r", "t", "y", "u", "i", "o", "p" }) do
  table.insert(keys, { "<leader>h" .. k, function() require("harpoon"):list():select(i) end })
  table.insert(keys, { "<leader>hs" .. k, function() require("harpoon"):list():replace_at(i) end })
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = keys,
  config = function()
    require("harpoon"):setup({})
  end,
}
