"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  "" yapf (Google's Python Code formatter)
  call dein#add('google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' })

  "" vim-solarized8 (color theme)
  call dein#add('lifepillar/vim-solarized8')

  "" vim-evanesco (nicer search)
  call dein#add('pgdouyon/vim-evanesco')

  "" nerdtree (tree explorer)
  call dein#add('scrooloose/nerdtree')

  "" vim-commentary (Comment stuff out...)
  call dein#add('tpope/vim-sensible')

  "" vim-surround (easily delete, change, and add surroundings in pairs)
  call dein#add('tpope/vim-surround')

  "" vim-repeat (improved . command)
  call dein#add('tpope/vim-repeat')

  "" vim-commentary (Comment stuff out...)
  call dein#add('tpope/vim-commentary')

  "" vim-airline (better status bar)
  call dein#add('vim-airline/vim-airline')

  "" vim-airline themes (status bar themes)
  call dein#add('vim-airline/vim-airline-themes')

  "" async (normalize commands between neovim and vim)
  call dein#add('prabirshrestha/async.vim')

  "" asyncomplete (async completion engine)
  call dein#add('prabirshrestha/asyncomplete.vim')

  "" asyncomplete-lsp (lsp support for asyncomplete)
  call dein#add('prabirshrestha/asyncomplete-lsp.vim')

  "" vim-lsc (language server client)
  call dein#add('prabirshrestha/vim-lsp')

  "" vim-clang-format
  call dein#add('rhysd/vim-clang-format')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
"

"" Basic stuff
set autochdir                   " automatically make current working dir the same as current buffer's file
set browsedir=current           " make browsing directory the current working
set cc=80                       " Color column
set clipboard=unnamedplus
set formatoptions+=t            " Make wrapping occur at word boundaries
set mouse=a
set number
set textwidth=79                " Wrap lines longer than 80 characters
set history=50                  " keep 50 lines of command line history
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
"" Turn backups off (use git instead...)
set nobackup
set nowb
set noswapfile


"" Toggle line numbers
nmap <C-l><C-l> :set invnumber<CR>

""""""""""""""""""
"" clang-format ""
""""""""""""""""""

"" Set base style
let g:clang_format#code_style = "google"

"" Set extra style options
let g:clang_format#style_options = {"ColumnLimit" : 80,
                                  \ "DerivePointerAlignment" : "false",
                                  \ "PointerAlignment" : "Left"}

"" Manually select specific clang-format version
let g:clang_format#command = "clang-format-9"

"" Turn on clang-format on buffer write by default
let g:clang_format#auto_format = 0

"" Toggle clang-format formatting on buffer write
nmap <Leader>C :ClangFormatAutoToggle<CR>
nmap <Leader>F :ClangFormat<CR>

""""""""""""""""""""""""""
"" Text, tab and indent ""
""""""""""""""""""""""""""
au FileType bzl setl shiftwidth=4 softtabstop=4 et
au FileType python setl shiftwidth=4 softtabstop=4 et
au FileType c setl shiftwidth=2 softtabstop=2 et
au FileType cpp setl shiftwidth=2 softtabstop=2 et
au FileType vim setl shiftwidth=4 softtabstop=4 et
au FileType python setl shiftwidth=4 softtabstop=4 et
au FileType tex setl shiftwidth=4 softtabstop=4 et
au FileType markdown setl shiftwidth=4 softtabstop=4 et
au FileType groovy setl shiftwidth=4 softtabstop=4 et
au FileType cmake setl shiftwidth=4 softtabstop=4 et
au FileType matlab setl shiftwidth=4 softtabstop=4 et
au FileType sh setl shiftwidth=4 softtabstop=4 et
au FileType json setl shiftwidth=2 softtabstop=2 et


"""""""""""""
"" vim-lsc ""
"""""""""""""

"" Enable signs (warnings, info, etc)
let g:lsp_signs_enabled = 1

"" Enable diagnostics
let g:lsp_diagnostics_enabled = 1

"" Set sign for errors
let g:lsp_signs_error = {'text': '✗'}

"" Set sign for warning
let g:lsp_signs_warning = {'text': '⚠'}

"" Set sign for hint/info
let g:lsp_signs_hint = {'text': 'Ⓘ'}

"" Show diagnostics under cursor in normal mode
let g:lsp_diagnostics_echo_cursor = 1

"" Use async completion
let g:lsp_async_completion = 1

"" Language server protocol logging
let g:lsp_log_verbose = 0

"" Language server protocol logging file
let g:lsp_log_file = expand('~/tmp/vim-lsp.log')

"" Mapping for Rename
nnoremap mR :LspRename<CR>

"" Mapping for GoTo Definition
nnoremap md :LspDefinition<CR>

"" Mapping for GoTo Declaration
nnoremap mD :LspDeclaration<CR>

"" Mapping for running a CodeAction
nnoremap ma :LspCodeAction<CR>

"" Mapping for Format
nnoremap mf :LspDocumentFormat<CR>

"" Mapping for visual selection Format
vnoremap mf :LspDocumentRangeFormat<CR>

"" Mapping for show Document Symbol
nnoremap mS :LspDocumentSymbol<CR>

"" Mapping for showing Implementation of Interface
nnoremap mI :LspImplementation<CR>

"" Mapping for Find References
nnoremap mr :LspReferences<CR>

"" Mapping for Type Definition
nnoremap mT :LspTypeDefinition<CR>

"" Mapping for search/show Workspace Symbol
nnoremap ms :LspWorkspaceSymbol<CR>

"" Setup clangd integration
"" TODO: find a way to make shell alias found, or set up symlinks so clangd-9
""       can be changed to clangd
"" TODO: Figure out why $HOME doesn't expand after --compile-commands-dir
if executable('clangd-9')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd-9', '--compile-commands-dir=/home/lukepeterson/tmp']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

"" Setup python integration
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
        \ })
endif


""""""""""""""""""""""
"" Colors and fonts ""
""""""""""""""""""""""

"" Set color scheme
set background=dark
silent! colorscheme solarized8

"" Set vim-airline theme
let g:airline_theme='badwolf'

"" Set standard encoding to UTF-8
set encoding=utf8

"" Set standard file type to Unix
set ffs=unix,dos,mac


""""""""""""""
"" Mappings ""
""""""""""""""

"" yapf auto format whole file (ctrl+<y>)
map <C-Y> ggvG$:call yapf#YAPF()<cr>

"" yapf auto format current buffer
map <C-B> :call yapf#YAPF()<cr>

"" Toggle for NerdTree
map <C-N> :NERDTreeToggle<CR>
