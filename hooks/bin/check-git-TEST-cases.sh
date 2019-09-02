#!/bin/bash
# 	hooks/bin/check-git-TEST-cases.sh  2.24.304  2019-09-02T09:19:27.945746-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.23  
# 	   hooks/bin/check-git-TEST-cases.sh - add support for clean file need testing #3 
# 	hooks/bin/check-git-TEST-cases.sh  2.23.303  2019-09-02T09:09:45.577247-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.22  
# 	   updated Production standard 1.3.496 DEBUG variable 
# 	hooks/bin/check-git-TEST-cases.sh  2.22.302  2019-09-02T08:45:34.772225-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.21-2-g0b19d58 
# 	   hooks/bin/check-git-TEST-cases.sh  correct incident from last night  3 line were deleted and added back 
# 	hooks/bin/check-git-TEST-cases.sh  2.7.285  2019-09-01T18:15:07.870384-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.6-1-g9568dd7  
# 	   hooks/bin/check-git-TEST-cases.sh  add support to execute clean if found in TEST/<command>/ 
# 	hooks/bin/check-git-TEST-cases.sh  3.437.684  2019-08-22T23:14:27.310360-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.436  
# 	   hooks/bin/check-git-TEST-cases.sh  added to check-git-TEST-cases.sh clean rm -f FVT-*.test-case-output & rm -f SAST-*.test-case-output 
# 	hooks/bin/check-git-TEST-cases.sh  3.436.683  2019-08-22T22:43:19.610899-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.435  
# 	   hooks/bin/check-git-TEST-cases.sh added color to output and update comment 
###   hooks/bin/check-git-TEST-cases.sh -  search from top of repository to list TEST directory test cases
#       check-git-TEST-cases.sh all - runs FVT-setup.sh and SA-setup.sh to create symbolic links to EXAMPLES before listing all test cases
#       check-git-TEST-cases.sh clean - remove symbolic links from TEST/<command>/ directories
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
REPOSITORY_DIR=$(git rev-parse --show-toplevel)
cd "${REPOSITORY_DIR}"
DIR_LIST=$(find . -type d -name TEST)
for i in $DIR_LIST ; do
  TEST_CASE_DIR_LIST=$(ls -1d "${i}"/* | cut -c 3-)
  for j in ${TEST_CASE_DIR_LIST} ; do 
    TEST_CASE_DIR_END=$(echo "${j}" | rev | cut -d '/' -f 1 | rev)
    TEST_CASE_DIR_START="${j//${TEST_CASE_DIR_END}/}"
    printf "${TEST_CASE_DIR_START}\e[1;33m${TEST_CASE_DIR_END}\033[0m \n"
    if [[ "${1}" == "all" ]] && [[ -x "${j}/FVT-setup.sh" ]]  ; then cd "${REPOSITORY_DIR}/${j}" ; (. ./FVT-setup.sh  "${REPOSITORY_DIR}") ; cd "${REPOSITORY_DIR}" ; fi
    if [[ "${1}" == "all" ]] && [[ -x "${j}/SA-setup.sh" ]] ; then cd "${REPOSITORY_DIR}/${j}" ; (. ./SA-setup.sh "${REPOSITORY_DIR}") ; cd "${REPOSITORY_DIR}" ; fi
    if [[ "${1}" == "clean" ]]  ; then cd "${REPOSITORY_DIR}/${j}" ; for k in $(ls -1) ; do { [ ! -L "${k}" ] || rm -v "${k}"; } ; rm -f FVT-*.test-case-output ; rm -f SA-*.test-case-output ; done ; cd "${REPOSITORY_DIR}" ; if [[ -x "${REPOSITORY_DIR}/${j}/clean" ]]  ; then cd "${REPOSITORY_DIR}/${j}" ; (. ./clean) ; cd "${REPOSITORY_DIR}" ; fi ; fi
    printf "\033[1;32m $(ls -1  "${j}" | grep -v "\." | sed 's/^/\t/')\033[0m \n"
    printf "\033[1;36m $(ls -1  "${j}" | grep "setup.sh" | sed 's/^/\t/')\033[0m\n"
  done
done

#
if [[ "${DEBUG}" == "1" ]] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Operation finished." 1>&2 ; fi
###
