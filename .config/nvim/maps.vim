" mapping esc to caps
inoremap jj <Esc>
" mapping to move tabs
noremap <A-Left>  :-tabmove<cr>
noremap <A-Right> :+tabmove<cr>
" telescope mapping
" Find files using Telescope command-line sugar.
nnoremap ;f <cmd>Telescope find_files<cr>
nnoremap ;r <cmd>Telescope live_grep<cr>
nnoremap \\ <cmd>Telescope buffers<cr>
nnoremap ;; <cmd>Telescope help_tags<cr>
