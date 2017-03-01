#!/bin/bash

echo "Using rsync to backup:"
echo "~/.bashrc"
echo "~/.vimrc"
echo "~/.tmux.conf"
echo "~/.Xresources"
echo "~/.zshrc"
echo "~/.config/i3"
echo "~/.vim"
echo ""
echo "to ~/dotfiles"
echo ""
echo "RSYNC OUTPUT:"
echo ""

rsync -aAXv --delete ~/.bashrc ~/.vimrc ~/.tmux.conf ~/.Xresources ~/.zshrc ~/.vim ~/.config/i3 ~/codes/dotfiles

