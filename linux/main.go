package main

import (
	"github.com/Jhon-Henkel/utils/cmd/commands"
	"github.com/Jhon-Henkel/utils/cmd/logs"
	"github.com/Jhon-Henkel/utils/cmd/packages"
	"github.com/Jhon-Henkel/utils/cmd/system"
)

var (
	jetbrainsToolboxVersion = "2.5.2.35332"
	nodeVersion             = "20.x"
	javaVersion             = "23"
	secondsToRestart        = 10
)

func main() {
	logs.LogInfo("This project is in test phase. Use it at your own risk.")

	commands.UpdatePackages()
	commands.UpgradePackages()

	packages.Wget()
	packages.GoogleChrome()
	packages.Htop()
	packages.SublimeText()
	packages.JetbrainsToolbox(jetbrainsToolboxVersion)
	packages.Docker()
	packages.Spotify()
	packages.Diodon()
	packages.Node(nodeVersion)
	packages.Git()
	packages.Vim()
	packages.Ionic()
	packages.Java(javaVersion)
	packages.Makefile()
	packages.Golang()
	packages.Termius()
	packages.Flameshot()
	packages.OhMyZsh()

	system.ConfigDarkTheme()
	system.ConfigDock()
	system.CopyMakefile()
	system.DefineProjectFolder()

	commands.UpdatePackages()
	commands.UpgradePackages()
	commands.RestartSystem(secondsToRestart)
}
