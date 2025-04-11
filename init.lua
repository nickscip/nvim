-- LSP Setup
-- Config Reference: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
vim.lsp.enable({
  "luals",
  "pyright",
  "ruff",
})

-- Vim Settings
vim.opt.number = true                                                     -- Show line numbers
vim.opt.relativenumber = true                                             -- Show relative line numbers
vim.opt.expandtab = true                                                  -- Use spaces instead of tabs
vim.opt.tabstop = 2                                                       -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 2                                                    -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true                                                  -- Use spaces instead of tabs
vim.opt.autoread = true                                                   -- Automatically reload files when changed on disk

vim.g.mapleader = " "                                                     -- Set leader key to space

vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true }) -- Move line down with option-j
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true }) -- Move line up with option-k
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true }) -- Copy to clipboard

-- Set spacing for specific file types
vim.api.nvim_create_autocmd({ 'FileType', 'BufRead', 'BufNewFile' }, {
  pattern = '*.toml',
  command = 'setlocal tabstop=4 shiftwidth=4 expandtab'
})

vim.api.nvim_create_autocmd({ 'FileType', 'BufRead', 'BufNewFile' }, {
  pattern = '*.java',
  command = 'setlocal tabstop=4 shiftwidth=4 expandtab'
})

-- Initialize Lazy
require("lazy.lazy")


-- Telescope Keybinds
local keymap = vim.keymap -- for conciseness
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }

    -- set keybinds
    opts.desc = "Show LSP references"
    keymap.set("n", "<leader>gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

    opts.desc = "Go to declaration"
    keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts) -- go to declaration

    opts.desc = "Show LSP definitions"
    keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

    opts.desc = "Show LSP implementations"
    keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

    opts.desc = "Show LSP type definitions"
    keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
  end,
})

-- Show source in diagnostics
vim.diagnostic.config({
  virtual_text = {
    source = true,
  },
  float = {
    source = true,
  },
})

-- Format on save
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        end,
      })
    end
  end,
})
