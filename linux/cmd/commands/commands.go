package commands

import (
	"fmt"
	"github.com/Jhon-Henkel/utils/cmd/logs"
	"os"
	"os/exec"
	"time"
)

func InstallPackage(pkgName string) {
	logs.LogInstallInfo(pkgName)
	RunCommand([]string{"sudo", "apt", "install", pkgName, "-y"})
}

func UpdatePackages() {
	logs.LogTopMessage("Updating Packages")
	RunCommand([]string{"sudo", "apt", "update"})
}

func UpgradePackages() {
	logs.LogTopMessage("Upgrading Packages")
	RunCommand([]string{"sudo", "apt", "upgrade", "-y"})
}

func RunCommand(commands []string) {
	cmd := exec.Command(commands[0], commands[1:]...)
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err := cmd.Run()
	if err != nil {
		logs.LogError(err)
		return
	}
	logs.LogDone()
}

func FixBrokenInstall() {
	RunCommand([]string{"sudo", "apt", "--fix-broken", "install", "-y"})
}

func RemoveFile(filePath string) {
	RunCommand([]string{"rm", filePath})
}

func InstallDebPackage(fileName string) {
	RunCommand([]string{"sudo", "dpkg", "-i", fileName})
}

func RunWget(url string) {
	RunCommand([]string{"wget", url})
}

func RestartSystem(seconds int) {
	logs.LogInfo(fmt.Sprintf("O computador será reiniciado em %d segundos", seconds))
	time.Sleep(time.Duration(seconds) * time.Second)
	logs.LogInfo("Tempo esgotado. Reiniciando o computador...")
	RunCommand([]string{"sudo", "reboot"})
}
