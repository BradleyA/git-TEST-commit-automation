#!/bin/bash
# 	hooks/EXAMPLES/FVT-setup.sh  2.78.517  2019-09-14T21:47:49.803431-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.78  
# 	   hooks/EXAMPLES/FVT-setup.sh   uncomment to be new default all option -help, usage, version 
# 	hooks/EXAMPLES/FVT-setup.sh  2.58.422  2019-09-08T22:02:56.907318-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.57-4-gd88b681  
# 	   hooks/EXAMPLES/FVT-*   upgrade Production standard 1.3.496 DEBUG variable ; add new_message 
#86# hooks/EXAMPLES/FVT-setup.sh - This script is optional.  It is for
#    'Production standard 10.0 TESTing' test cases.  Copy it to TEST/<file_name>/.
#    If FVT-setup.sh is found in TEST/<file_name>/ post-commit executes it.
#    Functional Verification Testing (FVT) - verify that the program logic conforms
#    to design specification.
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
SCRIPT_NAME=$(head -2 "${0}" | awk '{printf $2}')
SCRIPT_VERSION=$(head -2 "${0}" | awk '{printf $3}')

#    UID and GID
USER_ID=$(id -u)
GROUP_ID=$(id -g)

###  Production standard 2.3.512 log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)
new_message() {  #  $1="${SCRIPT_NAME}"  $2="${LINENO}"  $3="DEBUG INFO ERROR WARN"  $4="message"
  get_date_stamp
  echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${1}[$$] ${SCRIPT_VERSION} ${2} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[${3}]${NORMAL}  ${4}"
}

if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "DEBUG" "  Started..." 1>&2 ; fi

###  Production standard 10.0 TESTing

if [[ ! -z "${1}" ]] ; then  # post-commit must pass REPOSITORY_DIR because post-commit is executed in .git/hooks/ which is not in the repository
  REPOSITORY_DIR=${1}
else
  REPOSITORY_DIR=$(git rev-parse --show-toplevel)  #  not called by post-commit
  if [[ "${0}" != $(basename "${0}") ]] ; then  #  script must execute in TEST/<COMMIT_FILE_NAME>/ directory
    cd "$(dirname "${0}")"
  fi
fi

#    Uncomment shared TEST cases for TESTing
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001"          FVT-option-help-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-002"          FVT-option-help-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-003"          FVT-option-help-003
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-004"          FVT-option-help-004
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-005"          FVT-option-help-005
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-006"          FVT-option-help-006
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-001"         FVT-option-usage-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-002"         FVT-option-usage-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-003"         FVT-option-usage-003
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-001"       FVT-option-version-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-002"       FVT-option-version-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-003"       FVT-option-version-003
#
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-0-001     FVT-exit-code-error-0-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-1-001     FVT-exit-code-error-1-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-124-001"  FVT-exit-code-error-124-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-124-002"  FVT-exit-code-error-124-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-2-001"    FVT-exit-code-error-2-001

if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "DEBUG" "  Operation finished..." 1>&2 ; fi
###
