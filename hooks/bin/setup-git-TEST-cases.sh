#!/bin/bash
# 	hooks/bin/setup-git-TEST-cases.sh  2.25.305  2019-09-02T10:07:47.622650-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.24  
# 	   hooks/bin/setup-git-TEST-cases.sh - setup git TEST cases in current repository #2 testing 
###  hooks/EXAMPLES/setup-git-TEST-cases.sh - 
#    after clone  repository
#    after tar, copy, or clone  repository
#    copy commands to /usr/local/bin
###  Production standard 3.0 shellcheck
###  Production standard 5.1.160 Copyright
#    Copyright (c) 2019 Bradley Allen
#    MIT License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.
###  Production standard 1.3.496 DEBUG variable
#    Order of precedence: environment variable, default code
if [[ "${DEBUG}" == ""  ]] ; then DEBUG="0" ; fi   # 0 = debug off, 1 = debug on, 'export DEBUG=1', 'unset DEBUG' to unset environment variable (bash)
if [[ "${DEBUG}" == "2" ]] ; then set -x    ; fi   # Print trace of simple commands before they are executed
if [[ "${DEBUG}" == "3" ]] ; then set -v    ; fi   # Print shell input lines as they are read
if [[ "${DEBUG}" == "4" ]] ; then set -e    ; fi   # Exit command has a non-zero exit status
#
BOLD=$(tput -Txterm bold)
NORMAL=$(tput -Txterm sgr0)

#    Date and time function ISO 8601
get_date_stamp() {
  DATE_STAMP=$(date +%Y-%m-%dT%H:%M:%S.%6N%:z)
  TEMP=$(date +%Z)
  DATE_STAMP="${DATE_STAMP} (${TEMP})"
}

#    Fully qualified domain name FQDN hostname
LOCALHOST=$(hostname -f)

#    Version
SCRIPT_VERSION=$(head -2 "${0}" | awk '{printf $3}')

if [[ "${DEBUG}" == "1" ]] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Operation started." 1>&2 ; fi

###

if git -C . rev-parse 2> /dev/null ; then  #  currect directory in a git repository
  cd "$(git rev-parse --show-toplevel || echo '.')"  #  change to top git repository directory 
  REPOSITORY_NAME=$(git rev-parse --show-toplevel | rev | cut -d / -f 1 | rev)
  if [[ -d "hooks" ]] ; then
    cd hooks
  else
    curl -L https://api.github.com/repos/BradleyA/git-TEST-commit-automation/tarball | tar -xzf - --wildcards BradleyA-git-TEST-commit-automation-*/hooks
    mv BradleyA-git-TEST-commit-automation-*/hooks hooks
    rmdir BradleyA-git-TEST-commit-automation-21dadd7/
    cd hooks
  fi
  if [[ -x "post-commit" ]] && [[ -x "pre-commit" ]]  ; then  # do files exist and execute permission
    ln -s ../../hooks/post-commit ../.git/hooks/post-commit
    ln -s ../../hooks/pre-commit ../.git/hooks/pre-commit
  else
    get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[ERROR]${NORMAL}  Unable to link ${REPOSITORY_NAME}/hooks/{pre-commit,post-commit} to ${REPOSITORY_NAME}/.git/hooks/{pre-commit,post-commit} because {pre-commit,post-commit} is NOT found in current directory ($(pwd)) or does not have execute permission." 1>&2
    exit 2
  fi
  if [[ -x "bin/check-git-TEST-cases.sh" ]] ; then
    cp -p bin/check-git-TEST-cases.sh /usr/local/bin
  else
    get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[ERROR]${NORMAL}  Unable to cp ${REPOSITORY_NAME}/hooks/bin/check-git-TEST-cases.sh to /usr/local/bin because check-git-TEST-cases.sh is NOT found or does not have execute permission." 1>&2
    exit 2
  fi
else
  EXIT_CODE=${?}
  get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[ERROR]${NORMAL}  The current directory, ($(pwd)), is Not a git repository (or any of the parent directories)." 1>&2
  exit ${EXIT_CODE}
fi

if [[ "${DEBUG}" == "1" ]] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Operation finished." 1>&2 ; fi
###
