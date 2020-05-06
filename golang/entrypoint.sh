#! /bin/bash
#---------------------------------------------------
# file: golang/entrypoint.sh
# description:
# Initialize golang environment variables required.
# Install some necessary packages or cli-tools.
# author: Jason Ding
# date: 2020-05-06 15:00
# content:
# 1. create environment variables like GOPATH/GOBIN/...
# 2. install packages and binary executive files
# 3. attach golang config file to `~/.config`
#---------------------------------------------------

# define the global variables
CONFIG_PATH=$HOME"/.config"
GO_CONFIG_PATH=$CONFIG_PATH"/golang_config"
GOPATH=$HOME"/go"
GOPATH_BIN=$GOPATH"/bin"
GOPATH_PKG=$GOPATH"/pkg"
GOPATH_SRC=$GOPATH"/src"
now_cmd=`date '+%F %T'`

function info() {
  echo "[INFO-$now_cmd] $1"
}

function warn() {
  echo "[WARN-$now_cmd] $1"
}

function error() {
  echo "[ERROR-$now_cmd] $1"
}

function createDir() {
  if [ ! -d "$1" ]; then
    mkdir $1
    info "createDir $1"
  else
    info "$1 is existed"
  fi
}

function goCmdExisted() {
  if command -v go >/dev/null 2>&1; then
    info 'exists go cmd'
  else
    error 'no exists go cmd'
    exit 1
  fi
}

# main process
info "execute golang module script"
goCmdExisted # test if go cmd existed
# stage1: create global variables & necessary directory
createDir $GOPATH
createDir $GOPATH_BIN
createDir $GOPATH_PKG
createDir $GOPATH_SRC

# stage2: install necessary packages or bin files
go get -u golang.org/x/tools/cmd/guru
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/mdempsky/gocode
go get -u github.com/motemen/gore/cmd/gore

# stage3: attach isolated config file
cat <<EOF > $GO_CONFIG_PATH
export GOPATH="$GOPATH"
export PATH="$GOPATH_BIN:\$PATH"
EOF