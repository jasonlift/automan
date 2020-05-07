#! /bin/bash
#---------------------------------------------------
# file: vim/entrypoint.sh
# description:
# vim configuration program installation
# author: Jason Ding
# date: 2020-05-06 15:00
# content:
# install vimplus (https://github.com/chxuan/vimplus)
#---------------------------------------------------
# import utility functions
if [ ! -n "$AUTOMAN_UTILS_FLAG" ]; then
  source ../utils.sh
fi

# define environment variables
VIMPLUS_PATH=$HOME"/.vimplus"

function installVimPlus() {
  if [ ! -d "$VIMPLUS_PATH" ]; then
    git clone https://github.com/chxuan/vimplus.git $VIMPLUS_PATH
    cd $VIMPLUS_PATH
    ./install.sh
  else
    if [ ! -f "$VIMPLUS_PATH/.update.sh" ]; then
      warn "$VIMPLUS_PATH/.update.sh doesn't exist"
    else
      cd $VIMPLUS_PATH
      ./update.sh
    fi
  fi
}

function execute() {
  echo "---------------------------------------------------------"
  info "execute vim module script"
  installVimPlus
}

execute
