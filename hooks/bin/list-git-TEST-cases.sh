#!/bin/bash
# 	hooks/bin/list-git-TEST-cases.sh  2.69.503  2019-09-13T17:23:43.053898-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.68  
# 	   hooks/bin/list-git-TEST-cases.sh   update OPTIONS section 
# 	hooks/bin/list-git-TEST-cases.sh  2.68.502  2019-09-13T15:32:21.335831-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.67-5-gc55308b  
# 	   hooks/bin/uninstall-git-TEST-cases.sh hooks/bin/setup-git-TEST-cases.sh update for name change from check-git-TEST-cases.sh to list-git-TEST-cases.sh 
#86# hooks/bin/list-git-TEST-cases.sh -  search from top of repository to list TEST directory test cases
#       list-git-TEST-cases.sh all - runs FVT-setup.sh and SA-setup.sh to create symbolic links to EXAMPLES before listing all test cases
#       list-git-TEST-cases.sh clean - remove symbolic links from TEST/<command>/ directories
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
###  Production standard 8.3.214 --usage
display_usage() {
COMMAND_NAME=$(echo "${0}" | sed 's/^.*\///')
echo -e "\n${NORMAL}${COMMAND_NAME}\n   search from top of repository to list TEST directory test cases"
echo -e "\n${BOLD}USAGE${NORMAL}"
echo    "   ${COMMAND_NAME} [-A | --ALL] [-a | --all] [-c | --clean] [-n | --none]"
echo -e "                   [-f <GIT_PATH>/<FILE_NAME> | --filename <GIT_PATH>/<FILE_NAME>]\n"
echo    "   ${COMMAND_NAME} [--help | -help | help | -h | h | -?]"
echo    "   ${COMMAND_NAME} [--usage | -usage | -u]"
echo    "   ${COMMAND_NAME} [--version | -version | -v]"
}
###  Production standard 0.3.214 --help
display_help() {
display_usage
#    Displaying help DESCRIPTION in English en_US.UTF-8
echo -e "\n${BOLD}DESCRIPTION${NORMAL}"
echo    "<your help goes here>"
echo    ">>> NEED TO COMPLETE THIS SOON, ONCE I KNOW HOW IT IS GOING TO WORK :-) <<<    |"

echo -e "\n<<Paragraph two>>"

###  Production standard 1.3.516 DEBUG variable
echo -e "\nThe DEBUG environment variable can be set to '', '0', '1', '2', '3', or '4'."
echo    "The setting '' or '0' will turn off all DEBUG messages during execution of this"
echo    "script.  The setting '1' will print all DEBUG messages during execution of this"
echo    "script.  The setting '2' (set -x) will print a trace of simple commands before"
echo    "they are executed in this script.  The setting '3' (set -v) will print shell"
echo    "input lines as they are read.  The setting '4' (set -e) will exit immediately"
echo    "if non-zero exit status is recieved with some exceptions.  For more information"
echo    "about any of the set options, see man bash."
###  Production standard 4.0 Documentation Language
#    Displaying help DESCRIPTION in French fr_CA.UTF-8, fr_FR.UTF-8, fr_CH.UTF-8
if [[ "${LANG}" == "fr_CA.UTF-8" ]] || [[ "${LANG}" == "fr_FR.UTF-8" ]] || [[ "${LANG}" == "fr_CH.UTF-8" ]] ; then
  echo -e "\n--> ${LANG}"
  echo    "<votre aide va ici>" # your help goes here
  echo    "Souhaitez-vous traduire la section description?" # Do you want to translate the description section?
elif ! [[ "${LANG}" == "en_US.UTF-8" ]] ; then
  get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[WARN]${NORMAL}  Your language, ${LANG}, is not supported.  Would you like to translate the description section?" 1>&2
fi
echo -e "\n${BOLD}ENVIRONMENT VARIABLES${NORMAL}"
echo    "If using the bash shell, enter; 'export DEBUG=1' on the command line to set"
echo    "the environment variable DEBUG to '1' (0 = debug off, 1 = debug on).  Use the"
echo    "command, 'unset DEBUG' to remove the exported information from the environment"
echo    "variable DEBUG.  You are on your own defining environment variables if"
echo    "you are using other shells."
echo    "   DEBUG           (default off '0')"
echo -e "\n${BOLD}OPTIONS${NORMAL}"
echo -e "Order of precedence: CLI options, environment variable, default code.\n"
echo    "   -A, --ALL"
echo -e "\tPrint all files with test cases including hooks/"
echo    "   -a, --all"
echo -e "\tPrint all files with test cases exclude hooks/"
echo    "   -c, --clean"
echo -e "\tRemove linked TEST cases and run FVT-cleanup.sh & SA-cleanup.sh"
echo    "   -f, --filename, -f=, --filename=<FILENAME>"
echo -e "\tPrint all <FILENAME> TEST cases"
echo    "   -n, --none"
echo -e "\tPrint all files that do NOT have TEST cases"
###  Production standard 6.1.177 Architecture tree
echo -e "\n${BOLD}ARCHITECTURE TREE${NORMAL}"  # STORAGE & CERTIFICATION


echo -e "\n${BOLD}DOCUMENTATION${NORMAL}"
echo    "   https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md"
echo -e "\n${BOLD}EXAMPLES${NORMAL}"
echo -e "   <<your code examples description goes here>>\n\t${BOLD}${COMMAND_NAME} <<code example goes here>>${NORMAL}"
echo -e "   <<your code examples description goes here>>\n\t${BOLD}${COMMAND_NAME}${NORMAL}"
}

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

