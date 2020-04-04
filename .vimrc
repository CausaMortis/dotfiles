set nocompatible

" -----------------------------------------------------------------------------
" Vim-Plugged
" -----------------------------------------------------------------------------

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/vim-easy-align'
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-vdebug/vdebug'
Plug 'w0ng/vim-hybrid'

call plug#end()


" -----------------------------------------------------------------------------
" Options
" -----------------------------------------------------------------------------

syntax on                                                                      " enable basic syntax highlighting
set background=dark
colorscheme hybrid
filetype plugin indent off                                                     " filetype and indentation detection

set autoindent                                                                 " automatically set the indent of a new line
set autowrite                                                                  " automatically write before running commands
set backspace=indent,eol,start                                                 " backspace deletes like most programs in insert mode
set clipboard=unnamed                                                          " always enable clipboard
set cmdheight=2                                                                " better display for messages
set colorcolumn=80,110                                                         " display ruler at specific column
set cursorline                                                                 " highlight screen column cursor
set encoding=utf-8                                                             " file encoding when displayed
set expandtab                                                                  " expand <TAB> to spaces in Insert mode
set fileencoding=utf-8                                                         " file encoding when writing
set ff=unix                                                                    " set file formats to unix over dos
set ignorecase                                                                 " case insensitive search
set smartcase                                                                  " override ignore case when pattern has upper case characters
set incsearch                                                                  " jump to closest instance when searching
set hidden                                                                     " hide unsaved files instead of closing them
set laststatus=2                                                               " always display the status line
set listchars=tab:»»,space:.,nbsp:.,trail:~,eol:¬,tab:\|\                      " define how extra whitespace characters are dislayed
set list                                                                       " show tab and end of line
set matchpairs=(:),{:},[:],<:>                                                 " list of pairs that match for the % command
set nobackup                                                                   " do not keep backups of files
set noerrorbells                                                               " disable error bells
set noswapfile                                                                 " disable swap files
set nojoinspaces                                                               " use one space, not two, after punctuation
set nowritebackup                                                              " do not make a backup when writing files
set number                                                                     " display the absolute line number
set numberwidth=5                                                              " minimum number of columns for line number
set mouse=a                                                                    " allow scrolling with trackpad
set ruler                                                                      " always show where the cursor is
set rnu                                                                        " use relative line number
set showcmd                                                                    " display incomplete commands
set shiftwidth=2                                                               " number of spaces used for each step of indent
set shiftround                                                                 " round to shiftwidth for << and >>
set smarttab                                                                   " a <TAB> in an indent inserts 'shiftwidth' spaces
set smartindent                                                                " clever autoindenting
set splitbelow                                                                 " split to bottom
set splitright                                                                 " vsplit to the right
set tabstop=2                                                                  " number of spaces a <TAB> in text stands for
set visualbell                                                                 " visualbell instead of beeping
set t_vb=                                                                      " visualbell character to display, nothing
set updatetime=300                                                             " improve experience with diagnostic messages #neoclide/coc.nvim
set wildmenu                                                                   " commandline command completion
set wildmode=longest:list,full                                                 " complete to longest string, show match list, second tab to complete
set wildignore+=*/.git/*,*.swp                                                 " ignore git directory and swap files


" -----------------------------------------------------------------------------
" Leader mappings 
" -----------------------------------------------------------------------------

let mapleader = " "

nnoremap <Leader>pi :source ~/.vimrc<CR>:PlugInstall<CR>
nnoremap <Leader>pc :source ~/.vimrc<CR>:PlugClean<CR>
nnoremap <Leader>n :nohlsearch<CR>
nnoremap <Leader>s :w<CR>

" -----------------------------------------------------------------------------
" NERDTree and Taglist
" -----------------------------------------------------------------------------

let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=50

let g:tagbar_width=40

map <C-n> :NERDTreeToggle<CR>
map <C-N> :NERDTreeFind<CR>
map <C-o> :TagbarToggle<CR>

" Close NERDTree if last and only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -----------------------------------------------------------------------------
" Gutentags
" -----------------------------------------------------------------------------

let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']

" -----------------------------------------------------------------------------
" CTRL-P and Ripgrep
" -----------------------------------------------------------------------------

if executable('rg')
  set grepprg=rg
  let g:ctrlp_user_command='rg --files --color=never --hidden %s -g !.git'
  let g:ctrlp_use_caching=1
  let g:ctrlp_clear_cache_on_exit=0
  let g:ctrlp_cache_dir='/tmp'
endif


" -----------------------------------------------------------------------------
" Conquer of Completion - Intellisense
" -----------------------------------------------------------------------------

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" : 
  \ <SID>check_backspace() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_backspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
