return {
  {
    -- `main` branch: required for Neovim 0.11+. The old `master` branch's
    -- injection queries crash core treesitter ("attempt to call method 'range'").
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- Idempotent: skips parsers that are already installed.
      require("nvim-treesitter").install({
        "bash",
        "c",
        "css",
        "csv",
        "dockerfile",
        "fish",
        "git_config",
        "gitignore",
        "go",
        "html",
        "htmldjango",
        "ini",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "pem",
        "python",
        "query",
        "requirements",
        "rust",
        "scss",
        "ssh_config",
        "svelte",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      })

      -- `main` has no global setup() for highlight/indent; enable per buffer.
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", {}),
        callback = function(args)
          local ft = vim.bo[args.buf].filetype
          local lang = vim.treesitter.language.get_lang(ft) or ft
          if not pcall(vim.treesitter.start, args.buf, lang) then
            return
          end
          -- Only override indent when the language ships an indents query;
          -- otherwise keep Neovim's built-in indentexpr.
          if vim.treesitter.query.get(lang, "indents") then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
