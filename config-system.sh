#!/bin/bash

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "[]"

echo "===================================================================================="
echo "Configurando Tema..."
echo "===================================================================================="
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

echo "===================================================================================="
echo "Configurando Doca..."
echo "===================================================================================="
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock panel-mode false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell favorite-apps "['application://gnome-terminal.desktop', 'application://nautilus.desktop', 'application://libreoffice-writer.desktop']"


echo "===================================================================================="
echo "Criando pasta projects e criando Makefile..."
echo "===================================================================================="
mkdir -p ~/home/$USER/projects
echo "file:///home/$USER/projects" | tee -a /home/$USER/.config/gtk-3.0/bookmarks > /dev/null
cp ./Makefile ~/home/$USER/Makefile
sudo chmod 777 -R /home/$USER/projects/
sudo chmod 777 -R /home/$USER/Makefile
