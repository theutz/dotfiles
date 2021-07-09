" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Terminal
command! -nargs=0 Terminal :CocCommand terminal.Toggle
command! -nargs=0 REPL :CocCommand terminal.REPL

" Dirvish
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>

