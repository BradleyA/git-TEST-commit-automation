#!/bin/bash
# 	hooks/bin/list-git-TEST-cases.sh  3.437.684  2019-08-22T23:14:27.310360-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.436  
# 	   hooks/bin/list-git-TEST-cases.sh  added to list-git-TEST-cases.sh clean rm -f FVT-*.test-case-output & rm -f SAST-*.test-case-output 
# 	hooks/bin/list-git-TEST-cases.sh  3.437.684  2019-08-22T23:13:43.584470-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.436  
# 	   hooks/bin/list-git-TEST-cases.sh  added to list-git-TEST-cases.sh clean rm -f FVT-*.test-case-output & rm -f SAST-*.test-case-output 
# 	hooks/bin/list-git-TEST-cases.sh  3.436.683  2019-08-22T22:43:19.610899-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.435  
# 	   hooks/bin/list-git-TEST-cases.sh  changed print order so when using clean option it display the directory first 
# 	hooks/bin/list-git-TEST-cases.sh  3.435.682  2019-08-22T22:29:49.612246-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.434  
# 	   hooks/bin/list-git-TEST-cases.sh added options all (run FVT,SAST -setup.sh) , clean to remove symbolics 
# 	hooks/bin/list-git-TEST-cases.sh  3.434.681  2019-08-22T20:49:55.098191-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.433  
# 	   hooks/bin/list-git-TEST-cases.sh added color to output and update comment 
###
#	list-git-TEST-cases.sh -  search from top of repository to list TEST directory test cases
#	   list-git-TEST-cases.sh all - runs FVT-setup.sh and SAST-setup.sh to create symbolic links to EXAMPLES before listing all test cases
#	   list-git-TEST-cases.sh clean - remove symbolic links from TEST/<command>/ directories
### production standard 3.0 shellcheck
### production standard 5.1.160 Copyright
#       Copyright (c) 2019 Bradley Allen
#       MIT License is in the online DOCUMENTATION
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
REPOSITORY_DIR=$(git rev-parse --show-toplevel)
cd "${REPOSITORY_DIR}"
DIR_LIST=$(find . -type d -name TEST)
for i in $DIR_LIST ; do
	TEST_CASE_DIR_LIST=$(ls -1d $i/* | cut -c 3-)
	for j in ${TEST_CASE_DIR_LIST} ; do 
		TEST_CASE_DIR_END=$(echo "${j}" | rev | cut -d '/' -f 1 | rev)
		TEST_CASE_DIR_START="${j//${TEST_CASE_DIR_END}/}"
		printf "${TEST_CASE_DIR_START}\e[1;33m${TEST_CASE_DIR_END}\033[0m \n"
		if [ "${1}" == "all" ] && [ -x "${j}/FVT-setup.sh" ]  ; then cd "${REPOSITORY_DIR}/${j}" ; ./FVT-setup.sh  "${REPOSITORY_DIR}" ; cd "${REPOSITORY_DIR}" ; fi
		if [ "${1}" == "all" ] && [ -x "${j}/SAST-setup.sh" ] ; then cd "${REPOSITORY_DIR}/${j}" ; ./SAST-setup.sh "${REPOSITORY_DIR}" ; cd "${REPOSITORY_DIR}" ; fi
		if [ "${1}" == "clean" ]  ; then cd "${REPOSITORY_DIR}/${j}" ; for k in $(ls -1) ; do { [ ! -L "${k}" ] || rm -v "${k}"; } ; rm -f FVT-*.test-case-output ; rm -f SAST-*.test-case-output ; done ; cd "${REPOSITORY_DIR}" ; fi
		printf "\033[1;32m $(ls -1  "${j}" | grep -v "\." | sed 's/^/\t/')\033[0m \n"
		printf "\033[1;36m $(ls -1  "${j}" | grep "setup.sh" | sed 's/^/\t/')\033[0m\n"
	done
done

#
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Operation finished." 1>&2 ; fi
###

