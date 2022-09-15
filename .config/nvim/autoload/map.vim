let mapleader = ","

nmap <S-H> <C-W>

" explorer
nnoremap <leader>vo :VsplitVifm<CR>
nnoremap <leader>ho :SplitVifm<CR>
nnoremap <leader>to :TabVifm<CR>
" write and/or quit
nnoremap <leader>x :wq!<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>
" language
nnoremap <leader>a :set arabic!<CR>
nnoremap <leader>sp :set spell!<CR>
" clipboard
nnoremap <leader>y \"\+y
nnoremap <leader>p \"\+p
nnoremap <leader>P :r! xclip -selection clipboard -o<CR>

