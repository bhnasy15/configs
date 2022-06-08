
set nocompatible
set showcmd

set t_Co=256

filetype on
set nobackup
set noswapfile
set encoding=UTF-8
set mouse=a

set backspace=indent,eol,start " backspace over everything in insert mode

filetype plugin on

filetype indent on

syntax on
set spell spelllang=en,ar
set nospell

""" cursor line
set cursorline

""" colorscheme
colorscheme y

""" tabs
set shiftwidth=4
set tabstop=4
set smartindent

set scrolloff=10

" set nowrap

""" search
set ignorecase " Ignore capital letters during search.
set smartcase
set showmatch
" set incsearch
set nohlsearch
" set hlsearch
" hi Search cterm=bold ctermfg=214 ctermbg=232

" colorscheme spaceduck

""" numbers
set relativenumber
set number
 
""" wild menu
set wildmenu
set wildmode=longest:full:lastused
"set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" Mapping {{{

" Press the space bar to type the : character in command mode.

let mapleader = ","

nnoremap <Space> :

inoremap {<CR> {<CR>}<ESC>O

nnoremap <S-j> :tabnext<CR>
nnoremap <S-k> :tabprev<CR>

nnoremap <C-n> :tabnew 

noremap <leader>sb :SidebarNvimToggle<CR>
noremap <leader>sp :set spell!<CR>
noremap <leader>a :set arabic!<CR>
noremap <leader>p :r! xclip -selection clipboard -o<CR>
noremap <leader>y "+y
noremap <leader>q :q!<CR>
noremap <leader>w :wq!<CR>
nmap <S-H> <C-W>

autocmd FileType html imap <leader>e <C-y>,

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ \%F\ %M\ %Y\ %R%=\ (%l,%c)\ %p%%

" Show the status on the second to last line.
set laststatus=2

""" autocmd
au BufWritePost ~/.Xresources :!xrdb -merge ~/.Xresources

