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
echo "~/codes/dwm"
echo "~/codes/scripts"
echo "~/codes/RaspberryPiFiles"
echo "~/codes/st"
echo ""
echo "to ~/dotfiles"
echo ""
echo "RSYNC OUTPUT:"
echo ""

rsync -av --delete ~/.bashrc ~/.vimrc ~/.tmux.conf ~/.Xresources ~/.zshrc ~/.vim ~/.config/i3 ~/.config/termite ~/codes/dotfiles

rsync -av --delete ~/.config/vimb/config ~/codes/dotfiles/vimb/
rsync -av --delete ~/codes/dwm ~/codes/dotfiles/
rsync -av --delete ~/codes/scripts ~/codes/dotfiles/
rsync -av --delete ~/codes/RaspberryPiFiles ~/codes/dotfiles/
rsync -av --delete ~/codes/st ~/codes/dotfiles/

