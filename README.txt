Before install all bundles with Vundle:
:PluginsInstall

# YouCompleteME

cd ~/.vim/bundle/YouCompleteMe
sudo apt install cmake build-essential
./install.py --clang-completer --js-completer

# Syntastic

mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle && git clone --depth=1 https://github.com/vim-syntastic/syntastic.git

Open vim and then:

:Helptags

