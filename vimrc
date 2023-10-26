" ~/.vimrc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'sonph/onehalf', { 'rtp': 'vim' }
Plugin 'tpope/vim-sensible'
Plugin 'maralla/completor.vim'

call vundle#end()
filetype plugin indent on


set background=dark
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

" relative number + horizontal line on cursor
set relativenumber
set cursorline
set rnu

" base netrw config
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" snippets - when new file, insert a skeleton
augroup skeletons
  au!
  autocmd BufNewFile *.* silent! execute '0r ~/afs/.confs/vim/templates/skeleton.'.expand("<afile>:e")
  " special case for Makefiles
  autocmd BufNewFile Makefile silent! execute '0r ~/afs/.confs/vim/templates/skeleton.make'
augroup END

runtime! plugin/sensible.vim

set encoding=utf-8 fileencodings=
syntax on

" automplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" spaces instead of tabs
set autoindent
set tabstop=8 " Tab size
set shiftwidth=4 " Indent size
set expandtab " Use spaces instead of tabs

" grey vertical line at 80 char
set number
set cc=80

autocmd Filetype make setlocal noexpandtab

" display tabs and spaces
set list listchars=tab:»·,trail:·

" auto-close of (, {, etc
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap <expr> <CR> search('{\%#}', 'n') ? "\<CR>\<CR>\<Up>\<C-f>" : "\<CR>"

" tab for completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif
