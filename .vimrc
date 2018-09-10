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
