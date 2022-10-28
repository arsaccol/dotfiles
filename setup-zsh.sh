#!/bin/sh

sudo apt install -y zsh &&
chsh -s $(which zsh)

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
