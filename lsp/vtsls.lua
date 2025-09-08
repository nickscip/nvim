-- Typescript language server
vim.lsp.config['vtsls'] = {
  -- Command and arguments to start the server.
  cmd = { "vtsls", "--stdio" },

  -- Filetypes to automatically attach to.
  filetypes = { 'typescript' },

  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a ".luarc.json" or a
  -- ".luarc.jsonc" file. Files that share a root directory will reuse
  -- the connection to the same LSP server.
  root_markers = { 'package.json', 'tsconfig.json' },
}
