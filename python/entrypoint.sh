#! /bin/bash
#---------------------------------------------------
# file: python/entrypoint.sh
# description:

# author: Jason Ding
# date: 2020-05-06 15:00
# content:
# 1. update pip
# 2. install pipenv/pyenv/...
#---------------------------------------------------
# import utility functions
if [ ! -n "$AUTOMAN_UTILS_FLAG" ]; then
  source ../utils.sh
fi

function onlyForPython3() {
  isCmdExisted python3
  if [ $? -eq "1" ]; then
    info "python3 exists in current system"
    return "1"
  else
    error "python3 is lost"
    return "0"
  fi

  py_version=$(python --version)
  if ! grep -q "Python 3" <<< "$py_version"; then
    error "default python version is not version3"
    return "0"
  fi
  return "1"
}

function installPip() {
  isCmdExisted pip
  if [ $? -eq "1"]; then
    pip install -U pip
  else
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py
  fi
}


function execute() {
  echo "---------------------------------------------------------"
  info "execute python module script"
  onlyForPython3
  if [ $? -eq "0" ]; then
    return
  fi

  # install pip
  installPip

  # install other tools
  brew update
  brew install pipenv
  brew install pyenv
}

execute
