#! /bin/bash
#---------------------------------------------------
# file: zsh/entrypoint.sh
# description:

# author: Jason Ding
# date: 2020-05-06 15:00
# content:
#---------------------------------------------------
# import utility functions
if [ ! -n "$AUTOMAN_UTILS_FLAG" ]; then
  source ../utils.sh
fi

function installBrew() {
  if command -v brew >/dev/null 2>&1; then
    info 'brew cmd exists'
  else
    warn 'brew cmd does not exist'
    info 'install brew cmd then'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

function execute() {
  echo "---------------------------------------------------------"
  info "execute zsh module script"
  installBrew
}

execute

