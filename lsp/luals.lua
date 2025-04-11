vim.lsp.config['luals'] = {
  -- Command and arguments to start the server.
  cmd = { 'lua-language-server' },

  -- Filetypes to automatically attach to.
  filetypes = { 'lua' },

  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a ".luarc.json" or a
  -- ".luarc.jsonc" file. Files that share a root directory will reuse
  -- the connection to the same LSP server.
  root_markers = { '.luarc.json', '.luarc.jsonc' },

  -- Docs: https://github.com/LuaLS/lua-language-server/wiki/Settings
  settings = {
    Lua = {
      completion = {
        callSnippet = "Both" -- https://github.com/LuaLS/lua-language-server/wiki/Settings#completioncallsnippet
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        }
      },
      diagnostics = {
        globals = { 'vim' },
        needFileStatus = {
        },
      },
    }
  }
}
