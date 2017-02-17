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
inoremap <ESC> <ESC>:set iminsert=0<CR>  " ESCでIMEを確実にOFF
set clipboard=unnamed,autoselect "クリップボード
"autocmd vimenter * NERDTreeToggle "起動時にファイラーを表示

"vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "ファイラー
call plug#end()
