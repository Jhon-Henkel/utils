package logs

import "log"

const (
	reset  = "\033[0m"
	red    = "\033[31m"
	green  = "\033[32m"
	yellow = "\033[33m"
	blue   = "\033[34m"
)

func LogInstallInfo(pgkName string) {
	LogTopMessage("Installing package: " + pgkName)
}

func LogTopMessage(message string) {
	log.Println(green + "=======================================================================" + reset)
	log.Println(green + "=> " + message + reset)
	log.Println(green + "=======================================================================" + reset)
}

func LogDone() {
	log.Println(green + "=> Done!" + reset)
}

func LogError(err error) {
	log.Println(red+"=> Error: ", err.Error()+reset)
}

func LogInfo(message string) {
	log.Println(blue + "=> " + message + reset)
}
