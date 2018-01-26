syntax on

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'

" Whitespaces
Plugin 'ntpeters/vim-better-whitespace'

" Autoclose HTML tags
Plugin 'alvan/vim-closetag'

" Added elixir support
Plugin 'elixir-editors/vim-elixir'

" TagBar
Plugin 'majutsushi/tagbar'

" Syntactic
Plugin 'vim-syntastic/syntastic'

" SQL highlighting
Plugin 'shmup/vim-sql-syntax'

" Command-T
Plugin 'wincent/command-t'

" CoffeScript
Plugin 'kchmck/vim-coffee-script'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" NERDtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Syntastic
let g:syntastic_python_checkers = ['pylint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Spaces
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

autocmd BufNewFile,BufRead *.py set tabstop=8 shiftwidth=4 softtabstop=4 expandtab
autocmd BufNewFile,BufRead *.coffee set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd BufNewFile,BufRead *.ex set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Limit python code
autocmd BufNewFile,BufRead *.py set colorcolumn=80

" Whitespaces
autocmd BufEnter * EnableStripWhitespaceOnSave

" TagBar
nmap <F8> :TagbarToggle<CR>

augroup filetypedetect
  au BufRead,BufNewFile *.q setfiletype sql
augroup END
