set nocompatible

source $VIMRUNTIME/vimrc_example.vim

colorscheme spacegray

" Hide buffers instead of closing them
set hidden

" Re-read files if they changed on disk
set autoread

" Auto re-read file changes on cursor stop, works with autoread
au CursorHold,CursorHoldI * checktime

" Auto re-read file changes on VIM focus (GUI VIM)
" Non-GUI or tmux needs vim-tmux-focus-events and set -g focus-events on in
" tmuxconf
au FocusGained,BufEnter * :checktime

" Windows specific 
if has('win32')
    set undodir=$VIMRUNTIME."/tmp/undo//"
    set backupdir=$VIMRUNTIME."/tmp/backup//"

    " Ctrl+kb to show/hide NERDTree
    map <C-k><C-b> :NERDTreeToggle<CR>

    " Open NERDDTree in folder of the curent file
    noremap <silent> <C-n> :NERDTree %:p:h<CR>
endif

if has('macunix')
    set undodir=/home/caley/.vim/undo
    set backupdir=/home/caley/.vim/backup
endif

" light gray vertical ruler at 140 chars
set colorcolumn=140

" Better split behavior
set splitbelow
set splitright

" Enable undo file (undo between sessions)
set undofile

" Don't wrap lines
set nowrap

set autoindent
set copyindent
set shiftwidth=4
set shiftround

set encoding=utf-8

set noswapfile
set backup

set listchars=tab:\ \ ,trail:·
set list

" Show real current line number under cursor, use relative elsewhere
set number
set relativenumber

" Highlight row under cursor
set cursorline

" Enable syntax highlighting
syntax enable

" Highlight version control conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" TABs are spaces
set expandtab

" Set visual spaces per TAB
set tabstop=4

" Set actual spaces inserted  per TAB
set softtabstop=4

" Enable filetype detection and lang specific indentation files
filetype plugin indent on
filetype indent on

let g:javascript_plugin_flow = 1

" visual autocomplete for command menu
set wildmenu

" Extra ignored filetypes for wildmenu
set wildignore+=.git                           " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.sw?                          " VIM swap files
set wildignore+=.DS_Store                      " Mac OS Stuff
set wildignore+=thumbs.db                      " Windows Stuff

" redraw only when neccessary
set lazyredraw

" show match [{()}]
set showmatch

" Search as characters are entered
set incsearch

" Highlight search matches
set hlsearch

" Searches are not case sensitive
set ignorecase

" No audible or visual error cues
set noerrorbells
set novisualbell
set belloff=all

set history=1000
set undolevels=1000

" Enable code folding
set foldenable
set nofoldenable

" 10 nest fold max
set foldnestmax=10

" Fold on indent, can try expr, syntax
set foldmethod=indent

set foldcolumn=1

" Turn on folding for commonly used languages
let javaScript_fold=1
let php_folding=2

" Open most folds by default on new buffer/window
set foldlevelstart=10

" Remap leader from <Esc> to space
let mapleader=" "

" Bind jj to <Esc> allowing the exiting of insert mode
inoremap jj <esc>

" Yank selected to system clipboard in visual mode
xnoremap <leader>y "+y

" Yank current line to system clipboard in normal mode
noremap <leader>y "+yy

" Mappings to auto complete braces and parens
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" // comments on gcc (js, php)
nnoremap gcc I//<ESC>

" Let tab go to the next matching symbol [({})]
map <tab> %

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" ,ev / ,sv to edit or reload _vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" leader(space) space to clear highlighted search results
noremap <silent> <leader><space> :nohlsearch<CR>

" Less keystrokes to enter commands
nnoremap ; :

" Easier window (split) navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" w!! to write to a read only file w/o having to exit and reopen with sudo
cmap w!! w !sudo tee % >/dev/null

" H for beginning of line, L for the end
noremap H ^
noremap L $

" You didn't see this
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Open a quickfix split showing all the search results
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" leader hh to highlight the word (to word boundary) under the cursor
nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>

nnoremap <F5> :UndotreeToggle<CR>

" Start CtrlP in "Find in buffer" mode
nnoremap <silent> <C-b> :CtrlPMRU<CR>

" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.
function! HiInterestingWord(n)
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" Visual Mode */# from Scrooloose {{{
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

if has('gui_running')
    "set guifont=Dank\ Mono:h13
    set guifont=Fira\ Code:h10

    " Remove UI Stuff
    set go-=T "toolbar
    set go-=l
    set go-=L "left side scroll
    set go-=r "scrollbar
    set go-=R "right side scroll
endif

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g') let arg3 = v:fname_out if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif let arg3 = substitute(arg3, '!', '\!', 'g') if $VIMRUNTIME =~ ' ' if &sh =~ '\<cmd' if empty(&shellxquote) let l:shxq_sav = '' set shellxquote& endif let cmd = '"' . $VIMRUNTIME . '\diff"' else let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"' endif else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Everytime a file is opened in the current buffer, reveal it in NERDTree
autocmd BufEnter * call SyncTree()

" Macros
" MISC
let @t = 'I// @TODO: ==A'

"JS
" I have bindings for H and L here that could be used but sticking to default
" VIM motion commands for sake of these lines being copied without the other
" ones
let @a = 'I const [ea,ea] =A;==jo'
" This one has to do some odd movements because of the mapping for
" autocompleting braces that exists up above
let @o = 'I const {lxea,ea} =A;==jo'

" Attempt to tie CtrlP and NERDTree together. I never want to search for files in a directory that NERDTree isn't open to.
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

" CtrlP ignores node_modules
let g:ctrlp_custom_ignore = 'node_modules'

" YCMD/YouCompleteMe Config
if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif

let g:ycm_semantic_triggers['typescript'] = ['.'] " Trigger TS completion on .

"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
" Automatically open NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Make vim automatically do a cd to the directory of an opened NERDTree file
" set autochdir

" Specify a directory for plugins
call plug#begin($VIM . '\vimfiles\plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'ycm-core/YouCompleteMe', {'do': './install.py'}
Plug 'Shougo/vimproc.vim'
Plug 'vim-scripts/phpfolding.vim'
Plug 'gabesoft/vim-ags'

" Initialize plugin system
call plug#end()
