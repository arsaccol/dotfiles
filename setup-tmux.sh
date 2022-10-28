#!/bin/sh

if [ $(id -g) -eq 0 ];
    then echo "You must NOT run this script as sudo, otherwise it'll screw up our \$HOME expansions"
    exit
fi

echo "If you're running this as sudo, we shouldn't get here"


sudo apt install -y tmux &&
echo $HOME/.tmux.conf
symlink_points_to="$(pwd)/tmux/.tmux.conf"
symlink_location="$HOME/.tmux.conf"

echo "Creating symlink from $symlink_location to $symlink_points_to"
ln -sf $symlink_points_to $symlink_location

