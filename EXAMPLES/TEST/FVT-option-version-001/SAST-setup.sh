#!/bin/bash
# 	hooks/EXAMPLES/TEST/FVT-option-version-001/SAST-setup.sh  3.413.654  2019-08-21T11:47:40.618085-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.412  
# 	   hooks/EXAMPLES/TEST/FVT-option-version-001/SAST-setup.sh   get latest version 
###
#	SAST-setup.sh -  This script is optional.  It runs before test cases are run, if SAST-setup.sh is found in TEST/<file_name>/
#	   Static Analysis Software Testing (SAST) - examination of the code prior to the program’s execution
#	   SAST is code analysis, syntax, permission, code inspection, code review, data flow analysis, and
#	   walkthrough (manually reviewing algorithms as well as documents to find any errors).
### production standard 3.0 shellcheck
### production standard 5.1.160 Copyright
#	Copyright (c) 2019 Bradley Allen
#	MIT License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.
### production standard 1.0 DEBUG variable
#       Order of precedence: environment variable, default code
if [ "${DEBUG}" == "" ] ; then DEBUG="0" ; fi   # 0 = debug off, 1 = debug on, 'export DEBUG=1', 'unset DEBUG' to unset environment variable (bash)
BOLD=$(tput -Txterm bold)
NORMAL=$(tput -Txterm sgr0)
#       Date and time function ISO 8601
get_date_stamp() {
DATE_STAMP=$(date +%Y-%m-%dT%H:%M:%S.%6N%:z)
TEMP=$(date +%Z)
DATE_STAMP="${DATE_STAMP} (${TEMP})"
}
#       Fully qualified domain name FQDN hostname
LOCALHOST=$(hostname -f)
#       Version
SCRIPT_VERSION=$(head -2 "${0}" | awk '{printf $3}')

### production standard 10.0 TESTing 
#	Remove output from previous run of test cases
rm -f SAST-*.test-case-output

REPOSITORY_DIR=${1}

#	uncomment shared TEST cases for command
#       ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-permission-644-001" SAST-permission-644-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-permission-755-001" SAST-permission-755-001
#	ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-permission-775-001" SAST-permission-775-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-shellcheck-001" SAST-shellcheck-001
#
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Operation finished." 1>&2 ; fi
###
