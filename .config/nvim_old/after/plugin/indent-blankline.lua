if packer_plugins['indent-blankline.nvim'] and
  packer_plugins['indent-blankline.nvim'].loaded then
  vim.opt.list = true
  vim.opt.listchars:append("eol:↴")
  require('indent_blankline').setup {
    char = "▏",
    show_first_indent_level = false,
    show_end_of_line = true,
    filetype_exclude = {
      'help', 'git', 'markdown', 'text', 'terminal', 'lspinfo', 'packer'
    },
    buftype_exclude = {'terminal', 'nofile'}
  }
end

