#!/bin/bash

if [ ! -d ~/.vim/ ]; then
    echo "cloning https://github.com/theokanning/vim-files.git to ~/.vim"
    git clone https://github.com/theokanning/vim-files.git ~/.vim
else
    echo "~/.vim/ already exists. skipping."
fi

if [ ! -d ~/.vim/bundle/vundle ]; then
    echo "cloning https://github.com/gmarik/vundle.git to ~/.vim/bundle/vundle"
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
else
    echo "~/.vim/bundle/vundle already exists. skipping."
fi

if [ ! -d ~/.config ]; then
    mkdir -p ~/.config
fi

if [ ! -e ~/.config/nvim ]; then
    echo "symlinking ~/.vim to ~/.config/nvim"
    ln -s ~/.vim ~/.config/nvim
fi

if [ ! -e ~/.vimrc ] && [ ! -e ~/.ctags ] && [ ! -e ~/.gvimrc ]; then
    echo "symlinking ~/.vimrc ~/.ctags ~/.gvimrc"
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/ctags ~/.ctags
    ln -s ~/.vim/gvimrc ~/.gvimrc
else
    echo "one or more of ~/.vimrc ~/.ctags ~/.gvimrc exists, not creating symlinks:"
    echo "    ln -s ~/.vim/vimrc ~/.vimrc"
    echo "    ln -s ~/.vim/ctags ~/.ctags"
    echo "    ln -s ~/.vim/gvimrc ~/.gvimrc"
fi
echo "Disabling base16-default-dark theme until the bundle is installed"
sed -i -e 's/colorscheme base16-default-dark/"colorscheme base16-default-dark/' ~/.vimrc

echo "calling BundleInstall using vundle plugin"
vim +BundleInstall +qall

echo "Re-Enabling base16-default-dark theme now that bundle is installed"
sed -i -e 's/"colorscheme base16-default-dark/colorscheme base16-default-dark/' ~/.vimrc

echo "Done!"

