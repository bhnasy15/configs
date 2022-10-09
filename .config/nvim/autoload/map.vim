let mapleader = ","

nmap <S-H> <C-W>

" write and/or quit
nnoremap <leader>W :wq!<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>q :close!<CR>
" language
nnoremap <leader>ar :set arabic!<CR>
nnoremap <leader>sp :set spell!<CR>
" clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P :r! xclip -selection clipboard -o<CR>

