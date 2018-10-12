if !1 | finish | endif "vim.tinyで読み込ませない
set expandtab "TABで空白を入力する
set tabstop=4 "TABで入力される幅
set shiftwidth=4 "自動インデントでずれる幅
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set cindent "C言語風のインデントをつける
set t_Co=256 "ターミナルで256色表示を使う
set ignorecase "検索時大文字小文字を区別しない
set smartcase "大文字で検索するときだけ大文字小文字を区別する
set ruler "ルーラーの表示
set list "TAB,EOFなどを可視化する
set wildmenu "TABでファイル名を補完する？
set nf=hex "インクリメントで10進数を使う
set number "行番号を表示する
set nowrap "右端で折り返さない
set backspace=indent,eol,start "バックスペースの不具合をなくす
set cursorline "今いる行をハイライトする
"let loaded_matchparen = 1 "括弧の強調を抑制する
syntax on "構文に色を分ける(viでは使えない)
set scrolloff=1000 "カーソルの位置を真ん中に調整
set clipboard=unnamedplus "クリップボード
"削除キーでヤンクしない
"nnoremap x "_x 
"nnoremap d "_d
"nnoremap D "_D
"Shift+j,kでタブを移動
nnoremap J gT
nnoremap K gt
"tで新しいタブ
nnoremap t :tabnew<CR>
autocmd FileType make setlocal noexpandtab "Makefileで普通にタブを使用する
nnoremap <M> :tabnew<CR>
set showtabline=2 "タブを常に表示

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/unite.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('sophacles/vim-processing')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

let g:lightline = {'colorscheme': 'wombat'}
