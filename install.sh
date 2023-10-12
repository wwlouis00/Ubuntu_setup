#!/bin/bash

# 安裝Git
sudo apt-get update
sudo apt-get install -y git

# 安裝Docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

# 安裝Python 3
sudo apt-get install -y python3

# 安裝Vim
sudo apt-get install -y vim

# 安裝FileZilla
sudo apt-get install -y filezilla

# 安裝OpenSSH Server
sudo apt-get install -y openssh-server

# 安裝Oh My Zsh
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)
# 安裝 blanner figlet lolcat
sudo apt install figlet lolcat

# 安裝新酷音輸入法
sudo apt-get install -y fcitx fcitx-chewing

# 開啟SSH服務
sudo systemctl enable ssh
sudo systemctl start ssh

echo "安裝完成"
