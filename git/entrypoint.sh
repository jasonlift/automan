#! /bin/bash
#---------------------------------------------------
# file: git/entrypoint.sh
# description:
# configuration for github account
# author: Jason Ding
# date: 2020-05-06 15:00
# content:
# create `~/.ssh/config` file if not existed
#---------------------------------------------------
# import utility functions
if [ ! -n "$AUTOMAN_UTILS_FLAG" ]; then
  source ../utils.sh
fi

SSH_CONFIG_PATH=$HOME"/.ssh/config"

function execute() {
echo "---------------------------------------------------------"
info "execute git module script"

if [ ! -f "$SSH_CONFIG_PATH" ]; then
  info "create ssh config for github account"
cat <<EOF > $SSH_CONFIG_PATH
#github
Host personal
Port 22
HostName github.com
PreferredAuthentications publickey
IdentityFile $HOME/.ssh/id_rsa
User jasonlift
EOF
fi
}

execute

