#! /bin/bash
#---------------------------------------------------
# file: main.sh
# description:
# Execute specific scripts according to
# module names defined in `modules.conf`
# author: Jason Ding
# date: 2020-05-06 15:00
#---------------------------------------------------

# import utilities scripts define in current directory
source ./utils.sh

CONFIG_PATH=$HOME"/.config"
ZSH_PROFILE=$HOME"/.zshrc"

function invokeEntryPoint() {
  path=$(echo "./$1/entrypoint.sh")
  source $path
  config_file_path=$CONFIG_PATH"/$1_config"
  if [ -f "$config_file_path" ]; then
    if [ `grep -c "source $config_file_path" $ZSH_PROFILE` -eq '0' ]; then
      info "add source $config_file_path cmd into the zshrc file"
      echo "# refresh $1 config file" >> $ZSH_PROFILE
      echo "source $config_file_path" >> $ZSH_PROFILE
    else
      warn "source $config_file_path cmd already exists in zshrc file"
    fi
  fi
}

# main process
function main() {
  createDir $CONFIG_PATH
  # read from modules.conf in the project root path
  modules=()
  info "Modules configuration will be updated:"
  for line in `cat modules.conf`
  do
    modules+=($line)
  done
  info "Modules list:[${modules[@]}]"

  # source all the entrypoint.sh from different module path iteratively
  for module in ${modules[@]}
  do
    invokeEntryPoint $module
  done
}

main

