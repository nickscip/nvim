vim.lsp.config['rust-analyzer'] = {
  -- Command and arguments to start the server.
  cmd = { "rust-analyzer" },

  -- Filetypes to automatically attach to.
  filetypes = { 'rust' },

  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a "Cargo.toml" or a
  -- "rust-project.json" file. Files that share a root directory will reuse
  -- the connection to the same LSP server.
  root_markers = { "Cargo.toml",
    "rust-project.json"
  },

  -- Specific settings to send to the server. The schema for this is
  -- defined by the server. For example the schema for lua-language-server
  -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {},
}
