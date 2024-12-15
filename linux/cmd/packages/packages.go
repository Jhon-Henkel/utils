package packages

import (
	"fmt"
	"github.com/Jhon-Henkel/utils/cmd/commands"
	"github.com/Jhon-Henkel/utils/cmd/logs"
)

func Wget() {
	commands.InstallPackage("wget")
}

func GoogleChrome() {
	logs.LogInstallInfo("Google Chrome")
	commands.RunWget("https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb")
	commands.InstallDebPackage("google-chrome-stable_current_amd64.deb")
	commands.FixBrokenInstall()
	commands.RemoveFile("google-chrome-stable_current_amd64.deb")
}

func Htop() {
	commands.InstallPackage("htop")
}

func SublimeText() {
	commands.RunCommand([]string{"wget", "-qO - https://download.sublimetext.com/sublimehq-pub.gpg"})
	commands.RunCommand([]string{"gpg", "--dearmor"})
	commands.RunCommand([]string{"sudo", "tee", "/etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null"})
	commands.RunCommand([]string{"echo", "deb https://download.sublimetext.com/ apt/stable/"})
	commands.RunCommand([]string{"sudo", "tee", "/etc/apt/sources.list.d/sublime-text.list"})
	commands.UpdatePackages()
	commands.InstallPackage("sublime-text")
}

func JetbrainsToolbox(version string) {
	logs.LogInstallInfo("Jetbrains Toolbox")
	commands.RunWget(fmt.Sprintf("https://download.jetbrains.com/toolbox/jetbrains-toolbox-%s.tar.gz", version))
	commands.RunCommand([]string{"sudo", "tar", "-xvf", fmt.Sprintf("jetbrains-toolbox-%s.tar.gz", version), "-C", "/opt"})
	commands.InstallPackage("libfuse2")
	commands.RunCommand([]string{"sudo", fmt.Sprintf("/opt/jetbrains-toolbox-%s/jetbrains-toolbox", version)})
}

func Docker() {
	commands.RunCommand([]string{"for", "pkg", "in", "docker.io", "docker-doc", "docker-compose", "podman-docker", "containerd", "runc;", "do", "sudo", "apt-get", "remove", "$pkg;", "done"})
	commands.UpdatePackages()
	commands.InstallPackage("ca-certificates curl")
	commands.RunCommand([]string{"sudo", "install", "-m", "0755", "-d", "/etc/apt/keyrings"})
	commands.RunCommand([]string{"sudo", "curl", "-fsSL", "https://download.docker.com/linux/debian/gpg", "-o", "/etc/apt/keyrings/docker.asc"})
	commands.RunCommand([]string{"sudo", "chmod", "a+r", "/etc/apt/keyrings/docker.asc"})
	commands.RunCommand([]string{"echo", "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo \"bookworm\") stable | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null"})
	commands.UpdatePackages()
	commands.InstallPackage("docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin")
	commands.UpdatePackages()
	commands.InstallPackage("docker-compose-plugin")
	commands.RunCommand([]string{"sudo", "groupadd", "docker"})
	commands.RunCommand([]string{"sudo", "usermod", "-aG", "docker", "$USER"})
	commands.RunCommand([]string{"newgrp", "docker"})
}

func Spotify() {
	commands.RunCommand([]string{"curl", "-sS", "https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg"})
	commands.RunCommand([]string{"sudo", "gpg", "--dearmor", "--yes", "-o", "/etc/apt/trusted.gpg.d/spotify.gpg"})
	commands.RunCommand([]string{"echo", "deb http://repository.spotify.com stable non-free"})
	commands.RunCommand([]string{"sudo", "tee", "/etc/apt/sources.list.d/spotify.list"})
	commands.UpdatePackages()
	commands.InstallPackage("spotify-client")
}

func Diodon() {
	commands.RunCommand([]string{"sudo", "add-apt-repository", "-y", "ppa:diodon-team/stable"})
	commands.UpdatePackages()
	commands.InstallPackage("diodon")
	// todo - configurar atalho
}

func Node(version string) {
	commands.RunCommand([]string{"curl", "-fsSL", fmt.Sprintf("https://deb.nodesource.com/setup_%s", version)})
	commands.RunCommand([]string{"sudo", "-E", "bash", "-"})
	commands.InstallPackage("nodejs")
}

func Git() {
	commands.RunCommand([]string{"sudo", "add-apt-repository", "-y", "ppa:git-core/ppa"})
	commands.UpdatePackages()
	commands.InstallPackage("git")
}

func Vim() {
	commands.InstallPackage("vim")
}

func Ionic() {
	logs.LogInstallInfo("Ionic")
	commands.RunCommand([]string{"npm", "install", "-g", "ionic/cli"})
}

func Java(version string) {
	logs.LogInstallInfo(fmt.Sprintf("Java SDK %s", version))
	commands.RunWget(fmt.Sprintf("https://download.oracle.com/java/%s/latest/jdk-%s_linux-x64_bin.deb", version, version))
	commands.InstallDebPackage(fmt.Sprintf("jdk-%s_linux-x64_bin.deb", version))
	commands.FixBrokenInstall()
	commands.RemoveFile(fmt.Sprintf("jdk-%s_linux-x64_bin.deb", version))
}

func Makefile() {
	commands.InstallPackage("make")
}

func Golang() {
	commands.InstallPackage("golang-go")
}

func Termius() {
	logs.LogInstallInfo("Termius")
	commands.RunWget("https://www.termius.com/download/linux/Termius.deb")
	commands.InstallDebPackage("Termius.deb")
	commands.FixBrokenInstall()
	commands.RemoveFile("Termius.deb")
}

func Flameshot() {
	commands.InstallPackage("flameshot")
}

func OhMyZsh() {
	commands.InstallPackage("zsh")
	commands.RunCommand([]string{"sh", "-c", "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"})
	commands.RunCommand([]string{"chsh", "-s", "$(which zsh)"})
	commands.RunCommand([]string{"git", "clone", "https://github.com/zsh-users/zsh-syntax-highlighting.git", "~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"})
	commands.RunCommand([]string{"git", "clone", "https://github.com/zsh-users/zsh-autosuggestions", "~/.oh-my-zsh/custom/plugins/zsh-autosuggestions"})
	commands.UpdatePackages()
	commands.InstallPackage("zsh-autosuggestions")
	commands.InstallPackage("zsh-syntax-highlighting")
	commands.RunCommand([]string{"cp", "./zsh_files/.zshrc", "~/.zshrc"})
	commands.RunCommand([]string{"source", "~/.zshrc"})
}
