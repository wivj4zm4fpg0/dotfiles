"set expandtab "TABで空白を入力する
"set tabstop=4 "TABで入力される幅
"set shiftwidth=4 "自動インデントでずれる幅
"set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
"set cindent "C言語風のインデントをつける
"colorscheme molokai "カラースキームを使う
"set t_Co=256 "ターミナルで256色表示を使う
"set ignorecase "検索時大文字小文字を区別しない
"set smartcase "大文字で検索するときだけ大文字小文字を区別する
"set ruler "ルーラーの表示
"set list "TAB,EOFなどを可視化する
"set wildmenu "TABでファイル名を補完する？
"set nf=hex "インクリメントで10進数を使う
"set number "行番号を表示する
"syntax on "文字に色をつける
"set nowrap "右端で折り返さない
"set backspace=indent,eol,start "バックスペースの不具合をなくす
"set cursorline "今いる行をハイライトする
set guioptions-=T "GUIでツールバーを隠す
set guifont=Monospace\ Regular\ 12 "GUIでフォントを指定する
"let loaded_matchparen = 1 "括弧の強調を抑制する
"set lines=40 "縦幅(GUI)
"set columns=120 "横幅(GUI)
set guioptions-=r "スクロールバーを消す
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
syntax on "構文毎に色を分ける
colorscheme molokai "カラースキームを使う
set guioptions+=a "ウインドウサイズや位置などを記憶
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
autocmd!
autocmd VimLeavePre * call s:save_window()
function! s:save_window()
let options = [
    \ 'set columns=' . &columns,
    \ 'set lines=' . &lines,
    \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
    \ ]
call writefile(options, g:save_window_file)
    endfunction
    augroup END

if filereadable(g:save_window_file)
    execute 'source' g:save_window_file
    endif
