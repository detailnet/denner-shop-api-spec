#!/bin/bash

export TERM="${TERM:=xterm}"

if [ ! -r /usr/bin/tput ]; then
  # Using lando apache as appserver (instead of php), comes with much less os utils
  apt-get update -y > /dev/null 2>&1
  apt-get install -y libncurses-dev > /dev/null 2>&1
  printf '%s%s%s\n' $(tput setaf 6) 'Installed tput.' $(tput sgr0)
fi

exit_status () {
    if [ $1 -ne 0 ]; then
        printf '%s%s%s\n' $(tput setaf 1) 'error' $(tput sgr0)
    else
        printf '%s%s%s\n' $(tput setaf 2) 'done' $(tput sgr0)
   fi
}

printf '%s%s%s\n' $(tput setaf 6) 'Installing additional utilities...' $(tput sgr0)

printf 'Updating packages                          ... ' && apt-get update -y > /dev/null 2>&1             && exit_status $?
#printf 'Installing SSH client                      ... ' && apt-get install -y ssh-client > /dev/null 2>&1 && exit_status $?
# For download of aws-cli and swagger-codegen
printf 'Installing WGET                            ... ' && apt-get install -y  wget > /dev/null 2>&1      && exit_status $?
# For aws command
printf 'Installing LESS                            ... ' && apt-get install -y  less > /dev/null 2>&1      && exit_status $?
#printf 'Installing GIT                             ... ' && apt-get install -y git > /dev/null 2>&1        && exit_status $?
# From https://github.com/mikefarah/yq/#install
YQ_URL=https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
printf 'Installing YQ                              ... ' && wget $YQ_URL -O /usr/bin/yq > /dev/null 2>&1 && chmod +x /usr/bin/yq > /dev/null 2>&1  && exit_status $?

printf '%s%s%s\n' $(tput setaf 6) 'Additional utilities installed.' $(tput sgr0)

