# this script requires https://github.com/fx-wood/dev-env
# to be cloned into ~/

# install nvim
if grep -iq "raspberry" /proc/device-tree/model > /dev/null 2>&1; then
	echo "checking if we're on a raspberry pi"
	echo "raspberry pi detected, building neovim from source"
	echo "installing build deps"
	sudo apt-get -y install  ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
	git clone https://github.com/neovim/neovim
	cd neovim && git checkout stable
	make CMAKE_BUILD_TYPE=Release
	sudo make install
	sudo ln -s /usr/local/bin/nvim /usr/bin/nvim
    sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim 1
    sudo update-alternatives --set editor nvim
fi

mkdir -p ~/.config
sudo rm -rf ~/.config/nvim
ln -s ~/dev-env/nvim ~/.config

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# install zsh
sudo apt-get update && sudo apt-get upgrade 
sudo apt-get -y install zsh
sudo chsh -s /bin/zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo rm -rf ~/.zshrc
ln -s ~/dev-env/shell/.zshrc ~/.zshrc

