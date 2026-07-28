return {
  -- Browser-based markdown preview with mermaid diagram rendering.
  -- Markview decorates the buffer; this renders real diagrams in a browser tab.
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
  ft = { "markdown" },
  -- `mkdp#util#install()` spawns an async terminal job, so it can finish after
  -- the build step returns and leave `app/bin` empty. Call the downloader
  -- directly instead: synchronous, and it picks up the latest release tag.
  build = "cd app && ./install.sh",
  keys = {
    { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle markdown preview" },
  },
}
