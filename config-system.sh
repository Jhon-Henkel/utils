#!/bin/bash

# Configurar atalho Super+V para abrir o Diodon
install_package dbus-x11
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "[]"

echo "Configurando o tema e doca do Ubuntu para o tema escuro..."
# Configurar o tema do Ubuntu para o tema escuro
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Configurar doca
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock panel-mode false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell favorite-apps "['application://gnome-terminal.desktop', 'application://nautilus.desktop', 'application://libreoffice-writer.desktop']"

echo "Tema e doca configurada com sucesso."

# Criar e definir a pasta 'projects' como marcador
mkdir -p ~/projects
echo "file:///home/$USER/projects" | sudo tee -a /home/$USER/.config/gtk-3.0/bookmarks > /dev/null
cp ./Makefile ~/home/$USER/Makefile
