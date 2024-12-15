package system

import (
	"github.com/Jhon-Henkel/utils/cmd/commands"
	"github.com/Jhon-Henkel/utils/cmd/logs"
)

func ConfigDarkTheme() {
	logs.LogTopMessage("Configuring System Dark Theme")
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.desktop.interface", "gtk-theme", "'Yaru-dark'"})
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.desktop.interface", "color-scheme", "'prefer-dark'"})
	logs.LogDone()
}

func ConfigDock() {
	logs.LogTopMessage("Configuring System Dock")
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.shell.extensions.dash-to-dock", "autohide", "true"})
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.shell.extensions.dash-to-dock", "panel-mode", "false"})
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.shell.extensions.dash-to-dock", "dock-position", "'BOTTOM'"})
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.shell.extensions.dash-to-dock", "multi-monitor", "true"})
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.shell.extensions.dash-to-dock", "dock-fixed", "false"})
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.shell.extensions.dash-to-dock", "show-mounts", "false"})
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.shell favorite-apps", "\"['application://gnome-terminal.desktop', 'application://nautilus.desktop', 'application://libreoffice-writer.desktop']\""})
	logs.LogDone()
}

func CopyMakefile() {
	logs.LogTopMessage("Configuring Makefile")
	commands.RunCommand([]string{"cp", "./Makefile", "~/home/$USER/Makefile"})
	commands.RunCommand([]string{"sudo", "chmod", "777", "-R", "/home/$USER/Makefile"})
	logs.LogDone()
}

func DefineProjectFolder() {
	logs.LogTopMessage("Defining Project Folder")
	commands.RunCommand([]string{"mkdir", "-p", "~/home/$USER/projects"})
	commands.RunCommand([]string{"echo", "\"file:///home/$USER/projects\" | tee -a /home/$USER/.config/gtk-3.0/bookmarks > /dev/null"})
	commands.RunCommand([]string{"sudo", "chmod", "777", "-R", "/home/$USER/projects/"})
	logs.LogDone()
}

func DefineKeyboardShortcuts() {
	logs.LogTopMessage("Defining Keyboard Shortcuts for Flameshot and Diodon")
	// Configurar atalho para o Flameshot
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.settings-daemon.plugins.media-keys", "custom-keybindings", "[\"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot/\"]"})
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot/", "name", "'Flameshot'"})
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot/", "command", "'/usr/bin/flameshot gui'"})
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot/", "binding", "'Print'"})

	// Configurar atalho para o Diodon
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.settings-daemon.plugins.media-keys", "custom-keybindings", "[\"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/diodon/\"]"})
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/diodon/", "name", "'Diodon'"})
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/diodon/", "command", "'/usr/bin/diodon'"})
	commands.RunCommand([]string{"gsettings", "set", "org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/diodon/", "binding", "'<Super>v'"})
	logs.LogDone()
}
