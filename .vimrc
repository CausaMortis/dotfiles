set nocompatible

" -----------------------------------------------------------------------------
" VIM Plugins
" -----------------------------------------------------------------------------

call plug#begin()

Plug 'w0ng/vim-hybrid'
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'thaerkh/vim-indentguides'

call plug#end()

" -----------------------------------------------------------------------------
" General
" -----------------------------------------------------------------------------

syntax on                       " enable basic syntax highlighting
set background=dark
colorscheme hybrid

set autowrite                   " automatically write before running commands
set backspace=2                 " backspace deletes like most programs in insert mode
set encoding=utf-8              " file encoding when displayed
set fileencoding=utf-8          " file encoding when writing
set ff=unix                     " set file formats to unix over dos
set laststatus=2                " always display the status line
set ignorecase                  " case insensitive search
set incsearch                   " jump to closest instance when searching
set nobackup                    " do not keep backups of files
set noerrorbells                " disable error bells
set noswapfile                  " disable swap files 
set nojoinspaces                " use one space, not two, after punctuation
set nowritebackup               " do not make a backup when writing files
set number                      " display the absolute line number
set numberwidth=5               " 
set ruler                       " always show where the cursor is
set rnu                         " use relative line number
set showcmd                     " display incomplete commands
set splitbelow                  " split to bottom
set splitright                  " vsplit to the right
set visualbell                  " visualbell instead of beeping
set t_vb=                       " visualbell character to display, nothing

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set listchars=tab:»»,space:.,nbsp:.,trail:~,eol:¬
set list

" Disable arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" -----------------------------------------------------------------------------
" CTRL-P - Fuzzy finder and improvements using The Silver Searcher
" -----------------------------------------------------------------------------

if executable('ag')
    let g:ackprg = 'ag --vimgrep'

    " use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = ['ag %s -l --hidden --nocolor -g ""', '.git', 'cd %s && git ls-files -co --exclude-standard']

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" -----------------------------------------------------------------------------
" Leader mappings 
" -----------------------------------------------------------------------------

let mapleader = " "

nnoremap <Leader>vi :source ~/.vimrc<CR>:PlugInstall<CR>

" -----------------------------------------------------------------------------
" Custom key mappings
" -----------------------------------------------------------------------------

map <C-n> :NERDTreeToggle<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

