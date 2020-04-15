#! /bin/bash
# main entry point is meant to define the self-specified module path and some global variables.

# define the global variables according to personalization
USER_ROOT=$(echo $HOME)

# read from modules.conf in the project root path
modules=()
echo "[INFO]Modules configuration will be updated:"
for line in `cat modules.conf`
do
  modules+=($line)
done
echo "[${modules[@]}]"

invokeEntryPoint() {
  path=$(echo "./$1/entrypoint.sh")
  source $path
}

# source all the entrypoint.sh from different module path iteratively
for module in ${modules[@]}
do
  invokeEntryPoint $module
done

