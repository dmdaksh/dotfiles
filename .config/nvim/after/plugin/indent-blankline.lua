if packer_plugins['indent-blankline.nvim'] and
  packer_plugins['indent-blankline.nvim'].loaded then
  require('indent_blankline').setup {
    char = "▏",
    show_first_indent_level = false,
    filetype_exclude = {
      'help', 'git', 'markdown', 'text', 'terminal', 'lspinfo', 'packer'
    },
    buftype_exclude = {'terminal', 'nofile'}
  }
end

