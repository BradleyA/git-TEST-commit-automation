#!/bin/bash
# 	hooks/EXAMPLES/FVT-setup.sh  3.488.743  2019-08-31T23:13:27.607919-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.487  
# 	   SCRIPT_VERSION incident corrected and correct Test script logic ERROR message 
# 	hooks/EXAMPLES/FVT-setup.sh  3.488.743  2019-08-31T23:11:17.014756-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.487  
# 	   SCRIPT_VERSION incident corrected and correct Test script logic ERROR message 
# 	hooks/EXAMPLES/FVT-setup.sh  3.485.740  2019-08-31T21:19:16.394013-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.484  
# 	   hooks/EXAMPLES/FVT-setup.sh   few typos 
###  hooks/EXAMPLES/FVT-setup.sh - This script is optional.  It runs before test cases
#    are run, if FVT-setup.sh is found in TEST/<file_name>/
#    Functional Verification Testing (FVT) - verify that the program logic conforms to
#    design specification.  FVT attempts to answer the question "Does this program logic
#    do what is intended?"
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
rm -f FVT-*.test-case-output

REPOSITORY_DIR=${1}

#    Uncomment shared TEST cases for TESTing
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001"          FVT-option-help-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-002"          FVT-option-help-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-003"          FVT-option-help-003
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-004"          FVT-option-help-004
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-005"          FVT-option-help-005
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-006"          FVT-option-help-006
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-001"         FVT-option-usage-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-002"         FVT-option-usage-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-003"         FVT-option-usage-003
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-001"       FVT-option-version-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-002"       FVT-option-version-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-003"       FVT-option-version-003
#
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-124-001"  FVT-exit-code-error-124-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-124-002"  FVT-exit-code-error-124-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-2-001"    FVT-exit-code-error-2-001
#
if [[ "${DEBUG}" == "1" ]] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Operation finished." 1>&2 ; fi
###
