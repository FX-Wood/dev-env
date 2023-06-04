# this script requires https://github.com/fx-wood/.dotfiles
# to be cloned into ~/

configure_nvim() {
    echo "linking nvim config"
    mkdir -p ~/.config
    sudo rm -rf ~/.config/nvim
    ln -s ~/projects/.dotfiles/nvim ~/.config
    # start neovim so that packer gets downloaded
    nvim --headless -c 'echo "hello"' -c q
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -c q
    nvim --headless -c "TSInstallSync maintained" -c q
}

install_zsh() {
    echo "installing zsh and oh-my-zsh"
    sudo apt-get update && sudo apt-get upgrade 
    sudo apt-get -y install zsh
    sudo chsh -s /bin/zsh $USER
    # install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    sudo rm -rf ~/.zshrc
    sudo rm -rf ~/.zshrc.pre-oh-my-zsh
    ln -s ~/.dotfiles/shell/.zshrc ~/.zshrc
}

mac_set_keyboard_repeat() {
    echo "setting keyboard repeat speed, make sure to logout and log back in"
    defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
    defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
}

install_docker_engine() {
    echo "installing docker"
    sh -c "$(curl -fsSL https://get.docker.com)"
    sudo usermod -aG docker $USER
}

posix_install_nvm() {
    # node version manager
    # this won't work on windows, use the windows nvm project
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
}

if grep -iq "raspberry" /proc/device-tree/model > /dev/null 2>&1; then
	echo "raspberry pi detected"
    sh ./install-scripts/neovim-raspbian.sh
    configure_nvim
    install_zsh
    install_docker_engine
elif [ "$(uname -s)" = "Darwin" ] ; then
    echo "mac detected" 
    # install homebrew
    # install zsh (with homebrew)
    # add zsh to /etc/shells
    # install oh-my-zsh (curl command)
    # install iterm (this one might be tough)
    # change keyboard character repeat speed to "fast"
    mac_set_keyboard_repeat
    # delete zshrc
    # link .dotfiles zshrc to home one
    configure_nvim
    # install nerd fonts so that lualine will work
    brew tap homebrew/cask-fonts
    brew install font-hack-nerd-font
    # set iTerm non-ascii characters to nerd fonts
    # install nvm
    posix_install_nvm
    # add nvm to .zshrc (https://github.com/nvm-sh/nvm#installing-and-updating)
fi

