#!/bin/bash

export TERM="${TERM:=xterm}"

exit_status () {
    if [ $1 -ne 0 ]; then
        printf '%s%s%s\n' $(tput setaf 1) 'error' $(tput sgr0)
    else
        printf '%s%s%s\n' $(tput setaf 2) 'done' $(tput sgr0)
   fi
}

# Install AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
URL=https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip

# Download on every installation (also if already present)
# Would be good to have a latest-version url ..

printf '%s%s%s\n' $(tput setaf 6) 'Installing AWS CLI...' $(tput sgr0)

printf 'Downloading AWS CLI zip file               ... ' && wget $URL -O /tmp/awscliv2.zip  > /dev/null 2>&1 && exit_status $?
printf 'Unpacking zip file                         ... ' && unzip /tmp/awscliv2.zip -d /tmp > /dev/null 2>&1 && exit_status $?
printf 'Running installer                          ... ' && /tmp/aws/install                > /dev/null 2>&1 && exit_status $?

printf '%s%s%s\n' $(tput setaf 6) 'AWS CLI installed.' $(tput sgr0)