#    INFO
if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "INFO" "  Started..." 1>&2 ; fi

#    Added following code because USER is not defined in crobtab jobs
if ! [[ "${USER}" == "${LOGNAME}" ]] ; then  USER=${LOGNAME} ; fi
if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "DEBUG" "  Setting USER to support crobtab...  USER >${USER}<  LOGNAME >${LOGNAME}<" 1>&2 ; fi

#    DEBUG
if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "INFO" "  Name_of_command >${SCRIPT_NAME}< Name_of_arg1 >${1}< Name_of_arg2 >${2}< Name_of_arg3 >${3}<  Version of bash ${BASH_VERSION}" 1>&2 ; fi

###  Production standard 9.3.513 Parse CLI options and arguments
#	hooks/bin/list-git-TEST-cases.sh - add option to not show TEST cases for hooks/
#	-A --ALL               1) show all files with test cases including hooks/ files and test cases
#	-a --all               2) show all files with test cases but none in hooks/ directory
#       -c --clean             3) remove symbolic TEST case links and run *cleanup.sh from TEST/<command>/ directories
#	-f --filename -f= --filename=  4) show only one file with all files in TEST case directory
#	-n --none              5.1) show all files that do NOT have any TEST/<FILE_NAME>/ directory #18
#	                       5.2) show all files that do NOT have any files in TEST/<FILE_NAME>/ directory

while [[ "${#}" -gt 0 ]] ; do
  case "${1}" in
    --help|-help|help|-h|h|-\?)  display_help | more ; exit 0 ;;
    --usage|-usage|usage|-u)  display_usage ; exit 0  ;;
    --version|-version|version|-v)  echo "${SCRIPT_NAME} ${SCRIPT_VERSION}" ; exit 0  ;;
    -A|--ALL)   ;;
    -a|--all)   ;;
    -c|--clean) ;;
    -f|--filename)  if [[ "${2}" == "" ]] ; then  display_usage ; new_message "${SCRIPT_NAME}" "${LINENO}" "ERROR" "  Argument for ${1} is not found on command line" 1>&2 ; exit 1 ; fi ; FILE_NAME=${2} ; shift 2 ;;
    -n|--none)  ;;
    *)  new_message "${SCRIPT_NAME}" "${LINENO}" "ERROR" "  Option, ${1}, entered on the command line is not supported." 1>&2 ; display_usage ; exit 1 ; ;;
  esac
done
if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "DEBUG" "  Variable... ADMUSER >${ADMUSER}< CLUSTER >${CLUSTER}< DATA_DIR >${DATA_DIR}< FILE_NAME >${FILE_NAME}< SSH_USER >${SSH_USER}< USER_HOME >${USER_HOME}<" 1>&2 ; fi

###

###  Production standard 10.0 TESTing
REPOSITORY_DIR=$(git rev-parse --show-toplevel)
cd "${REPOSITORY_DIR}"
DIR_LIST=$(find . -type d -name TEST)  #  create list of TEST directories
for i in $DIR_LIST ; do
  TEST_CASE_DIR_LIST=$(ls -1d "${i}"/* | cut -c 3-)
  for j in ${TEST_CASE_DIR_LIST} ; do 
    TEST_CASE_DIR_END=$(echo "${j}" | rev | cut -d '/' -f 1 | rev)
    TEST_CASE_DIR_START="${j//${TEST_CASE_DIR_END}/}"
    printf "${TEST_CASE_DIR_START}\e[1;33m${TEST_CASE_DIR_END}\033[0m \n"
    if [[ "${1}" == "all" ]] && [[ -x "${j}/FVT-setup.sh" ]]  ; then cd "${REPOSITORY_DIR}/${j}" ; (. ./FVT-setup.sh  "${REPOSITORY_DIR}") ; cd "${REPOSITORY_DIR}" ; fi
    if [[ "${1}" == "all" ]] && [[ -x "${j}/SA-setup.sh" ]] ; then cd "${REPOSITORY_DIR}/${j}" ; (. ./SA-setup.sh "${REPOSITORY_DIR}") ; cd "${REPOSITORY_DIR}" ; fi
    if [[ "${1}" == "clean" ]]  ; then cd "${REPOSITORY_DIR}/${j}" ; for k in $(ls -1) ; do { [ ! -L "${k}" ] || rm -v "${k}"; } ; rm -f FVT-*.test-case-output ; rm -f SA-*.test-case-output ; done ; cd "${REPOSITORY_DIR}" ; if [[ -x "${REPOSITORY_DIR}/${j}/clean" ]]  ; then cd "${REPOSITORY_DIR}/${j}" ; (. ./SA-cleanup.sh) ; (. ./FVT-cleanup.sh) ; cd "${REPOSITORY_DIR}" ; fi ; fi
    printf "\033[1;32m $(ls -1  "${j}" | grep -v "\." | sed 's/^/\t/')\033[0m \n"
    printf "\033[1;36m $(ls -1  "${j}" | grep "setup.sh" | sed 's/^/\t/')\033[0m\n"
  done
done

#
if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "INFO" "  Operation finished..." 1>&2 ; fi
###
