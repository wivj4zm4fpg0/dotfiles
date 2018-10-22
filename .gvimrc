set guioptions-=T "GUIでツールバーを隠す
set guioptions-=m "メニューバーを非表示

if has('unix')
    set guifont=Monospace\ Regular\ 14 "GUIでフォントを指定する
endif
if has('win32') || has('win64')
    set guifont=Migu_1M:h12:cSHIFTJIS:qDRAFT
endif

set guioptions-=r "スクロールバーを消す
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

colorscheme molokai "カラースキームを使う
set guioptions-=e "CUIベースのタブを使う

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
