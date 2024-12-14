#!/bin/bash

# Script para configurar uma instalação limpa do Ubuntu
# Certifique-se de executar este script com permissões de sudo

# Atualizar o sistema
sudo apt update && sudo apt upgrade -y

# Função para instalar pacotes com apt
install_package() {
  echo "Instalando $1..."
  sudo apt install -y "$1"
}

# Google Chrome
install_package wget
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb || sudo apt --fix-broken install -y
rm ./google-chrome-stable_current_amd64.deb

# Htop
install_package htop

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
install_package sublime-text

# Jetbrains Toolbox
wget -c https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.3.0.30876.tar.gz
sudo tar -xzf jetbrains-toolbox-2.3.0.30876.tar.gz -C /opt
install_package libfuse2
/opt/jetbrains-toolbox-*/jetbrains-toolbox
rm jetbrains-toolbox-2.3.0.30876.tar.gz

# Docker Engine and Docker Compose
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove -y $pkg; done
sudo apt update
install_package ca-certificates
install_package curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo \"bookworm\") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
install_package docker-ce 
install_package docker-ce-cli
install_package containerd.io
install_package docker-buildx-plugin
install_package docker-compose-plugin
if ! getent group docker > /dev/null 2>&1; then
    sudo groupadd docker
fin
sudo usermod -aG docker $USER

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && install_package spotify-client

# Diodon
sudo add-apt-repository -y ppa:diodon-team/stable
sudo apt update
install_package diodon

# Node.js and npm
install_package curl
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
install_package nodejs

# Git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update
install_package git

# Vim
install_package vim

Zsh and Oh-my-zsh
install_package zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" --unattended
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
install_package zsh-autosuggestions
install_package zsh-syntax-highlighting
echo 'ZSH_THEME="arrow"' >> ~/.zshrc
echo 'plugins=(git docker docker-compose zsh-autosuggestions)' >> ~/.zshrc
echo 'alias sail="bash vendor/bin/sail"' >> ~/.zshrc

# Ionic CLI
npm install -g @ionic/cli

# Java SDK
wget https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.deb
sudo dpkg -i jdk-22_linux-x64_bin.deb || sudo apt --fix-broken install -y
rm jdk-22_linux-x64_bin.deb

# Make
install_package make

# Go Lang
install_package golang-go

# Termius
wget https://www.termius.com/download/linux/Termius.deb
sudo dpkg -i Termius.deb || sudo apt --fix-broken install -y
rm Termius.deb

# Postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
tar -xzf postman.tar.gz
sudo rm -rf /opt/Postman
sudo mv Postman /opt/Postman
sudo ln -s /opt/Postman/Postman /usr/bin/postman
cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL
rm postman.tar.gz

# Flameshot
install_package flameshot

sudo chmod 777 -R /home/$USER/projects/
sudo chmod 777 -R /home/$USER/Makefile

echo "Configuração concluída. Por favor, reinicie o sistema para aplicar as alterações."
