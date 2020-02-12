" Fichero de configuración de vim, por José Carlos Cuevas

" Make sure we use Python 3
" Return to Python 2.x running with vim --cmd 'let py2 = 1'
if exists('py2') && has('python')
elseif has('python3')
endif

" Vundle plugin manager
set nocompatible
" filetype off
filetype plugin on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Best code completion
Plugin 'Valloric/YouCompleteMe' 

" Elixir syntax support
Plugin 'elixir-lang/vim-elixir'

" Fuzzy file search
Plugin 'kien/ctrlp.vim'

" Git support
Plugin 'tpope/vim-fugitive'

" Surround Vim
Plugin 'tpope/vim-surround'

" Fancy status lines
Plugin 'bling/vim-airline'

" Support for Handlebars
Plugin 'mustache/vim-mustache-handlebars'

" Support for Ag
Plugin 'rking/ag.vim'

" Support javascript
Plugin 'pangloss/vim-javascript'

" Best python plugin
Plugin 'klen/python-mode'

" Library for xolox plugins
Plugin 'xolox/vim-misc'

" Makes sure ctags are updated
Plugin 'xolox/vim-easytags'

" Multiple cursors support
Plugin 'terryma/vim-multiple-cursors'

" Slimv for Lisp and derivates
Plugin 'kovisoft/slimv'

" Rust language support
Plugin 'rust-lang/rust.vim'

" Pico 8 edition support
Plugin 'justinj/vim-pico8-syntax'

" Support for golang
Plugin 'fatih/vim-go'

" VimWiki
Plugin 'vimwiki/vimwiki'

" Support for Slim templates
Plugin 'slim-template/vim-slim'

" Support for Vuejs
Plugin 'posva/vim-vue'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Latex
Plugin 'vim-latex/vim-latex'

" Jedi
Plugin 'davidhalter/jedi-vim'

" Live preview
" Plugin 'xuhdev/vim-latex-live-preview'

" ACK search
" https://github.com/ggreer/the_silver_searcher
Plugin 'mileszs/ack.vim'

call vundle#end()
filetype plugin indent on

let mapleader = ","

" NERDTree
nnoremap <Leader>m :NERDTreeToggle<CR>

" Spell
nnoremap <Leader>s ]s

let g:ackprg = 'ag --nogroup --nocolor --column'

" Ajustes generales de edición
set cursorline
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set pastetoggle=<F2>
set nu
set scrolloff=4
set nowrap
set laststatus=2    " Muestra la status line siempre
" set foldmethod=indent
" set foldnestmax=2
set guifont=Inconsolata\ Medium\ 18
let g:VCSCommandCommitOnWrite=0

" Activamos para que funcionen los plugins
set nocompatible
syntax enable

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar

" Activar o desactivar la barra de menu con Ctrl-F1
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" Mejorar el cifrado
set cm=blowfish

" Opciones de CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" Para que el refresco sea más rápido, instalar the_silver_searcher
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'

" Almacena los .swp en este directorio
set directory=$HOME/.vim/tmp/swp//
set backupdir=$HOME/.vim/tmp/backup//

" Colores guays
colo jellybeans

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Configuración de AirLine
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#checks = []
let g:airline_section_warning = ''
let g:airline#extensions#branch#displayed_head_limit = 15


" Opciones para NeoVim
if has('nvim')
   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
   let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
   colo jellybeans
endif
" Comandos extras para ConqueTerm
let g:ConqueTerm_TERM='xterm'
ca terminal ConqueTerm zsh
ca ipython ConqueTerm ipython

" Configuracion de TagList
let Tlist_Use_Horiz_Window = 1
let Tlist_Show_One_File = 1
nnoremap <Leader>t :TlistToggle<CR>

" Comando para activar el developer mode
:command DeveloperMode TlistOpen | NERDTree

" Comando para copiar la selección
" apt install xclip
vnoremap <Leader>y :w !xclip -sel clip<CR>

" Comando para reindentar el fichero
nnoremap <Leader>= :call Formatreindent()<CR>

function! Formatreindent()
      let winview = winsaveview()
        execute "normal! gg=G"
          call winrestview(winview)
      endfunction

" Config de vim-easytags
set tags=./tags;
let g:easytags_dynamic_files = 1

" YouCompleteMe y sus opciones
"" Que se cierre la preview tras aceptar o salir de insert
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Ajustes segun tipo de fichero
" Elimina espacios extras al final de las líneas (en Python se encarga
" Python-Mode)
autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e
"" Esta línea activa el tipo de fichero Haxe
autocmd BufNewFile,BufRead *.hx set filetype=haxe
autocmd BufNewFile,BufRead *.hbs set ft=html
"" autocmd FileType python compiler pylint
"" Opciones de C
let c_c_vim_compatible = 0
let c_gnu = 0

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_python = 'python3'
let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
" let g:pymode_lint_checker = "python3 -m pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
" Ignore certain errors
let g:pymode_lint_ignore = ["E501", "E127", "E128", "C901"]

" Virtualenv support
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>d'

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_slow_sync = 1

" Don't autofold code
let g:pymode_folding = 0

" Remove red column at the end
" let g:pymode_options_colorcolumn = 0

" Golang plugin options
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

" JSON and XML beautifiers
function! DoPrettyJson()
      " clone the current buffer, we want a scratch buffer.
      badd %
      setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
      silent %!python -m json.tool 
      silent %<
    endfunction
    command! Json call DoPrettyJson()

function! DoPrettyXML()
      " clone the current buffer, we want a scratch buffer.
      badd %
      setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
      " save the filetype so we can restore it later
      let l:origft = &ft 
      set ft= 
      " delete the xml header if it exists. This will
      " permit us to surround the document with fake tags
      " without creating invalid xml.
      1s/<?xml .*?>//e
      "read !xml-parser % " This is for Mac os x
      silent %!tidy -xml -utf8 -i -q -
      " restore the 'normal' indentation, which is one extra level
      " too deep due to the extra tags we wrapped around the document.
      "silent %<
      " back to home
      1
      " restore the filetype
      exe "set ft=" . l:origft
    endfunction
    command! Xml call DoPrettyXML()

" VimWiki options
let wiki = {}
let wiki.path = '~/cloud/vimwiki/'
let wiki.path_html = '~/vimwiki_html/'
let wiki.nested_syntaxes = {'python': 'python', 'cpp': 'cpp', 'scheme': 'scheme', 'java': 'java'}
let g:vimwiki_list = [wiki]

" Run spell if is a latex file
autocmd BufNewFile,BufRead *.tex set spell
autocmd BufNewFile,BufRead *.tex set spelllang=es

autocmd BufNewFile,BufRead *.tex set wrap

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
