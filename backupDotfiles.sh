#!/bin/bash

echo "Using rsync to backup:"
echo "~/.bashrc"
echo "~/.vimrc"
echo "~/.tmux.conf"
echo "~/.Xresources"
echo "~/.zshrc"
echo "~/.config/i3"
echo "~/.vim"
echo "~/.config/termite"
echo "~/.config/vimb/config"
echo ""
echo "to ~/dotfiles"
echo ""
echo "RSYNC OUTPUT:"
echo ""

rsync -av --delete --progress ~/.bashrc ~/.vimrc ~/.tmux.conf ~/.Xresources ~/.zshrc ~/.vim ~/.config/i3 ~/.config/termite ~/codes/dotfiles

rsync -av --delete --progress ~/.config/vimb/config ~/codes/dotfiles/vimb/
