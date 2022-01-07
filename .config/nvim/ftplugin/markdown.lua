local opt = vim.opt -- global/tab/buffer/window-scoped options
local cmd = vim.cmd -- execute vim command
local g = vim.g

opt.spell = true

if packer_plugins['nvim-markdown-preview'] and
  packer_plugins['nvim-markdown-preview'].loaded then
  g.nvim_markdown_preview_theme = 'github'
  g.nvim_markdown_preview_format = 'markdown'
  -- cmd [[MarkdownPreview]] -- uncomment this to open preview automatically
end

