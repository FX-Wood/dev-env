echo "raspberry pi detected, building neovim from source"
echo "installing build deps"
sudo apt-get -y install  ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
git clone https://github.com/neovim/neovim
cd neovim && git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install
sudo ln -s /usr/local/bin/nvim /usr/bin/nvim
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim 1
