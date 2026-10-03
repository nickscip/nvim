return {
  "williamboman/mason.nvim",
  -- Lazy-loaded: init.lua puts mason/bin on PATH, so LSP servers resolve without loading mason.
  cmd = {
    "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonUpdate",
    "LspInstall", "LspUninstall", -- mason-lspconfig
    "MasonToolsInstall", "MasonToolsInstallSync", "MasonToolsUpdate", "MasonToolsUpdateSync", "MasonToolsClean", -- mason-tool-installer
  },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- LSP servers to install with :MasonToolsInstall (bootstrap.sh runs it on a new machine)
    require("mason-tool-installer").setup({
      ensure_installed = { "lua-language-server", "ruff", "rust-analyzer", "ty", "vtsls" },
      run_on_start = false,
    })

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ruff",
      },
      automatic_installation = true,
      -- Servers are enabled explicitly via vim.lsp.enable() in init.lua
      automatic_enable = false,
    })
  end,
}
