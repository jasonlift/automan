# automan
Automan is a respository of self-management development environment sync tools, which uses configuration file and shell scripts to keep trace of developing habits.

Originally, automan is expected to be a tool for synchronization between different mac systems, especially when you change your computer during job-hopping.

It is very important to speed up your efficiency by using any automated tools.

# design & components
In the v0.1 version, automan is launched by `main.sh` script, which executes many shell commands to configure global environment variables and do some setup works.

It is designed as a plugin-enable form, whose components can be specified in the `modules.conf` file. The program would search the specific module script according to the name configured in the `modules.conf` and execute the `entrypoint.sh` in the corresponding directory.

## global environment variables

## python env

## golang env

## git env

# setup guide


# changelog
version: v0.1, date: , features: 


