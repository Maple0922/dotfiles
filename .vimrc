filetype plugin indent on

syntax on

" Appearance
set nowrap "はみ出しても改行しない
set autoindent "カレント行のインデントをキープ
set smartindent "自動インデント(C向け)
set ruler "右下に現在の行数、文字数など表示
set showmatch "括弧の対応関係を一瞬表示する
set number "左端に行数を表示

" Input
set wildmenu "ファイル名を補完する
set showcmd "入力中のコマンドが表示される
set shiftwidth=2 "自動インデントで入るスペースの数
set softtabstop=2 "tabを押した時に入るスペースの数
set expandtab "タブをスペースに変換
set tabstop=2 "ファイル上のtab文字の幅
set smarttab "tabを押した際にshiftwidth分のスペースが挿入される
set clipboard=unnamed,autoselect "ヤンクした文字列をクリップボードにコピー

" Search
set wrapscan "検索時に最後のワードまで行ったら最初に戻る
set hlsearch "検索したワードにハイライトを表示
set ignorecase "検索時に大小文字の区別を付けない
set smartcase "検索時に小文字で入力した時のみ大小文字の区別をつけない

" Other
set noswapfile "スワップファイルを生成しない


" Shortcut
map <C-n> :NERDTreeToggle<CR>


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
