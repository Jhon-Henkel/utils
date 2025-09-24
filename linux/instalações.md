# Comandos
Esses comandos eu uso quando instalo o ubuntu no meu pc.

## Menu
- [Google Chrome](#google-chrome)
- [Htop](#htop)
- [Sublime Text](#sublime-text)
- [Jetbrains Toolbox](#jetbrains-toolbox)
- [Docker Engine and Docker Compose](#docker-engine-and-docker-compose)
- [Spotify](#spotify)
- [Diodon](#diodon)
- [Node and Npm](#node-and-npm)
- [Git](#git)
- [Vim](#vim)
- [Zsh and Ho-my-zsh](#zsh-and-ho-my-zsh)
- [Ionic cli](#ionic-cli)
- [Java SDK](#java-sdk)
- [Make](#make)
- [Go Lang](#go-lang)
- [Termius](#termius)
- [Postman](#postman)
- [Woe USB](#woe-usb)
- [Flame Shot](#flame-shot)
- [Python](#python)
- [Atalhos](#atalhos)

## Google Chrome
```shell
  sudo apt update
  sudo apt upgrade
  sudo apt install wget
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
```

## Htop
```shell
  sudo apt install htop
```

## Sublime Text
```shell
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update
  sudo apt-get install sublime-text
```

## Jetbrains Toolbox
A versão pode mudar, recomendo sempre baixar o mais atualizado diretamente no site da jetbrains. 
```shell
  wget -c https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.3.0.30876.tar.gz
  sudo tar -xzf jetbrains-toolbox-2.3.0.30876.tar.gz -C /opt
  sudo apt-get install -y libfuse2
  /opt/jetbrains-toolbox-2.3.0.30876/jetbrains-toolbox
```

## Docker Engine and Docker Compose
```shell
  for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
  sudo apt-get update
  sudo apt-get install ca-certificates curl
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "bookworm") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo docker run hello-world
  sudo apt-get update
  sudo apt-get install docker-compose-plugin
  docker compose version
  sudo groupadd docker
  sudo usermod -aG docker $USER
  newgrp docker
```

## Spotify
A pubkey está em constante mudança, recomendo sempre pegar o mais recente no site do Spotify.
```shell
  curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
  echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt-get update && sudo apt-get install spotify-client
```

## Diodon
```shell
  sudo add-apt-repository ppa:diodon-team/stable
  sudo apt-get update
  sudo apt-get install -y diodon
```

## Node and Npm
```shell
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt install -y curl
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
  sudo apt install -y nodejs
```

## Git
```shell
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt update
  sudo apt-get install git
```

## Vim
```shell
  sudo apt install vim
```

## Zsh and Ho-my-zsh
```shell
  sudo apt install zsh
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
  chsh -s $(which zsh)
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  sudo apt update
  sudo apt install zsh-autosuggestions
  sudo apt install zsh-syntax-highlighting  
```
Copiar o zsh_files/.zshrc para ./.zshrc
```shell
  sudo reboot
  . ~/.zshrc
```

## Ionic cli
```shell
  npm install -g @ionic/cli
```

## Java SDK
```shell
  sudo apt update
  wget https://download.oracle.com/java/23/latest/jdk-23_linux-x64_bin.deb
  sudo dpkg -i jdk-23_linux-x64_bin.deb
```

## Make
```shell
  sudo apt-get update
  sudo apt-get -y install make
```

## Go Lang
```shell
  sudo apt-get update
  sudo apt upgrade
  sudo apt search golang-go
  sudo apt search gccgo-go
  sudo apt install golang-go
```

## Termius
```shell
  wget https://www.termius.com/download/linux/Termius.deb
  sudo dpkg -i Termius.deb
  sudo chown root:root /opt/Termius/chrome-sandbox   
  sudo chmod 4755 /opt/Termius/chrome-sandbox  
```

## WoeUsb
```bash
  sudo add-apt-repository ppa:tomtomtom/woeusb
  sudo apt update
  sudo apt install woeusb woeusb-frontend-wxgtk
```

## Flame Shot
```bash
  apt install flameshot
```

## Python
```bash
  sudo apt update
  sudo apt install python3 python3-pip python3-venv -y
  python3 -m venv jupyterenv
  source jupyterenv/bin/activate
  pip install jupyterlab
```
## Atalhos
- Diodom
  ```bash
  Nome: Diodom
  Comando: /usr/bin/diodon
  Tecla: <Super>v
  ```
- Flameshot
  ```bash
  Nome: Flameshot
  Comando: /usr/bin/flameshot gui
  Tecla: Print
  ```
  Caso esteja usando o ubuntu 25.10, veja o arquivo linux/flameshot/ubuntu-25.10.md para configurar o atalho
  
