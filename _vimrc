source ~/.vimrc

autocmd BufRead *.hsp call FileTypeHsp()
function FileTypeHsp()
  compiler hsp
  set filetype=hsp
  noremap <F1> :execute "!\"c:\\app\\hsp351\\hsphelp\\helpman.exe\"" . " " . expand( "<cword>" )<CR>
  noremap <F5> :make<CR>
endfunction
