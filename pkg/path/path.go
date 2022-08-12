package path

import (
	"os"
	"path/filepath"
)

// filebeat
var (
	FbHome   = os.Getenv("FILEBEAT_HOME")
	FbConfig = filepath.FromSlash(FbHome + "/filebeat.yml")
)

// mate
var (
	FbMatePath    = filepath.FromSlash(FbHome + "/mate")
	FbScripts     = filepath.FromSlash(FbMatePath + "/scripts")
	FbStartScript = filepath.FromSlash(FbScripts + "/start-filebeat.sh")
)
