#!/bin/bash

export TERM="${TERM:=xterm}"

exit_status () {
    if [ $1 -ne 0 ]; then
        printf '%s%s%s\n' $(tput setaf 1) 'error' $(tput sgr0)
    else
        printf '%s%s%s\n' $(tput setaf 2) 'done' $(tput sgr0)
   fi
}

# Install swagger codegen https://github.com/swagger-api/swagger-codegen/blob/3.0.0/standalone-gen-dev/standalone-generator-development.md
URL=https://repo1.maven.org/maven2/io/swagger/codegen/v3/swagger-codegen-cli/3.0.21/swagger-codegen-cli-3.0.21.jar

# Download on every installation (also if already present)
# Would be good to have a latest-version url ..

printf '%s%s%s\n' $(tput setaf 6) 'Downloading swagger codegen V3...' $(tput sgr0)

printf 'Creating output directory                  ... ' && mkdir -p docs/.swagger-codegen                             > /dev/null 2>&1 && exit_status $?
printf 'Downloading swagger codegen V3 jar         ... ' && wget $URL -O docs/.swagger-codegen/swagger-codegen-cli.jar > /dev/null 2>&1 && exit_status $?

printf '%s%s%s\n' $(tput setaf 6) 'Swagger codegen downloaded.' $(tput sgr0)
