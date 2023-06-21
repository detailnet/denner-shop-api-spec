#!/bin/bash

export TERM="${TERM:=xterm}"

exit_status () {
    if [ $1 -ne 0 ]; then
        printf '%s%s%s\n' $(tput setaf 1) 'error' $(tput sgr0)
    else
        printf '%s%s%s\n' $(tput setaf 2) 'done' $(tput sgr0)
   fi
}

printf '%s%s%s\n' $(tput setaf 6) 'Installing Java environment...' $(tput sgr0)

printf 'Updating packages                          ... ' && apt-get update -y > /dev/null 2>&1 && exit_status $?
printf 'Installing JRE                             ... ' && apt-get install default-jre -y > /dev/null 2>&1 && exit_status $?
#printf 'Installing OpenJdk 17                      ... ' && apt-get install openjdk-17-jre-headless -y > /dev/null 2>&1 && exit_status $?
#printf 'Installing Maven 3.6                       ... ' && apt-get install maven -y > /dev/null 2>&1 && exit_status $?
#printf 'Installing Gradle 4.4                      ... ' && apt-get install gradle -y > /dev/null 2>&1 && exit_status $?

printf '%s%s%s\n' $(tput setaf 6) 'Java environment installed.' $(tput sgr0)
