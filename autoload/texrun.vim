scriptencoding utf-8

if !exists('g:loaded_texrun')
  finish
else
  let g:loaded_texrun = 1
endif

let s:save_cpo = &cpo
set cpo&vim

function! texrun#texrun_init()
  command! CompileLatex call s:compile_latex()
  augroup FlowWriteFile
    au!
    autocmd BufWritePost *.tex :call s:compile_latex()
  augroup END
endfunction

" Compile Latex
function! s:compile_latex()
  if expand("%") == g:texrun#file_name
    function! s:OnEvent(job_id, data, event) dict
      if a:event == 'stdout'
        let str = self.shell.' stdout: '.join(a:data)
        echom str
      elseif a:event == 'stderr'
        let str = self.shell.' stderr: '.join(a:data)
        echom str
      else
        let str = self.shell.' exited'
      endif
    endfunction
    let s:callbacks = {
          \ 'on_stdout': function('s:OnEvent'),
          \ 'on_stderr': function('s:OnEvent'),
          \ 'on_exit': function('s:OnEvent')
          \ }
    let cmd = '(cd ' . expand('%:h') . ' && lualatex --halt-on-error ' . expand('%:r') . ')'
    let s:job1 = jobstart(['zsh', '-c', cmd], extend({'shell': 'shell 1'}, s:callbacks))
  endif
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
