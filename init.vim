"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/lukepeterson/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/lukepeterson/.cache/dein')
  call dein#begin('/home/lukepeterson/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/lukepeterson/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
