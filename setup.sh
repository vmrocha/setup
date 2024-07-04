#!/bin/bash

sudo apt update
sudo apt install build-essential -y
sudo apt install ripgrep -y

# git
sudo apt install git -y
git config --global init.defaultBranch main
git config --global user.name  "Vinicius Rocha"
git config --global user.email "vmrocha@gmail.com"

# github cli
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# zsh
# how to uninstall zsh
# sudo apt --purge remove zsh
# chsh -s $(which bash)
#
# suggested plugins
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
if [ ! -n $ZSH_VERSION ]; then
  sudo apt install zsh -y
  chsh -s $(which zsh)
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

# neovim
sudo apt install neovim -y
if [ ! -d ~/.config/nvim ]; then
  mkdir -p ~/.config/nvim
  git clone https://github.com/vmrocha/config-nvim.git ~/.config/nvim
fi