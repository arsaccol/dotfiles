#!/bin/sh

if [ $(id -g) -eq 0 ];
    then echo "You must NOT run this script as sudo, otherwise it'll screw up our \$HOME expansions"
    exit
fi


neovim_version="v0.8.0"
neovim_dl_url="https://github.com/neovim/neovim/releases/download/$neovim_version/nvim-linux64.deb"
neovim_dl_output="./downloads/nvim.deb"
echo "Download URL: " $neovim_dl_url
echo "Output file: " $neovim_dl_output


echo "Downloading Neovim..."
wget -O $neovim_dl_output $neovim_dl_url 
echo "Neovim downloaded!"

echo "Installing Neovim..."
sudo apt install -y ./downloads/nvim.deb &&
echo "Neovim downloaded!"

echo "Creating vim alias for nvim command..."
vim_to_nvim_alias="alias vim='nvim'"
echo $vim_to_nvim_alias >> ~/.bashrc &&
echo $vim_to_nvim_alias >> ~/.zshrc &&


echo "Alias created!"


"Linking local Neovim config to config from this repository..."
mkdir -p ~/.config &&
link_target=$(pwd)/nvim
link_path=$HOME/.config/nvim
echo "Link will be: " $link_target $link_path


ln -sf $link_target $HOME/.config/nvim &&
"Linking done!"


echo "Installing vim-plug plugin manager..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "vim-plug installed!"

echo "Installing Node.js for language server"
curl -sL install-node.vercel.app/lts | bash &&
echo "Node.js installed!"

echo "Setting up Neovim plugins"
nvim +PlugInstall +qall &&
nvim +CocInstall coc-json coc-tsserver +qall &&

echo "Neovim plugins set up!"




