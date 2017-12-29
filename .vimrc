" .vimrc File

"------------------------"
"VIM-PLUG PLUGIN SETTINGS" 
"------------------------" 
" https://github.com/junegunn/vim-plug
" PlugInstall [name ...] [#threads]	Install plugins
" PlugUpdate [name ...] [#threads]	Install or update plugins
" PlugClean[!]	Remove unused directories (bang version will clean without prompt)
" PlugUpgrade	Upgrade vim-plug itself
" PlugStatus	Check the status of plugins
" PlugDiff	Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]	Generate script for restoring the current snapshot of the PlugInstall

call plug#begin('~/.vim/plugged')

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'
" With bufexplorer, you can quickly and easily switch between buffers by using the one of the default public interfaces
Plug 'jlanzarotta/bufexplorer'
" ColorV is a color view/pick/edit/design/scheme tool in vim.
Plug 'Rykka/colorv.vim'
" emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'othree/jspc.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/AutoComplPop'
Plug 'kopischke/vim-fetch'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-pug'
Plug 'wavded/vim-stylus'
Plug 'tpope/vim-surround'

Plug 'sjl/badwolf'

call plug#end()

"Forget compatibility with Vi. Who cares.
set nocompatible

"Stop hiding shit
set conceallevel=1

"Enable filetypes
filetype on
filetype plugin on
filetype indent on

if !exists("g:syntax_on")
  syntax enable
endif

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in lower right corner.
set ruler

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

"Ever notice a slight lag after typing the leader key + command? This lowers "the timeout.
set timeoutlen=500

"Switch between buffers without saving
set hidden

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Show lines numbers
set number

"Prefer relative line numbering?
set relativenumber

"Indent stuff
set smartindent
set autoindent


"Better line wrapping 
set wrap
set textwidth=79
set formatoptions=qrn1

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip

"Enable code folding
set foldenable

"Hide mouse when typing
set mousehide

"Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf

" Create dictionary for custom expansions
set dictionary+=/Users/Home/.vim/dict.txt

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Split windows below the current window.
set splitbelow              

"Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Set up an HTML5 template for all new .html files
"autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

"Map a change directory to the desktop - Mac specific
nmap ,d :cd ~/Desktop<cr>:e.<cr>

"Shortcut for editing  vimrc file in a new tab
nmap ,ev :tabedit $MYVIMRC<cr>

"Saves time; maps the spacebar to colon
nmap <space> :

"Automatically change current directory to that of the file in the buffer
" autocmd BufEnter * cd %:p:h

"Map code completion to , + tab
imap ,<tab> <C-x><C-o>

" More useful command-line completion
 set wildmenu

"Auto-completion menu
 set wildmode=list:longest

"Map escape key to jj -- much faster
imap jj <esc>

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

"Shortcut to buffers
nmap ,b :buffers

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
end
"
" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

"clear search by double return
nnoremap <CR> :noh<CR><CR>

"folding
set foldcolumn=3
set foldmethod=marker

set clipboard=unnamed

"------------------------"
"NERDTREE PLUGIN SETTINGS
"------------------------"
"Shortcut for NERDTreeToggle
nmap ,nt :NERDTreeToggle

"Show hidden files in NerdTree
let NERDTreeShowHidden=0

"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"--------------------------"
"INDENTLINE PLUGIN SETTINGS" 
"--------------------------" 
let g:indentLine_char = '|'
let g:indentLine_color_term = 239

"-----------------------"
"THEME PLUGIN SETTINGS" 
"-----------------------" 
colorscheme badwolf
g:badwolf_darkgutter = 1

"-----------------------"
"AIRLINE PLUGIN SETTINGS" 
"-----------------------" 
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_symbols.branch = ' '
let g:airline_symbols.readonly = ' '
let g:airline_symbols.linenr = ' '
