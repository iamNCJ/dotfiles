#!/bin/bash

function install_zsh() {
    # Install Oh My Zsh & Plugins
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo "Remember to tweak .zshrc!"
}

function install_vim() {
    git clone https://github.com/chxuan/vimplus.git ~/.vimplus
    cd ~/.vimplus
    ./install.sh
}

echo "Would you like to install oh-my-zsh? [Y/n]: \c"
read line
if [[ "$line" == Y*  ]] || [[ "$line" == y*  ]] || [ -z "$line"  ]; then
        install_zsh
fi


echo "Would you like to install vim-plus? [Y/n]: \c"
read line
if [[ "$line" == Y*  ]] || [[ "$line" == y*  ]] || [ -z "$line"  ]; then
        install_vim
fi


