## chrome
sudo apt update
sudo apt upgrade
sudo apt install wget
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

## htop
sudo apt install htop

## sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

## jetbrains 
wget -c https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.3.0.30876.tar.gz
sudo tar -xzf jetbrains-toolbox-2.3.0.30876.tar.gz -C /opt
sudo apt-get install -y libfuse2
/opt/jetbrains-toolbox-2.3.0.30876/jetbrains-toolbox

## docker engine and docker compose
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

## Spotify
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

## diodon
sudo add-apt-repository ppa:diodon-team/stable
sudo apt-get update
sudo apt-get install -y diodon

## node and npm
sudo apt-get update
sudo apt-get upgrade
sudo apt install -y curl
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

## git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt-get install git

## zshel and ho my zsh
sudo apt install zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sudo apt update
sudo apt install zsh-autosuggestions
sudo apt install zsh-syntax-highlighting  
sudo reboot

## vim 
sudo apt install vim

## ionic cli
npm install -g @ionic/cli

## steam
wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
sudo dpkg -i steam.deb

## postman
https://www.postman.com/downloads/
tar -xzf postman.tar.gz
sudo rm -rf /opt/Postman
sudo mv Postman /opt/Postman
sudo ln -s /opt/Postman/Postman /usr/bin/postman
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
