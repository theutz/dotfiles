function! <SID>ToggleNumberStyle()
  let l:msg = 'Relative Number Mode: '
  if (&relativenumber == 1)
    set norelativenumber
    set number
    echom l:msg . 'Off'
  else
    set relativenumber
    echom l:msg . 'On'
  endif

  return ''
endfunction

nnoremap <Plug>(toggle-number-style) :call <SID>ToggleNumberStyle()<CR>
