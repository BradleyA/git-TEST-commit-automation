#!/bin/bash
# 	hooks/EXAMPLES/TEST/FVT-option-usage-003/SAST-setup.sh  3.492.747  2019-09-01T00:08:57.578303-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.491  
# 	   copy latest SAST-setup.sh & #  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001"          FVT-option-help-001 
###  hooks/EXAMPLES/SAST-setup.sh - This script is optional.  It runs before test cases
#    are run, if SAST-setup.sh is found in TEST/<file_name>/
#    Static Analysis Software Testing (SAST) - examination of code prior to the program’s execution
#    SAST is code analysis, syntax, permission, code inspection, code review, data flow
#    analysis, and walkthrough (manually reviewing algorithms as well as documents to
#    find any errors).
###  Production standard 3.0 shellcheck
###  Production standard 5.1.160 Copyright
#    Copyright (c) 2019 Bradley Allen
#    MIT License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.
###  Production standard 1.3.475 DEBUG variable
#    Order of precedence: environment variable, default code
if [[ "${DEBUG}" == ""  ]] ; then DEBUG="0" ; fi   # 0 = debug off, 1 = debug on, 'export DEBUG=1', 'unset DEBUG' to unset environment variable (bash)
if [[ "${DEBUG}" == "2" ]] ; then set -x    ; fi   # Print trace of simple commands before they are executed
if [[ "${DEBUG}" == "3" ]] ; then set -v    ; fi   # Print shell input lines as they are read
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

###  Production standard 10.0 TESTing 
#    Remove output from previous run of test cases
rm -f SAST-*.test-case-output

REPOSITORY_DIR=${1}

#    Uncomment shared TEST cases for command
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-permission-644-001"      SAST-permission-644-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-permission-664-001"      SAST-permission-664-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-permission-755-001"      SAST-permission-755-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-permission-775-001"      SAST-permission-775-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-shellcheck-001"           SAST-shellcheck-001
#
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-exit-code-error-124-001" SAST-exit-code-error-124-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-exit-code-error-124-002" SAST-exit-code-error-124-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-exit-code-error-2-001"   SAST-exit-code-error-2-001

if [[ "${DEBUG}" == "1" ]] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Operation finished." 1>&2 ; fi
###
