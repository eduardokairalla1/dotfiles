" === PERSONAL VIM CONFIG ===

set nocompatible
scriptencoding utf-8


" --- PLUGIN SETTINGS ---
call plug#begin('~/.vim/plugged')

" File and text search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Status line
Plug 'itchyny/lightline.vim'

call plug#end()


" --- INTERFACE SETTINGS ---
" Line numbers
set number
set relativenumber

" Highlight the current line number
set cursorline

if exists('+cursorlineopt')
  set cursorlineopt=number
endif

highlight CursorLine cterm=NONE gui=NONE
highlight CursorLineNr cterm=bold gui=bold

" Syntax highlighting
syntax enable

" Show the sign column only when needed
if exists('+signcolumn')
  set signcolumn=auto
endif

" Use the default background for sign columns
highlight SignColumn ctermbg=NONE guibg=NONE
highlight CursorLineSign ctermbg=NONE guibg=NONE


" --- CURSOR SETTINGS ---
" Change the cursor shape based on the current Vim mode
if &term =~# 'kitty'
  " Normal mode: steady block
  let &t_EI = "\<Esc>[2 q"

  " Insert mode: steady vertical bar
  let &t_SI = "\<Esc>[6 q"

  " Replace mode: steady underline
  let &t_SR = "\<Esc>[4 q"

  " Restore the default Kitty cursor when leaving Vim
  if !exists('g:kitty_cursor_reset_added')
    let &t_TE .= "\<Esc>[0 q"
    let g:kitty_cursor_reset_added = 1
  endif
endif


" --- FILE SETTINGS ---
" Enable file type plugins and automatic indentation
filetype plugin indent on
set autoindent

" UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8


" --- INDENTATION SETTINGS ---
" Use four spaces for each indentation level
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab


" --- SEARCH SETTINGS ---
" Ignore case unless the search contains uppercase letters
set ignorecase
set smartcase

" Highlight search results
set hlsearch


" --- NAVIGATION SETTINGS ---
" Keep context around the cursor while scrolling
set scrolloff=5
set sidescrolloff=5

" Move through visual lines when no count is provided
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'

" Open new splits below and to the right
set splitbelow
set splitright


" --- EDITING SETTINGS ---
" Highlight matching brackets
set showmatch
set matchtime=2

" Ask for confirmation before discarding changes
set confirm

" Use the system clipboard when supported
if has('clipboard')
  set clipboard=unnamedplus
endif


" --- UNDO SETTINGS ---
" Keep undo history between Vim sessions
if has('persistent_undo')
  let s:undo_dir = expand('~/.vim/undo')

  if !isdirectory(s:undo_dir)
    call mkdir(s:undo_dir, 'p')
  endif

  let &undodir = s:undo_dir . '//'
  set undofile
endif


" --- WHITESPACE SETTINGS ---
" Highlight unnecessary trailing whitespace
highlight default link ExtraWhitespace Error

augroup trailing_whitespace
  autocmd!
  autocmd BufWinEnter,WinEnter,InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
augroup END

" Remove trailing whitespace when manually requested
command! TrimWhitespace %s/\s\+$//e


" --- FILE EXPLORER SETTINGS ---
" Configure the built-in Netrw file explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25


" --- STATUS LINE SETTINGS ---
" Configure Lightline with the current Git branch
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'gitbranch', 'readonly', 'filename', 'modified' ]
      \   ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ }
      \ }


" --- KEY MAPPING SETTINGS ---
" Use Space as the leader key
let mapleader = ' '


" --- FILE KEY MAPPINGS ---
" Save the current file
nnoremap <silent> <leader>w :write<CR>

" Close the current window
nnoremap <silent> <leader>q :quit<CR>

" Toggle the file explorer
nnoremap <silent> <leader>e :Lexplore<CR>

" Clear search highlighting
nnoremap <silent> <leader>h :nohlsearch<CR>

" Remove trailing whitespace
nnoremap <silent> <leader>tw :TrimWhitespace<CR>


" --- SEARCH KEY MAPPINGS ---
" Search for files
nnoremap <silent> <leader>p :Files<CR>

" Search for text in the current project
nnoremap <leader>/ :Rg<Space>


" --- GIT KEY MAPPINGS ---
" Open Git status
nnoremap <silent> <leader>gs :Git<CR>

" Open the Git diff
nnoremap <silent> <leader>gd :Gdiffsplit<CR>

" Preview the current Git hunk
nnoremap <silent> <leader>gp :GitGutterPreviewHunk<CR>


" --- WINDOW KEY MAPPINGS ---
" Navigate between split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Create split windows
nnoremap <silent> <leader>sv :vsplit<CR>
nnoremap <silent> <leader>sh :split<CR>

" --- MAN PAGE SETTINGS ---
" Load the built-in Man page plugin
runtime! ftplugin/man.vim

" Open the Man page for the word under the cursor with K
set keywordprg=:Man

" Open Man pages in a vertical split
let g:ft_man_open_mode = 'vert'

