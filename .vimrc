filetype plugin indent on

syntax on

" Appearance
set nowrap
set autoindent
set smartindent
set ruler
set showmatch
set number
set scrolloff=999
set splitbelow
set termwinsize=5x0
set cursorline

" Input
set wildmenu
set showcmd
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=2
set smarttab
set clipboard=unnamed,autoselect

" Search
set wrapscan
set hlsearch
set ignorecase
set smartcase

" Other
set autoread
set noswapfile


" Shortcut
map <C-n> :NERDTreeToggle<CR>


" Autocommand
function s:VimStart()

  execute 'term'
  execute 'wincmd k'
  execute 'vs'
  execute '14 wincmd >'
  execute 'NERDTreeToggle'
  execute 'wincmd l'

endfunction

autocmd VimEnter * if @% == '' | :call s:VimStart()

" Neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'scrooloose/nerdtree'

NeoBundle 'leafgarland/typescript-vim'

NeoBundle 'simeji/winresizer'
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1

NeoBundle 'Shougo/neocomplete'

NeoBundle 'jistr/vim-nerdtree-tabs'

call neobundle#end()


" Installation check.
if neobundle#exists_not_installed_bundles()
echomsg 'Not installed bundles : ' .
\ string(neobundle#get_not_installed_bundle_names())
echomsg 'Please execute ":NeoBundleInstall" command.'
"finish
endif

" Colorscheme
colorscheme monokai
syntax on
let g:monokai_original = 1
let g:rehash256 = 1
set background=dark
