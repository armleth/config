set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    Plugin 'preservim/nerdtree'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

filetype indent plugin on
syntax on

" Gestion of NerdTree
    " Raccourcis
    nnoremap n :NERDTreeFocus<CR>
    nnoremap <C-n> :NERDTree<CR>
    nnoremap <C-t> :NERDTreeToggle<CR>
    nnoremap <C-f> :NERDTreeFind<CR>

    " Start NERDTree. If a file is specified, move the cursor to its window.
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"Balises auto-fermantes
 inoremap {      {}<Left>
  inoremap {<CR>  <CR>{<CR>}<Esc>O
  inoremap {{     {
  inoremap {}     {}
  inoremap (  ()<Left>
  inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
  inoremap <expr> <BS>  strpart(getline('.'), col('.')-2, 2) == "()" ? "\<BS><Del>" : strpart(getline('.'), col('.')-2, 2) == "''" ? "\<BS><Del>" : strpart(getline('.'), col('.')-2, 2) == "\"\"" ? "\<BS><Del>" : "\<BS>"
  inoremap [  []<Left>
  inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

  inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
  inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
"  inoremap <expr> <BS>  strpart(getline('.'), col('.')-2, 2) == "''" ? "\<BS><Del>" : "\<BS>"
"  inoremap <expr> ; strpart(getline('.'), col('.')-1, 1) == ")" ? "\<End>;" : ";"
  inoremap for<Space> for ()<Left>
  inoremap if<Space> if ()<Left>
  inoremap if<Tab> if ()<Left>



set cc=80
set number
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set smarttab
set smartindent
set cindent
set textwidth=80
set backspace=eol,start,indent
set clipboard=unnamedplus
set belloff=all

" Make configuration
autocmd Filetype make setlocal noexpandtab

set list listchars=tab:»·,trail:·

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif
