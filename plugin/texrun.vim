scriptencoding utf-8

" 二度読み込むことを防ぐ
if exists('g:loaded_texrun')
  finish
else
  let g:loaded_texrun = 1
endif

" ユーザ設定を一時退避
let s:save_cpo = &cpo
set cpo&vim

augroup entercmd
  autocmd!
  autocmd VimEnter * call texrun#texrun_init()
augroup END

" 退避していたユーザ設定を戻す
let &cpo = s:save_cpo
unlet s:save_cpo
