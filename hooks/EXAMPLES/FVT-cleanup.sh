#!/bin/bash
# 	hooks/EXAMPLES/FVT-cleanup.sh  3.1.260.2013  2020-12-04T15:24:24.660008-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.259  
# 	   hooks/EXAMPLES/FVT-cleanup.sh hooks/EXAMPLES/FVT-setup.sh -->   Production standard 1.3.614 DEBUG variable  Production standard 2.3.614 Log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)  
# 	hooks/EXAMPLES/FVT-cleanup.sh  3.1.102.1743  2020-10-24T13:07:39.902398-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.101  
# 	   hooks/EXAMPLES/FVT-cleanup.sh -->   modify cleanup loop logic to reduce the amount of time required  
# 	hooks/EXAMPLES/FVT-cleanup.sh  3.1.31.1577  2020-05-22T05:54:31.648111-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.30  
# 	   hooks/EXAMPLES/FVT-cleanup.sh -->   upgrade Production standards #49  
# 	hooks/EXAMPLES/FVT-cleanup.sh  2.448.1343  2020-01-30T15:48:37.268184-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 2.447-1-g2544b53  
# 	   hooks/EXAMPLES/FVT-*   added This script does not support -* or help or usage or version 
# 	hooks/EXAMPLES/FVT-cleanup.sh  2.271.1069  2020-01-21T15:02:14.598141-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  dev  uadmin  five-rpi3b.cptx86.com 2.270-1-g01cdcc2  
# 	   FVT-cleanup.sh   Production standard 5.3.559 Copyright and correct an incident found during testing 
# 	hooks/bin/TEST/git-TEST-cases.sh/FVT-cleanup.sh  2.269.1066  2020-01-20T12:55:38.659739-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  dev  uadmin  five-rpi3b.cptx86.com 2.268  
# 	   hooks/bin/TEST/git-TEST-cases.sh/FVT-setup.sh hooks/bin/TEST/git-TEST-cases.sh/FVT-cleanup.sh   copy FVT- scripts to customize 
#86# hooks/bin/TEST/git-TEST-cases.sh/FVT-cleanup.sh  -  test case cleanup
###  Production standard 3.0 shellcheck
###  Production standard 5.3.559 Copyright                                    # 3.559
#    Copyright (c) 2020 Bradley Allen                                                # 3.555
#    MIT License is online in the repository as a file named LICENSE"         # 3.559
###  Production standard 1.3.614 DEBUG variable
#    Order of precedence: environment variable, default code
if [[ "${DEBUG}" == ""  ]] ; then DEBUG="0" ; fi   # 0 = debug off, 1 = debug on, 'export DEBUG=1', 'unset DEBUG' to unset environment variable (bash)
if [[ "${DEBUG}" == "2" ]] ; then set -x    ; fi   # Print trace of simple commands before they are executed
if [[ "${DEBUG}" == "3" ]] ; then set -v    ; fi   # Print shell input lines as they are read
if [[ "${DEBUG}" == "4" ]] ; then set -e    ; fi   # Exit immediately if non-zero exit status
if [[ "${DEBUG}" == "5" ]] ; then set -e -o pipefail ; fi   # Exit immediately if non-zero exit status and exit if any command in a pipeline errors
#
BOLD=$(tput -Txterm bold)
UNDERLINE=$(tput -Txterm sgr 0 1)  # 0.3.583
NORMAL=$(tput -Txterm sgr0)
RED=$(tput    setaf 1)
YELLOW=$(tput setaf 3)
BLUE=$(tput   setaf 4)
PURPLE=$(tput setaf 5)
WHITE=$(tput  setaf 7)

#    Date and time function ISO 8601
get_date_stamp() {
  DATE_STAMP=$(date +%Y-%m-%dT%H:%M:%S.%6N%:z)
  TEMP=$(date +%Z)
  DATE_STAMP="${DATE_STAMP} (${TEMP})"
}

#    Fully qualified domain name FQDN hostname
LOCALHOST=$(hostname -f)

