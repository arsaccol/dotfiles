#!/bin/sh

echo "Hello there!"

echo "Linking nvim config"
ln -s ./nvim ~/.config/nvim

echo "Linking tmux config"
ln -s ./tmux/.tmux.conf ~/.tmux.conf


