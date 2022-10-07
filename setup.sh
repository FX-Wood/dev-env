# this script requires https://github.com/fx-wood/dev-env
# to be cloned into ~/

configure_nvim() {
    echo "linking nvim config"
    # mkdir -p ~/.config
    # sudo rm -rf ~/.config/nvim
    # ln -s ~/dev-env/nvim ~/.config
    # nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}

install_zsh() {
    echo "installing zsh and oh-my-zsh"
    # sudo apt-get update && sudo apt-get upgrade 
    # sudo apt-get -y install zsh
    # sudo chsh -s /bin/zsh $USER
    # # install oh-my-zsh
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    # sudo rm -rf ~/.zshrc
    # sudo rm -rf ~/.zshrc.pre-oh-my-zsh
    # ln -s ~/dev-env/shell/.zshrc ~/.zshrc
}

install_docker_engine() {
    echo "installing docker"
    # sh -c "$(curl -fsSL https://get.docker.com)"
    sudo usermod -aG docker $USER
}
if grep -iq "raspberry" /proc/device-tree/model > /dev/null 2>&1; then
	echo "raspberry pi detected"
    sh ./install-scripts/raspbian.sh
    configure_nvim
    install_zsh
    install_docker_engine
elif [ "$(uname -s)" = "Darwin" ] ; then
    echo "mac detected" 
    # TODO: handle mac
fi

