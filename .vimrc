set encoding=utf8
set nocompatible
set nowrap
filetype off 


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Set up plugins here
Plugin 'gmarik/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
"Plugin 'junegunn/seoul256.vim'
Plugin 'mileszs/ack.vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'ivalkeen/vim-ctrlp-tjump'
"Plugin 'kchmck/vim-coffee-script'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nvie/vim-flake8'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'MarcWeber/vim-addon-mw-utils' " Needed by snipmate
Plugin 'tomtom/tlib_vim' " Needed by snipmate
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
"Plugin 'vim-scripts/AutumnLeaf'
Plugin 'gregsexton/Gravity'
Plugin 'gregsexton/MatchTag'
"Plugin 'blerins/flattown'
"Plugin 'vim-scripts/candycode.vim'
"Plugin 'chriskempson/vim-tomorrow-theme'
"Plugin 'jnurmine/Zenburn'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-colorscheme-switcher'
"Plugin 'morhetz/gruvbox'
"Plugin 'SirVer/ultisnips'
Plugin 'dkprice/vim-easygrep.git'
Plugin 'tpope/vim-fugitive'
"Plugin 'elentok/plaintasks.vim'
Bundle 'lrvick/Conque-Shell'
Plugin 'sjl/gundo.vim'
"Plugin 'koron/minimap-vim'
"Plugin 'wikitopian/hardmode'
"Plugin 'elixir-lang/vim-elixir'
Plugin 'airblade/vim-gitgutter'
"Plugin 'NLKNguyen/papercolor-theme'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'reedes/vim-wordy'
"Plugin 'junegunn/limelight.vim'
"Plugin 'Chiel92/vim-autoformat'
"Plugin 'ternjs/tern_for_vim'
Plugin 'yegappan/greplace'
"Plugin 'Yggdroot/indentLine'
Plugin 'itchyny/lightline.vim'
Plugin 'chriskempson/base16-vim'


call vundle#end()
filetype plugin indent on


" Custom settings for EasyMotion
let g:EasyMotion_leader_key = '<leader>'
nmap <Space> <Plug>(easymotion-overwin-w)


" More convinient way to use system clipboard
if has('clipboard')
    if has('unnamedplus') " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif


" Line numbering
set nu
set relativenumber


" Look & Feel
" colorscheme solarized
 "colorscheme autumnleaf
" colorscheme flattown
" colorscheme gruvbox
"colorscheme inkpot
"colorscheme colorsbox-material
let g:one_allow_italics = 1 
"set t_Co=256
set t_Co=16
"colorscheme calmar256-light
colorscheme base16-oceanicnext
set guifont=Inconsolata-g\ for\ Powerline\ Medium\ 10
"set guifont=Inconsolata-g\ for\ Powerline\ Medium\ 11
 "set guifont=Input\ Mono\ Semi-Light\ 11
"set guifont=Inconsolata\ 11
"set guifont=M+\ 2m\ 9
set linespace=3
set colorcolumn=80,160,240,320,400,480,560
highlight ColorColumn guibg=Gray14
set cursorline
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=m  "remove menu bar
syntax on


" Settings for search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present


" Ack settings
map <C-F> :Ack 
" Use ag instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" When you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ag and put the cursor in the right position
map <leader>g :Ag 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>


" NERDTree settings
map <C-K><C-B> :NERDTreeToggle<CR>


" CtrlP settings
map <C-T> :CtrlPBufTagAll<Return>
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(env|git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|swp)$',
  \ }
" Use ag to speed up CtrlP
" Use .agignore (with .gitignore syntax) to ignore files
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'


" Indentation settings
set autoindent " Indent at the same level of the previous line
set shiftwidth=4 " Use indents of 4 spaces
set expandtab " Tabs are spaces, not tabs
set tabstop=4 " An indentation every four columns
set softtabstop=4 " Let backspace delete indent
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)


" History settings
set history=1000 " Longer edit history


" save with Ctrl-S
map <C-S> :w<RETURN>


" move vertically by visual line
nnoremap j gj
nnoremap k gk


" Hide the mouse cursor while typing
set mousehide


" persistent undo
" http://stackoverflow.com/a/22676189
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " No console pops up
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif


" Wildmenu settings
set wildmode=longest,list,full
set wildmenu


" SnipMate settings
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-space>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>


" Tagbar mapping
nmap <C-F4> :TagbarToggle<CR>

" Folding with space
"nnoremap <space> za
"vnoremap <space> zf

" YCM tuning
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" Set to auto read when a file is changed from the outside
set autoread

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
if has('nvim')
    nmap <BS> <C-W>h
endif

" Jump to line
nmap <Return> <Plug>(easymotion-overwin-line) ko

" Autocompletion for words
set dictionary=/usr/share/dict/words
set complete+=k

" Show hidden files
let NERDTreeShowHidden=1

" Hide files from tree
let NERDTreeIgnore = ['\.pyc$', '\.cache', '__pycache__', '.git', 'env', 'env2', 'env3', 'venv']

" Disable colors in shells
let g:ConqueTerm_Color = 0

" Hide mode (it's on the bar)
set noshowmode

" Lightline conf

let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component': {
            \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
            \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
            \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
            \ },
            \ 'component_visible_condition': {
            \   'readonly': '(&filetype!="help"&& &readonly)',
            \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
            \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
            \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
            \ }


" No cursor blink
set guicursor=a:blinkon0

" System clipboard
set clipboard+=unnamedplus

" Spell checking

set spell " Enable spell checking
set spelllang=en,hu,pt,es,ca,ro,de



