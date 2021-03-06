#!/bin/bash -eu

ln -sf $PWD/.gvimrc ~
ln -sf $PWD/.vimrc ~
ln -sf $PWD/.emacs.d ~
ln -sf $PWD/.spacemacs ~
ln -sf $PWD/.zshrc ~
ln -sf $PWD/.oh-my-zsh ~
ln -sf $PWD/.tmux.conf ~
ln -sf $PWD/peco ~/.config
ln -sf $PWD/.ideavimrc ~
ln -sf $PWD/.vim ~

mkdir ~/.config/nvim
ln -sf $PWD/.vimrc ~/.config/nvim/init.vim
