set encoding=utf8
set nocompatible
set nowrap
filetype off 


" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nvie/vim-flake8'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'gregsexton/Gravity'
Plugin 'gregsexton/MatchTag'
Plugin 'dkprice/vim-easygrep.git'
Plugin 'tpope/vim-fugitive'
Bundle 'lrvick/Conque-Shell'
Plugin 'sjl/gundo.vim'
Plugin 'koron/minimap-vim'
Plugin 'wikitopian/hardmode'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'reedes/vim-wordy'
Plugin 'Chiel92/vim-autoformat'
Plugin 'yegappan/greplace'
Plugin 'Yggdroot/indentLine'
Plugin 'chriskempson/base16-vim'
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'NerdyPepper/chestnut.vim'


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
let g:one_allow_italics = 1 
set t_Co=16
set colorcolumn=80,160,240,320,400,480,560
highlight ColorColumn guibg=Gray14
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

" move vertically by visual line
nnoremap j gj
nnoremap k gk

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

" Folding with space
nnoremap <space> za
vnoremap <space> zf

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

" No cursor blink
set guicursor=a:blinkon0

" System clipboard
set clipboard+=unnamedplus

" Spell checking

set spell " Enable spell checking
set spelllang=en,hu,pt,es,ca,ro,de


set mouse=a
set noshowmode
set noru
set laststatus=0

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Cursor

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
