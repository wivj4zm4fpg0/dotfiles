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

"my setting-------------------------------

filetype off

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
set scrolloff=1000 "カーソルの位置を真ん中に調整
set clipboard=unnamedplus "クリップボード

"削除キーでヤンクしない
"nnoremap x "_x
"nnoremap d "_d
"nnoremap D "_D

autocmd FileType make setlocal noexpandtab "Makefileで普通にタブを使用する
set showtabline=2 "タブを常に表示
set autoread "外部からの変更を自動で読み込む
au FileType * setlocal formatoptions-=ro "改行時にコメントアウトしない

"余計なファイルを作らない
set noswapfile
set nobackup
set viminfo=
set noundofile

"特定の拡張子で挙動を変える
if has("autocmd")
    filetype plugin on
    filetype indent on
    autocmd filetype processing setlocal sw=4 sts=4 ts=4 et
    "autocmd filetype text set wrap
endif

"Shift+j,kでタブを移動
nnoremap J gT
nnoremap K gt

"折り返し行でのjkの挙動を変える
nnoremap j gj
nnoremap k gk

"tで新しいタブ
nnoremap t :tabnew<CR>

"Ctrl + s でファイル保存
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>a

"その他色々なキーバインドを変更する
nnoremap <C-j> o<ESC>
nnoremap <C-k> O<ESC>
noremap <C-p> <C-u>
noremap <C-n> <C-d>
nnoremap <C-q> :q!<CR>

" スペースキーをリーダーキーにする
let mapleader = "\<Space>"
" リーダーキーを一回押すとeasymotionが起動するようにする
map <Leader> <Plug>(easymotion-prefix)

"ターミナルの色に同調させる
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

colorscheme molokai "カラースキームを使う

"コメントを暗い茶色にする
hi Comment ctermfg=94
"括弧のハイライトを見やすくする
hi MatchParen ctermfg=LightGreen ctermbg=blue

au FileType * setlocal formatoptions-=ro "改行時にコメントアウトをしない

set belloff=all "ビープ音を鳴らさないようにする

"end my setting---------------------------

"guitab setting--------------------------

" 個別のタブの表示設定をします
function! GuiTabLabel()
    " タブで表示する文字列の初期化をします
    let l:label = ''

    " タブに含まれるバッファ(ウィンドウ)についての情報をとっておきます。
    let l:bufnrlist = tabpagebuflist(v:lnum)

    " 表示文字列にバッファ名を追加します
    " パスを全部表示させると長いのでファイル名だけを使います 詳しくは help fnamemodify()
    let l:bufname = fnamemodify(bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')
    " バッファ名がなければ No title としておきます。ここではマルチバイト文字を使わないほうが無難です
    let l:label .= l:bufname == '' ? 'No title' : l:bufname

    " タブ内にウィンドウが複数あるときにはその数を追加します(デフォルトで一応あるので)
    let l:wincount = tabpagewinnr(v:lnum, '$')
    if l:wincount > 1
        let l:label .= '[' . l:wincount . ']'
    endif

    " このタブページに変更のあるバッファがるときには '[+]' を追加します(デフォルトで一応あるので)
    for bufnr in l:bufnrlist
        if getbufvar(bufnr, "&modified")
            let l:label .= '[+]'
            break
        endif
    endfor

    " 表示文字列を返します
    return l:label
endfunction

" guitablabel に上の関数を設定します
" その表示の前に %N というところでタブ番号を表示させています
set guitablabel=%N:\ %{GuiTabLabel()}

"end guitab setting------------------------

"emacs setting------------------------

" insert mode
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill()<CR>

function! s:home()
    let start_column = col('.')
    normal! ^
    if col('.') == start_column
        | normal! 0
    endif
    return ''
endfunction

function! s:kill()
    let [text_before, text_after] = s:split_line()
    if len(text_after) == 0
        | normal! J
    else
        | call setline(line('.'), text_before)
    endif
    return ''
endfunction

function! s:split_line()
    let line_text = getline(line('.'))
    let text_after  = line_text[col('.')-1 :]
    let text_before = (col('.') > 1) ? line_text[: col('.')-2] : ''
    return [text_before, text_after]
endfunction

"end emacs setting---------------------------------
