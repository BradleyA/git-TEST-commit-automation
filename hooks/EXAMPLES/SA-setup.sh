#!/bin/bash
# 	hooks/EXAMPLES/SA-setup.sh  2.86.536  2019-09-16T15:19:22.591383-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.85-7-g07ed5d9  
# 	   hooks/EXAMPLES/SA-setup.sh   added more test case names 
# 	hooks/EXAMPLES/SA-setup.sh  2.77.512  2019-09-14T14:25:47.131705-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.76  
# 	   hooks/EXAMPLES/SA-setup.sh   add additional permission test cases 
# 	hooks/bin/TEST/list-git-TEST-cases.sh/SA-setup.sh  2.76.511  2019-09-14T14:05:17.720995-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.75  
# 	   hooks/bin/TEST/list-git-TEST-cases.sh/SA-setup.sh   add new_message Operation finished... ; removed rm -f SA-*.test-case-output 
#86# hooks/EXAMPLES/SA-setup.sh - This script is optional.  It is for 
#    'Production standard 10.0 TESTing' test cases.  Copy it to TEST/<file_name>/.
#    If SA-setup.sh is found in TEST/<file_name>/ post-commit executes it.
#    Static Analysis (SA) - examination of code prior to the program’s execution
#    SA is code analysis, syntax, permission, code inspection, code review, etc
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
  if [[ "${0}" != $(basename "${0}") ]] ; then  #  script must executed in TEST/<COMMIT_FILE_NAME>/ directory
    cd "$(dirname "${0}")"
  fi
fi

#    Uncomment shared TEST cases for command
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-exit-code-error-124-001"   SA-exit-code-error-124-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-exit-code-error-124-002"   SA-exit-code-error-124-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-exit-code-error-2-001"     SA-exit-code-error-2-001
#
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-400-001"        SA-permission-400-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-440-001"        SA-permission-440-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-444-001"        SA-permission-444-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-640-001"        SA-permission-640-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-644-001"        SA-permission-644-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-664-001"        SA-permission-664-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-600-001"        SA-permission-600-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-660-001"        SA-permission-660-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-666-001"        SA-permission-666-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-750-001"        SA-permission-750-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-755-001"        SA-permission-755-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-700-001"        SA-permission-700-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-770-001"        SA-permission-770-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-775-001"        SA-permission-775-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-777-001"        SA-permission-777-001
#
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-dir-001"        SA-permission-dir-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-grp-10000-001"  SA-permission-grp-10000-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-own-10000-001"  SA-permission-own-10000-001
#
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-filename-nospace-001"      SA-filename-nospace-001
#
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-shellcheck-001"            SA-shellcheck-001
#

if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "DEBUG" "  Operation finished..." 1>&2 ; fi
###
