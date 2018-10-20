"dein Scripts-----------------------------
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  if has('unix')
      execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
  endif
  if has('win32') || has('win64')
      execute 'set runtimepath^=' . s:dein_repo_dir
  endif
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  if has('unix')
      let g:rc_dir    = expand('~/.vim/rc')
  endif
  if has('win32') || has('win64')
      let g:rc_dir    = expand('~/vimfiles/rc')
  endif
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

syntax on "構文に色を分ける(viでは使えない)
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
set showtabline=2 "タブを常に表示
"Ctrl + s でファイル保存
nnoremap <C-s> :w<CR>
"Ctrl + x で行を切り取り
nnoremap <C-x> dd
nnoremap <C-j> o<ESC>
nnoremap <C-k> O<ESC>
nnoremap <C-a> 0
nnoremap <C-e> $
nnoremap <C-p> <C-u>
nnoremap <C-n> <C-d>
nnoremap <C-q> :q!<CR>
inoremap <C-[> <C-[>:w<CR>

"余計なファイルを作らない
set noswapfile
set nobackup
set viminfo=
set noundofile
