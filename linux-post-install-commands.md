# Commands
These are for my use when I need to install a clean ubuntu on my computer.

## Items
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

## Google Chrome
``` shell
sudo apt update
```
``` shell
sudo apt upgrade
```
``` shell
sudo apt install wget
```
``` shell
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```
``` shell
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

## Htop
``` shell
sudo apt install htop
```

## Sublime Text
``` shell
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
```
``` shell
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
```
``` shell
sudo apt-get update
```
``` shell
sudo apt-get install sublime-text
```

## Jetbrains Toolbox
``` shell
wget -c https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.3.0.30876.tar.gz
```
``` shell
sudo tar -xzf jetbrains-toolbox-2.3.0.30876.tar.gz -C /opt
```
``` shell
sudo apt-get install -y libfuse2
```
``` shell
/opt/jetbrains-toolbox-2.3.0.30876/jetbrains-toolbox
```

## Docker Engine and Docker Compose
``` shell
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
```
``` shell
sudo apt-get update
```
``` shell
sudo apt-get install ca-certificates curl
```
``` shell
sudo install -m 0755 -d /etc/apt/keyrings
```
``` shell
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
```
``` shell
sudo chmod a+r /etc/apt/keyrings/docker.asc
```
``` shell
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "bookworm") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
``` shell
sudo apt-get update
```
``` shell
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
``` shell
sudo docker run hello-world
```
``` shell
sudo apt-get update
```
``` shell
sudo apt-get install docker-compose-plugin
```
``` shell
docker compose version
```
``` shell
sudo groupadd docker
```
``` shell
sudo usermod -aG docker $USER
```
``` shell
newgrp docker
```

## Spotify
``` shell
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
```
``` shell
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
```
``` shell
sudo apt-get update && sudo apt-get install spotify-client
```

## Diodon
``` shell
sudo add-apt-repository ppa:diodon-team/stable
```
``` shell
sudo apt-get update
```
``` shell
sudo apt-get install -y diodon
```

## Node and Npm
``` shell
sudo apt-get update
```
``` shell
sudo apt-get upgrade
```
``` shell
sudo apt install -y curl
```
``` shell
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
```
``` shell
sudo apt install -y nodejs
```

## Git
``` shell
sudo add-apt-repository ppa:git-core/ppa
```
``` shell
sudo apt update
```
``` shell
sudo apt-get install git
```

## Vim
``` shell
sudo apt install vim
```

## Zsh and Ho-my-zsh
``` shell
sudo apt install zsh
```
``` shell
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
``` shell
chsh -s $(which zsh)
```
``` shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```
``` shell
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```
``` shell
sudo apt update
```
``` shell
sudo apt install zsh-autosuggestions
```
``` shell
sudo apt install zsh-syntax-highlighting  
```
``` shell
vim ./.zshrc
```
Add the following lines to the file
```
ZSH_THEME="arrow"

plugins=(
    git
    docker
    docker-compose
    zsh-autosuggestions
)

alias sail='bash vendor/bin/sail'
```

``` shell
sudo reboot
```

## Ionic cli
``` shell
npm install -g @ionic/cli
```

## Java SDK
``` shell
sudo apt update
```
``` shell
wget https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.deb
```
``` shell
sudo dpkg -i jdk-22_linux-x64_bin.deb
```

## Make
``` shell
sudo apt-get update
```
``` shell
sudo apt-get -y install make
```

## Go Lang
``` shell
sudo apt-get update
```
``` shell
sudo apt upgrade
```
``` shell
sudo apt search golang-go
```
``` shell
sudo apt search gccgo-go
```
``` shell
sudo apt install golang-go
```

## Termius
```shell
wget https://www.termius.com/download/linux/Termius.deb
```
```shell
sudo dpkg -i Termius.deb
```

## Postman
Download from https://www.postman.com/downloads/ and run commands
``` shell
tar -xzf postman.tar.gz
```
``` shell
sudo rm -rf /opt/Postman
```
``` shell
sudo mv Postman /opt/Postman
```
``` shell
sudo ln -s /opt/Postman/Postman /usr/bin/postman
```
``` shell
cat > ~/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
# Before v6.1.2
# Icon=/opt/Postman/resources/app/assets/icon.png
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL
```

## WoeUsb
```bash
sudo add-apt-repository ppa:tomtomtom/woeusb
sudo apt update
sudo apt install woeusb woeusb-frontend-wxgtk
```
