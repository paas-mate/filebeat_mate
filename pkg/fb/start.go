package fb

import (
	"filebeat_mate/pkg/path"
	"filebeat_mate/pkg/util"
	"github.com/paas-mate/gutil"
	"go.uber.org/zap"
)

func Start() {
	startFb()
}

func startFb() {
	err := generateFbFile()
	if err != nil {
		util.Logger().Error("generate filebeat config file failed ", zap.Error(err))
		return
	}
	stdout, stderr, err := gutil.CallScript(path.FbStartScript)
	util.Logger().Info("output is ", zap.String("stdout", stdout), zap.String("stderr", stderr))
	util.Logger().Error("run start coredns scripts failed ", zap.Error(err))
}

func generateFbFile() (err error) {
	// todo
	return nil
}
