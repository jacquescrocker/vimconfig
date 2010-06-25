" no vi compatibility
set nocompatible

" load all the bundles
call pathogen#runtime_append_all_bundles()

filetype plugin indent on
syntax on

" General Settings
set nowrap
set hidden
set list "show invisibles

" Tabs
set tabstop=2 " Use 2 spaces for tabs
set smarttab " Automatic indenting
set shiftwidth=2 " sets spaces used for indention
set autoindent " continue indention from previous line
set expandtab " tab key inserts spaces instead of tabs
set backspace=2 " start,indent

" Do not use swapfiles or backup since writebackup is used
" writebackup is still used, so a copy is always kept in memory
set nobackup " Do not write backup files to disk
set noswapfile " Do not use swapfiles (they have trouble with large files)

set wildignore+=*.png,*.jpg,*.gif,*.ai,*.jpeg,*.psd,*.swp,*.jar,*.zip,*.gem,.DS_Store,log/**,tmp/**,coverage/**,rdoc/**

" additional support for some file types
autocmd BufRead *.html.erb set ft=eruby.html
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

set nofoldenable " Fuck code folding...

set whichwrap+=<,>,h,l " allow backspace and cursor keys to cross line boundaries

" A vim function that keeps your state
" http://technotales.wordpress.com/2010/03/31/preserve
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" map control left and control right to swap the buffer
map <C-right> <ESC>:bn<CR>
map <C-left> <ESC>:bp<CR>

" map Command-j to Scroll Down
map <D-j> <C-d>
" map Command-k to Scroll Up
map <D-k> <C-u>

" map Shift-U to REDO
map <S-u> <C-r>

" set the LEADER key to ,
let mapleader = ","

" Leader-v reloads the vimrc -- making all changes active (have to save first)
map <silent> ,v :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>:NERDTreeClose<CR>

" NERDTree (Command-d / Leader-d)
map <leader>d :NERDTreeToggle<CR>
map <D-d> :NERDTreeToggle<CR>
map <leader>n :NERDTree<CR>
" map <D-d> :execute 'NERDTreeToggle ' . getcwd()<CR>
" navigates nerdtree to the current file
map <leader><S-d> :NERDTree %:p:h<CR> 

" NERD Commenter
let g:NERDSpaceDelims=1
let g:NERDDefaultNesting=0
let g:NERDCommentWholeLinesInVMode=1
nmap <D-/> ,cc
vmap <D-/> ,ccgv
imap <D-/> <C-O>,cc
nmap <D-S-/> ,cc
vmap <D-?> ,ccgv
imap <D-?> <C-O>,cc

" Toggle show invisibles
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Shift-w maps to Control-W
map <S-w> <C-w>

" ,w will easily switch window focus
map <leader>w <C-w>w

" ,b will load up the buffer explorer
map <leader>b :BufExplorerHorizontalSplit<CR>
let g:bufExplorerSplitBelow=1 

" Setup Command-t shortcut
map <D-t> <leader>t
let g:CommandTMatchWindowAtTop=1

" Set up Ack shortcuts (literal vs nonliteral)
map <leader>f :Ack -Q 
map <leader><S-f> :Ack 

" Setup Command-e to use ctags (Control-])
map <D-e> <C-]>

" Replicate textmate CMD-[ and CMD-] for indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Easy edit helpers
" http://vimcasts.org/episodes/the-edit-command/
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Replicate textmate shift arrow/movement in order to select stuff
nmap <S-up> vk
vmap <S-up> k
nmap <S-k> vk
vmap <S-k> k

nmap <S-right> vl
vmap <S-right> l
nmap <S-l> vl
vmap <S-l> l

nmap <S-down> vj
vmap <S-down> j
nmap <S-j> vj
vmap <S-j> j

nmap <S-left> v
vmap <S-left> h
nmap <S-h> vh
vmap <S-h> h

" Clean up the trailing spaces
nmap <leader><S-s> :call Preserve("%s/\\s\\+$//e")<CR>

" Retab the document (tabs to spaces)
nmap <silent> <leader><S-t> :retab!<CR>

