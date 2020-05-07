#! /bin/bash
AUTOMAN_UTILS_FLAG="ON"

NOW_DATE=`date '+%F %T'`

function info() {
  echo "[INFO $NOW_DATE] $1"
}

function warn() {
  echo "[WARN $NOW_DATE] $1"
}

function error() {
  echo "[ERROR $NOW_DATE] $1"
}

function createDir() {
  if [ ! -d "$1" ]; then
    mkdir $1
    info "createDir $1"
  else
    info "$1 is existed"
  fi
}

function isCmdExisted() {
  if [ ! -n "$1" ]; then
    warn "cmd parameter is empty"
    return "0"
  fi

  if command -v $1 >/dev/null 2>&1; then
    info "$1 cmd exists"
    return "1"
  else
    warn "$1 cmd does not exist"
    return "0"
  fi
}