#    Version
#    Assumptions for the next two lines of code:  The second line in this script includes the script path & name as the second item and
#    the script version as the third item separated with space(s).  The tool I use is called 'markit'. See example line below:
#       template/template.sh  3.517.783  2019-09-13T18:20:42.144356-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.516  
SCRIPT_NAME=$(head -2 "${0}" | awk '{printf $2}')  #  Different from ${COMMAND_NAME}=$(echo "${0}" | sed 's/^.*\///'), SCRIPT_NAME = includes Git repository directory and can be used any where in script (for dev, test teams)
SCRIPT_VERSION=$(head -2 "${0}" | awk '{printf $3}')
if [[ "${SCRIPT_NAME}" == "" ]] ; then SCRIPT_NAME="${0}" ; fi
if [[ "${SCRIPT_VERSION}" == "" ]] ; then SCRIPT_VERSION="v?.?" ; fi

#    GID
GROUP_ID=$(id -g)

###  Production standard 2.3.614 Log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)
new_message() {  #  $1="${LINENO}"  $2="DEBUG INFO ERROR WARN"  $3="message"
  get_date_stamp
  echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${BOLD}${CYAN}${SCRIPT_NAME}${NORMAL}[$$] ${BOLD}${BLUE}${SCRIPT_VERSION} ${PURPLE}${1}${NORMAL} ${USER} ${UID}:${GROUP_ID} ${BOLD}[${2}]${NORMAL}  ${3}"  # 2.3.614
}

#    INFO
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "${BOLD}${CYAN}  Started...${NORMAL}" 1>&2 ; fi  # 1.3.614

#    This script does not support -* or help or usage or version
if [[ "${1}" == -* ]] || [[ "${1}" == "help" ]] || [[ "${1}" == "usage" ]] || [[ "${1}" == "version" ]]  ; then
  new_message "${LINENO}" "${RED}ERROR${WHITE}" "  Option, ${YELLOW}${1}${WHITE}, is not supported with ${SCRIPT_NAME}." 1>&2
  #    User Hint
  echo -e "    For more information:\n${BOLD}${YELLOW}    ${UNDERLINE}https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks#git-test-commit-automation------${NORMAL}"
  exit 1
fi

###  Place test case cleanup here 

if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "${BOLD}  REPOSITORY_ABSOLUTE_PATH >${CYAN}${REPOSITORY_ABSOLUTE_PATH}<${NORMAL}  REPOSITORY_DIR_COUNT  >${BOLD}${CYAN}${REPOSITORY_DIR_COUNT}${NORMAL}<  EXAMPLES_DIRECTORY >${CYAN}${EXAMPLES_DIRECTORY}<${NORMAL}" 1>&2 ; fi  # 1.3.614

#    Remove output from previous run of test cases
rm -f FVT-*.test-case-output
#    Remove temporary files
#  rm -f temporary files
rm -f FVT-option-version-001.expected  # This file is created when running the test case
rm -f FVT-option-version-002.expected  # This file is created when running the test case
rm -f FVT-option-version-003.expected  # This file is created when running the test case
rm -f FVT-option-version-004.expected  # This file is created when running the test case
#    Remove linked FVT-* files except FVT-cleanup.sh and FVT-setup.sh
for k in $(ls -1 FVT-*) ; do
  if [[ "${k}" != "FVT-cleanup.sh" ]] ; then
    if [[ "${k}" != "FVT-setup.sh" ]] ; then
      if [[ -L "${k}" ]] ; then rm "${k}"  #  Remove files with symbolic link
      elif [[ -s "${k}" ]] ; then rm "${k}"  #  Remove files that has a size of zero
        if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  Empty file ${BOLD}${CYAN}${k}${NORMAL}" 1>&2 ; fi
      fi
    fi
  fi
done

if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "${BOLD}${CYAN}  Operation finished...${NORMAL}" 1>&2 ; fi  # 1.3.614
###
