#!/bin/bash
# 	hooks/EXAMPLES/TEST/FVT-setup.sh/SA-setup.sh  2.28.309  2019-09-02T11:50:52.756561-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.27-1-g33b15cd  
# 	   SA-setup.sh  change permission to 775 and update Production standard 1.3.496 DEBUG variable 
# 	hooks/EXAMPLES/SA-setup.sh  2.3.273  2019-09-01T13:49:00.664777-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.2-2-g3eeb9dd  
# 	   hooks/EXAMPLES/SA-setup.sh    Rename SAST to SA for Static Analysis #1 
# 	hooks/EXAMPLES/SAST-setup.sh  3.492.747  2019-09-01T00:08:55.943899-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.491  
# 	   copy latest SAST-setup.sh & #  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001"          FVT-option-help-001 
# 	hooks/EXAMPLES/SAST-setup.sh  3.488.743  2019-08-31T23:14:10.141041-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.487  
# 	   SCRIPT_VERSION incident corrected and correct Test script logic ERROR message 
# 	hooks/EXAMPLES/SAST-setup.sh  3.488.743  2019-08-31T23:11:41.512764-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.487  
# 	   SCRIPT_VERSION incident corrected and correct Test script logic ERROR message 
###  hooks/EXAMPLES/SA-setup.sh - This script is optional.  It runs before test cases
#    are run, if SA-setup.sh is found in TEST/<file_name>/
#    Static Analysis (SA) - examination of code prior to the program’s execution
#    SA is code analysis, syntax, permission, code inspection, code review, data flow
#    analysis, and walkthrough (manually reviewing algorithms as well as documents to
#    find any errors).
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

###  Production standard 10.0 TESTing 
#    Remove output from previous run of test cases
rm -f SA-*.test-case-output

REPOSITORY_DIR=${1}

#    Uncomment shared TEST cases for command
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-644-001"      SA-permission-644-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-664-001"      SA-permission-664-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-755-001"      SA-permission-755-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-permission-775-001"      SA-permission-775-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-shellcheck-001"           SA-shellcheck-001
#
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-exit-code-error-124-001" SA-exit-code-error-124-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-exit-code-error-124-002" SA-exit-code-error-124-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SA-exit-code-error-2-001"   SA-exit-code-error-2-001

if [[ "${DEBUG}" == "1" ]] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Operation finished." 1>&2 ; fi
###
