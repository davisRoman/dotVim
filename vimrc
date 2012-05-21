" =================================================
" vimrc from ghostylee <ghosty.lee.1984@gmail.com>
" =================================================

" ----------------------------------------
" Vundle {{{
" ----------------------------------------

set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
let g:vundle_default_git_proto = 'https'
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>
"}}}
" ----------------------------------------
" Regular Vim Configuration (No Plugins Needed) {{{
" ----------------------------------------
" Color {{{
" ---------------
" jellybeans.vim colorscheme tweaks {{{
" ---------------
Bundle 'nanotech/jellybeans.vim'
" Make cssAttrs (center, block, etc.) the same color as units
hi! link cssAttr Constant
"}}}
set t_Co=256
set background=dark
colorscheme jellybeans
"}}}
" Backups {{{
" ---------------
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
"}}}
" Language & encoding{{{
" ---------------
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set fileencoding=chinese
set langmenu=zh_CN.UTF-8  " chinese menu
set helplang=cn           " chinese helpdoc
"}}}
" Font {{{
" ---------------
if has('win32') || has('win64')
  set guifont=Consolas:h11
  set guifontwide=Yahei_Mono:h11:cGB2312
else
  set guifont="YaHei\ Consolas\ Hybird\ for\ Powerline:h11"
endif
"}}}
" UI {{{
" ---------------
set shortmess=atI  " less thing show at startup
set ruler          " Ruler on
set nu             " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently
endif
"}}}
" GVIM{{{
" ---------------
set guioptions-=T " Toolbar
set guioptions-=m " Menubar
set guioptions-=L " hide left scroll
set guioptions-=b " hide bottom scroll
set showtabline=0 " hide tab
"}}}
" Behaviors {{{
" ---------------
source $VIMRUNTIME/mswin.vim
filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)
syntax enable
syntax on
set autoread           " Automatically reload changes if detected
set autochdir          " Automatically change directory to current directory
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql
set iskeyword+=$,@     " Add extra characters that are valid parts of variables
"}}}
" Text Format {{{
" ---------------
set tabstop=2
set backspace=2   " Delete everything with backspace
set shiftwidth=2  " Tabs under smart indent
set softtabstop=2 " backspace can delete 2 space a time
set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,1s:1s
set autoindent
set smartindent
set smarttab
set expandtab
"}}}
" Searching {{{
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class
"}}}
" Visual {{{
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
set list        " show tab and trail
set listchars=tab:>.,trail:-
"}}}
" Sounds {{{
" ---------------
set noerrorbells
set novisualbell
set t_vb=
"}}}
" Mouse {{{
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes
"}}}
" Better complete options to speed it up {{{
set complete=.,w,b,u,U
"}}}
" Folding{{{
" ---------------
set foldenable
set foldmethod=marker
set foldlevel=0
set foldlevelstart=0
nnoremap <Space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"}}}
"}}}
" ----------------------------------------
" Platform Specific Configuration {{{
" ----------------------------------------
if has('win32') || has('win64')
  " Set height and width on Windows
  set lines=60
  set columns=120

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has('gui_macvim')
  " MacVim

  " Custom Menlo font for Powerline
  " From: https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
  set guifont=Menlo\ for\ Powerline:h12

  " Hide Toolbar in MacVim
  if has("gui_running")
    set guioptions=egmrt
  endif

  " Use option (alt) as meta key.
  set macmeta
endif
"}}}
" ----------------------------------------
" Bindings {{{
" ----------------------------------------
" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","

" Fixes common typos
command W w
command Q q
map <F1> <Esc>
imap <F1> <Esc>

" Removes doc lookup binding because it's easy to fat finger
nmap K k
vmap K k

" Make line completion easier
imap <C-l> <C-x><C-l>

" Easier Scrolling (think j/k with left hand)
" All variations are mapped for now until I get used to one
" C/M/D + d (page up)
" C/M/D + f (page down)
nmap <C-d> <C-b>
if has("gui_macvim")
  nmap <D-f> <C-f>
  nmap <D-d> <C-b>
else
  nmap <M-f> <C-f>
  nmap <M-d> <C-b>
endif

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :
" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" ---------------
" Leader Commands
" ---------------

" Toggle spelling mode with ,s
nmap <silent> <leader>s :set spell!<CR>
" Edit vimrc with ,v
if has('win32') || has('win64')
  nmap <silent> <leader>v :e ~/vimfiles/vimrc<CR>
else
  nmap <silent> <leader>v :e ~/.vim/vimrc<CR>
endif

" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
" Previous Window
nmap <silent> <C-p> :wincmd p<CR>

" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")
  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " No more complaining about untitled documents
  autocmd FocusLost silent! :wa

  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line ("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif
"}}}
" ----------------------------------------
" Plugin Configuration {{{
" ----------------------------------------
" Tagbar{{{
" ---------------
Bundle 'majutsushi/tagbar'
nnoremap al :TagbarToggle<cr>
"}}}
" ctags {{{
" ---------------
set tags=tags;  "; here let vim go to up folds until find one tags file
"}}}
" easytags {{{
" ---------------
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-shell'
nnoremap <silent><F4> :UpdateTags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
"}}}
" Neocachecompl {{{
" ---------------
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_auto_select=0 "Select the first entry automatically
let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_cursor_hold_i_time=300
let g:neocomplcache_auto_completion_start_length=1

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" space to end completion
inoremap <expr><Space>  pumvisible() ? neocomplcache#smart_close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" Required to make neocomplcache_cursor_hold_i_time work
" See https://github.com/Shougo/neocomplcache/issues/140
let s:update_time_save = &updatetime
autocmd InsertEnter * call s:on_insert_enter()

function! s:on_insert_enter()
  if &updatetime > g:neocomplcache_cursor_hold_i_time
    let s:update_time_save = &updatetime
    let &updatetime = g:neocomplcache_cursor_hold_i_time
  endif
endfunction

autocmd InsertLeave * call s:on_insert_leave()

function! s:on_insert_leave()
  if &updatetime < s:update_time_save
    let &updatetime = s:update_time_save
  endif
endfunction
"}}}
" Syntastic {{{
" ---------------
Bundle 'scrooloose/syntastic'
let g:syntastic_auto_loc_list=1
nnoremap sc :SyntasticCheck<cr>
"}}}
" NERDTree {{{
" ---------------
Bundle 'scrooloose/nerdtree'
nnoremap <leader>e :NERDTreeToggle<CR>
"}}}
" Indent Guides {{{
" ---------------
Bundle 'mutewinter/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
"}}}
" Session {{{
" ---------------
Bundle 'xolox/vim-session'
let g:session_autosave=0
let g:session_autoload=0
nnoremap <leader>os :OpenSession<CR>
"}}}
" SpeedDating {{{
" ---------------
Bundle 'tpope/vim-speeddating'
let g:speeddating_no_mappings=1 " Remove default mappings (C-a etc.)
nmap <silent><leader>dm <Plug>SpeedDatingDown
nmap <silent><leader>dp <Plug>SpeedDatingUp
nmap <silent><leader>dn <Plug>SpeedDatingNowUTC
"}}}
" Tabular {{{
" ---------------
Bundle 'godlygeek/tabular'
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>
nmap <Leader>t> :Tabularize /=>\zs<CR>
vmap <Leader>t> :Tabularize /=>\zs<CR>
nmap <Leader>t- :Tabularize /-<CR>
vmap <Leader>t- :Tabularize /-<CR>
nmap <Leader>t" :Tabularize /"<CR>
vmap <Leader>t" :Tabularize /"<CR>
"}}}
" Fugitive {{{
" ---------------
Bundle 'tpope/vim-fugitive'
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gp :Git push<CR>
" Mnemonic, gu = Git Update
nmap <Leader>gu :Git pull<CR>
nmap <Leader>gd :Gdiff<CR>
" Exit a diff by closing the diff window
nmap <Leader>gx :wincmd h<CR>:q<CR>
"}}}
" ctrlp.vim {{{
" ---------------
Bundle 'kien/ctrlp.vim'
" Ensure Ctrl-P isn't bound by default
let g:ctrlp_map = ''

" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10

" Conditional Mappings
if has('unix')
  let g:ctrlp_map = '<C-t>'
else
  let g:ctrlp_map = '<M-t>'
endif

" Leader Commands
nnoremap <leader>t :CtrlPRoot<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" Always use CtrlP for most recently used files and relative dierctory.
if has('unix')
  nnoremap <silent><C-u> :CtrlPCurFile<CR>
  nnoremap <silent><C-m> :CtrlPMRUFiles<CR>
else
  nnoremap <silent><M-u> :CtrlPCurFile<CR>
  nnoremap <silent><M-m> :CtrlPMRUFiles<CR>
endif

" Also map leader commands
nnoremap <leader>u :CtrlPCurFile<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
"}}}
" Powerline {{{
" ---------------
Bundle 'Lokaltog/vim-powerline'
" Keep ^B from showing on Windows in Powerline
if has('win32') || has('win64')
  let g:Powerline_symbols = 'compatible'
elseif has('unix')
  let g:Powerline_symbols = 'fancy'
endif
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
"}}}
" easymotion {{{
" ---------------
Bundle 'Lokaltog/vim-easymotion'
"}}}
" colorv {{{
" ---------------
Bundle 'Rykka/colorv.vim'
"}}}
" quickfixsigns {{{
" ---------------
Bundle 'tomtom/quickfixsigns_vim'
"}}}
" vim-surround {{{
" ---------------
Bundle 'tpope/vim-surround'
"}}}
" nerdcommenter {{{
" ---------------
Bundle 'scrooloose/nerdcommenter'
"}}}
" delimitMate {{{
" ---------------
Bundle 'Raimondi/delimitMate'
"}}}
"}}}
