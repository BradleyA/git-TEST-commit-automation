#!/bin/bash
# 	hooks/EXAMPLES/SA-setup.sh  3.1.266.2025  2020-12-04T17:17:17.286211-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.265-1-gc61878b  
# 	   hooks/EXAMPLES/FVT-cleanup.sh hooks/EXAMPLES/FVT-option-add-001 hooks/EXAMPLES/FVT-option-all-001 hooks/EXAMPLES/FVT-setup.sh hooks/EXAMPLES/SA-cleanup.sh hooks/EXAMPLES/SA-exit-code-error-124-001 hooks/EXAMPLES/SA-exit-code-error-124-002 hooks/EXAMPLES/SA-exit-code-error-2-001 hooks/EXAMPLES/SA-permission-400-001 hooks/EXAMPLES/SA-permission-440-001 hooks/EXAMPLES/SA-permission-444-001 hooks/EXAMPLES/SA-permission-600-001 hooks/EXAMPLES/SA-permission-640-001 hooks/EXAMPLES/SA-permission-644-001 hooks/EXAMPLES/SA-permission-660-001 hooks/EXAMPLES/SA-permission-664-001 hooks/EXAMPLES/SA-permission-666-001 hooks/EXAMPLES/SA-permission-700-001 hooks/EXAMPLES/SA-permission-750-001 hooks/EXAMPLES/SA-permission-755-001 hooks/EXAMPLES/SA-permission-770-001 hooks/EXAMPLES/SA-permission-775-001 hooks/EXAMPLES/SA-permission-777-001 hooks/EXAMPLES/SA-permission-dir-001 hooks/EXAMPLES/SA-permission-grp-10000-001 hooks/EXAMPLES/SA-permission-own-10000-001 hooks/EXAMPLES/SA-setup.sh hooks/EXAMPLES/SA-shellcheck-001 hooks/EXAMPLES/SA-type-tar-V7-001 hooks/post-commit -->   typo  
# 	hooks/EXAMPLES/SA-setup.sh  3.1.221.1969  2020-12-03T17:50:26.528335-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.220  
# 	   hooks/EXAMPLES/SA-setup.sh -->   Production standard 1.3.614 DEBUG variable  Production standard 2.3.614 Log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)  
#86# hooks/EXAMPLES/SA-setup.sh - This script is optional.  It is for 
#    'Production standard 10.0 TESTing' test cases.  Copy it to TEST/<file_name>/.
#    If SA-setup.sh is found in TEST/<file_name>/ post-commit executes it.
#    Static Analysis (SA) - examination of code prior to the program’s execution
#    SA is code analysis, syntax, permission, code inspection, code review, etc
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
CYAN=$(tput   setaf 6)
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

###  Production standard 10.0 TESTing 

if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "${BOLD}  REPOSITORY_ABSOLUTE_PATH >${BOLD}${CYAN}${REPOSITORY_ABSOLUTE_PATH}${NORMAL}<  REPOSITORY_DIR_COUNT  >${BOLD}${CYAN}${REPOSITORY_DIR_COUNT}${NORMAL}<  EXAMPLES_DIRECTORY >${BOLD}${CYAN}${EXAMPLES_DIRECTORY}${NORMAL}<" 1>&2 ; fi  # 1.3.614

#    Uncomment shared TEST cases for command
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-exit-code-error-124-001"   SA-exit-code-error-124-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-exit-code-error-124-002"   SA-exit-code-error-124-002
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-exit-code-error-2-001"     SA-exit-code-error-2-001
#
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-400-001"        SA-permission-400-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-440-001"        SA-permission-440-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-444-001"        SA-permission-444-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-640-001"        SA-permission-640-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-644-001"        SA-permission-644-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-664-001"        SA-permission-664-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-600-001"        SA-permission-600-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-660-001"        SA-permission-660-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-666-001"        SA-permission-666-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-750-001"        SA-permission-750-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-755-001"        SA-permission-755-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-700-001"        SA-permission-700-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-770-001"        SA-permission-770-001
ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-775-001"        SA-permission-775-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-777-001"        SA-permission-777-001
#
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-dir-001"        SA-permission-dir-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-grp-10000-001"  SA-permission-grp-10000-001
#  ln -fs "${EXAMPLES_DIRECTORY}/SA-permission-own-10000-001"  SA-permission-own-10000-001
#
ln -fs "${EXAMPLES_DIRECTORY}/SA-shellcheck-001"            SA-shellcheck-001
#

if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "${BOLD}${CYAN}  Operation finished...${NORMAL}" 1>&2 ; fi  # 1.3.614
###
