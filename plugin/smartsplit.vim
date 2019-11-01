"
" TITLE:   VIM-SMARTSPLIT
" AUTHOR:  Daniel Moch <daniel AT danielmoch DOT com>
" LICENSE: VIM LICENSE
" VERSION: 0.2.0-dev
"
if exists('g:loaded_smartsplit') || &cp
    finish
endif

let g:loaded_smartsplit = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:WinWidth()
    let l:textwidth = &tw ? (&tw + 8) : 80
    if &number
        let l:numwidth = &numberwidth > len(line('$')) + 1 ?
                    \ &numberwidth : len(line('$')) + 1
    else
        let l:numwidth = 0
    endif
    return winwidth(0) > (2 * l:textwidth) + (2 * l:numwidth)
endfunction

function! s:ScratchBuffer() abort
    let l:wincmd = s:WinWidth() ? 'vnew' : 'new'
    exec l:wincmd
    setlocal bufhidden=hide buftype=nofile noswapfile
endfunction

function! s:DiffOpt()
    if s:WinWidth()
        set diffopt+=vertical
    else
        set diffopt-=vertical
    endif
endfunction

function! s:NewWindow(...)
    if a:0 == 0
        let l:filename = ''
    else
        let l:filename = a:1
    endif
    if s:WinWidth()
        execute 'vnew '.l:filename
    else
        execute 'new '.l:filename
    endif
endfunction

function! s:Help(topic)
    if s:WinWidth()
        execute 'vert help '.a:topic
    else
        execute 'help '.a:topic
    endif
endfunction

function! s:Buffer(...)
    let l:splitcmd = s:WinWidth() ? 'vsplit' : 'split'
    execute l:splitcmd
    if a:0 == 1
        execute bufnr(a:1).'buffer'
    endif
endfunction

function! s:CmdSplit(command)
    if s:WinWidth()
        execute 'vertical '.a:command
    else
        execute a:command
    endif
endfunction

augroup smartsplit
    autocmd!
    autocmd VimResized * call <sid>DiffOpt()
    autocmd VimEnter * call <sid>DiffOpt()
augroup END

command! -complete=file -nargs=? New call <sid>NewWindow(<f-args>)
command! -complete=help -nargs=1 Help call <sid>Help(<f-args>)
command! -complete=buffer -nargs=1 Buffer call <sid>Buffer(<f-args>)
command! -complete=command -nargs=1 CmdSplit call <sid>CmdSplit(<f-args>)
command! Split call <sid>Buffer()
command! ScratchBuffer call <sid>ScratchBuffer()

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: et sts=4 sw=4 tw=72
