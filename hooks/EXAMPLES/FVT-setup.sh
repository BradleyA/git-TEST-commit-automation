#!/bin/bash
# 	hooks/EXAMPLES/FVT-setup.sh  2.41.366  2019-09-05T15:40:08.178299-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.40  
# 	   correct shellcheck incidents SC2046 
# 	hooks/EXAMPLES/FVT-setup.sh  2.40.365  2019-09-05T15:10:32.849003-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.39-41-g76a187e  
# 	   close #11 hooks/EXAMPLES/FVT-setup.sh  upgraded Production standard 1.3.496 DEBUG variable ; added REPOSITORY_DIR for #11 ; added more ln 
#86# hooks/EXAMPLES/FVT-setup.sh - This script is optional.  It is for setting up
#    'Production standard 10.0 TESTing' test cases.  Copy it to TEST/<file_name>/.
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
SCRIPT_VERSION=$(head -2 "${0}" | awk '{printf $3}')

if [[ "${DEBUG}" == "1" ]] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Operation started." 1>&2 ; fi

###  Production standard 10.0 TESTing
#    Remove output from previous run of test cases
rm -f FVT-*.test-case-output

if [[ ! -z "${1}" ]] ; then  # post-commit must pass REPOSITORY_DIR because post-commit is executed in .git/hooks/ which is not in the repository
  REPOSITORY_DIR=${1}
else
  REPOSITORY_DIR=$(git rev-parse --show-toplevel)  #  not called by post-commit
  if [[ "${0}" != $(basename "${0}") ]] ; then  #  is script executed in TEST/<COMMIT_FILE_NAME>/ directory
    cd "$(dirname "${0}")"
  fi
fi

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
#  ln -fs FVT-option-version-001.expected                                 FVT-option-version-002.expected
#  ln -fs FVT-option-version-001.expected                                 FVT-option-version-003.expected
#
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-124-001"  FVT-exit-code-error-124-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-124-002"  FVT-exit-code-error-124-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-2-001"    FVT-exit-code-error-2-001
#
if [[ "${DEBUG}" == "1" ]] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Operation finished." 1>&2 ; fi
###
