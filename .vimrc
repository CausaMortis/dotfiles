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
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-vdebug/vdebug'
Plug 'w0ng/vim-hybrid'


call plug#end()


" -----------------------------------------------------------------------------
" General
" -----------------------------------------------------------------------------

syntax on                       " enable basic syntax highlighting
set background=dark
colorscheme hybrid

set autowrite                   " automatically write before running commands
set backspace=2                 " backspace deletes like most programs in insert mode
set clipboard=unnamed           " always enable clipboard
set cmdheight=2                 " better display for messages
set encoding=utf-8              " file encoding when displayed
set fileencoding=utf-8          " file encoding when writing
set ff=unix                     " set file formats to unix over dos
set ignorecase                  " case insensitive search
set incsearch                   " jump to closest instance when searching
set hidden                      " hide unsaved files instead of closing them
set laststatus=2                " always display the status line
set nobackup                    " do not keep backups of files
set noerrorbells                " disable error bells
set noswapfile                  " disable swap files 
set nojoinspaces                " use one space, not two, after punctuation
set nowritebackup               " do not make a backup when writing files
set number                      " display the absolute line number
set numberwidth=5               " 
set mouse=a                     " allow scrolling with trackpad
set ruler                       " always show where the cursor is
set rnu                         " use relative line number
set showcmd                     " display incomplete commands
set splitbelow                  " split to bottom
set splitright                  " vsplit to the right
set visualbell                  " visualbell instead of beeping
set t_vb=                       " visualbell character to display, nothing
set updatetime=300              " improve experience with diagnostic messages #neoclide/coc.nvim

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set listchars=tab:»»,space:.,nbsp:.,trail:~,eol:¬
set list

" Disable arrow keys in normal mode
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Open NERDTRee and Tagbar on launch
augroup launch
  autocmd VimEnter * NERDTree
  autocmd VimEnter * TagbarToggle
  autocmd VimEnter * wincmd p
augroup END

" Close NERDTree if last and only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -----------------------------------------------------------------------------
" Leader mappings 
" -----------------------------------------------------------------------------

let mapleader = "."

nnoremap <Leader>vi :source ~/.vimrc<CR>:PlugInstall<CR>

" -----------------------------------------------------------------------------
" Binds
" -----------------------------------------------------------------------------

map <C-n> :NERDTreeToggle<CR>
map <C-o> :TagbarToggle<CR>

" -----------------------------------------------------------------------------
" CTRL-P and Ripgrep
" -----------------------------------------------------------------------------

if executable('ag')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 1
  let g:cntrp_clear_cache_on_exit = 0
  let g:ctrlp_custom_ignore = '\v[\/](node_modules|vendor)|(\.(swp|ico|git))$'
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
