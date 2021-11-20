lua << EOF
  require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            '.git*'
          }
      }
  }
EOF

" Find files using Telescope command-line sugar.
nnoremap ;f <cmd>lua require('telescope.builtin').find_files({hidden=true, no_ignore=false})<cr>
nnoremap ;r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap \\ <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap ;; <cmd>lua require('telescope.builtin').help_tags()<cr>


