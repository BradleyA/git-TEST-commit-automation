#!/bin/bash
# 	hooks/bin/git-TEST-cases.sh  2.355.1242  2020-01-25T15:58:27.201972-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 2.354  
# 	   # 
# 	hooks/bin/git-TEST-cases.sh  2.342.1225  2020-01-24T20:59:53.478623-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 2.341  
# 	   hooks/bin/git-TEST-cases.sh   Production standard 9.3.562 Parse CLI options and arguments 
# 	hooks/bin/git-TEST-cases.sh  2.271.1069  2020-01-21T15:02:14.982224-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  dev  uadmin  five-rpi3b.cptx86.com 2.270-1-g01cdcc2
# 	   FVT-cleanup.sh   Production standard 5.3.559 Copyright and correct an incident found during testing 
# 	hooks/bin/git-TEST-cases.sh  2.270.1067  2020-01-20T23:20:44.631099-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  dev  uadmin  five-rpi3b.cptx86.com 2.269  
# 	   hooks/bin/git-TEST-cases.sh   Production standard 5.3.559 Copyright, Production standard 1.3.550 DEBUG variable, Production standard 0.3.550 --help, Production standard 2.3.529 log format, Production standard 9.3.558 Parse CLI options and arguments 
# 	hooks/bin/git-TEST-cases.sh  2.208.904  2019-10-12T16:36:32.359495-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.207-1-ga99b68e  
# 	   close #40    git-TEST-cases.sh   - add git add & commit when creating default test case 
#86# hooks/bin/git-TEST-cases.sh  -  lists and manages files in TEST case directories
#       git-TEST-cases.sh all - runs FVT-setup.sh and SA-setup.sh to create symbolic links to EXAMPLES before listing all test cases
#       git-TEST-cases.sh clean - remove symbolic links from TEST/<command>/ directories
###  Production standard 3.0 shellcheck
###  Production standard 5.3.559 Copyright                                    # 3.559
#    Copyright (c) 2020 Bradley Allen                                                # 3.555
#    MIT License is online in the repository as a file named LICENSE"         # 3.559
###  Production standard 1.3.550 DEBUG variable                                             # 3.550
#    Order of precedence: environment variable, default code
if [[ "${DEBUG}" == ""  ]] ; then DEBUG="0" ; fi   # 0 = debug off, 1 = debug on, 'export DEBUG=1', 'unset DEBUG' to unset environment variable (bash)
if [[ "${DEBUG}" == "2" ]] ; then set -x    ; fi   # Print trace of simple commands before they are executed
if [[ "${DEBUG}" == "3" ]] ; then set -v    ; fi   # Print shell input lines as they are read
if [[ "${DEBUG}" == "4" ]] ; then set -e    ; fi   # Exit immediately if non-zero exit status
if [[ "${DEBUG}" == "5" ]] ; then set -e -o pipefail ; fi   # Exit immediately if non-zero exit status and exit if any command in a pipeline errors
#
BOLD=$(tput -Txterm bold)
NORMAL=$(tput -Txterm sgr0)
RED=$(tput    setaf 1)
GREEN=$(tput  setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput   setaf 6)
WHITE=$(tput  setaf 7)

###  Production standard 7.0 Default variable value
DEFAULT_ALL_TEST_CASES="NO"
DEFAULT_ADD_TEST_CASE="NO"

###  Production standard 8.3.541 --usage
COMMAND_NAME=$(echo "${0}" | sed 's/^.*\///')                                               # 3.541
display_usage() {
echo -e "\n${NORMAL}${COMMAND_NAME}\n   lists and manages files in TEST case directories"
echo -e "\n${BOLD}USAGE${NORMAL}"
echo    "   ${COMMAND_NAME} [-a | --all | -c | --clean | -n | --none | -f <FILE_NAME> | --filename <FILE_NAME>] [--hooks]"
echo -e "                     [--filename <FILE_NAME> --add]\n"
echo    "   ${COMMAND_NAME} [--help | -help | help | -h | h | -?]"
echo    "   ${COMMAND_NAME} [--usage | -usage | -u]"
echo    "   ${COMMAND_NAME} [--version | -version | -v]"
}

###  Production standard 0.3.550 --help                                                     # 3.550
display_help() {
display_usage
#    Displaying help DESCRIPTION in English en_US.UTF-8, en.UTF-8, C.UTF-8                  # 3.550
echo -e "\n${BOLD}DESCRIPTION${NORMAL}"
echo    "${COMMAND_NAME} is a bash script that lists and manages files in TEST"
echo    "case directories in the current Git repository.  It supports adding (-a) and"
echo    "removing (-c) symbolic links to default test cases found in the EXAMPLES"
echo    "directory.  It supports locating (-n) which files in a Git repository do not"
echo    "have test cases.  It supports listing (--filename) the test cases for a file in"
echo    "a Git repository.  It supports adding (--add) default SA test cases for a file."

###  Production standard 4.3.550 Documentation Language                                     # 3.550
#    Displaying help DESCRIPTION in French fr_CA.UTF-8, fr_FR.UTF-8, fr_CH.UTF-8
if [[ "${LANG}" == "fr_CA.UTF-8" ]] || [[ "${LANG}" == "fr_FR.UTF-8" ]] || [[ "${LANG}" == "fr_CH.UTF-8" ]] ; then
  echo -e "\n--> ${LANG}"
  echo    "<votre aide va ici>" # your help goes here
  echo    "Souhaitez-vous traduire la section description?" # Do you want to translate the description section?
elif ! [[ "${LANG}" == "en_US.UTF-8" ||  "${LANG}" == "en.UTF-8" || "${LANG}" == "C.UTF-8" ]] ; then  # 3.550
  new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "  Your language, ${LANG}, is not supported.  Would you like to translate the description section?" 1>&2
fi

echo -e "\n${BOLD}ENVIRONMENT VARIABLES${NORMAL}"
echo    "If using the bash shell, enter; 'export DEBUG=1' on the command line to set"
echo    "the environment variable DEBUG to '1' (0 = debug off, 1 = debug on).  Use the"
echo    "command, 'unset DEBUG' to remove the exported information from the environment"
echo    "variable DEBUG.  You are on your own defining environment variables if"
echo    "you are using other shells."

###  Production standard 1.3.550 DEBUG variable                                             # 3.550
echo    "   DEBUG           (default off '0')  The DEBUG environment variable can be set"   # 3.550
echo    "                   to 0, 1, 2, 3, 4 or 5.  The setting '' or 0 will turn off"      # 3.550
echo    "                   all DEBUG messages during execution of this script.  The"       # 3.550
echo    "                   setting 1 will print all DEBUG messages during execution."      # 3.550
echo    "                   Setting 2 (set -x) will print a trace of simple commands"       # 3.550
echo    "                   before they are executed.  Setting 3 (set -v) will print"       # 3.550
echo    "                   shell input lines as they are read.  Setting 4 (set -e) will"   # 3.550
echo    "                   exit immediately if non-zero exit status is recieved with"      # 3.550
echo    "                   some exceptions.  Setting 5 (set -e -o pipefail) will do"       # 3.550
echo    "                   setting 4 and exit if any command in a pipeline errors.  For"   # 3.550
echo    "                   more information about the set options, see man bash."          # 3.550

echo    "   ALL_TEST_CASES  Include hooks/ directory (default ${DEFAULT_ALL_TEST_CASES})"

echo -e "\n${BOLD}OPTIONS${NORMAL}"
echo -e "Order of precedence: CLI options, environment variable, default code.\n"
echo    "   -a, --all"
echo -e "\tPrint all test case files after running FVT-setup.sh and SA-setup.sh"
echo -e "\texcluding hooks/ directory unless --hooks option is used.\n"
echo    "   -c, --clean"
echo -e "\tRun FVT-cleanup.sh & SA-cleanup.sh to remove linked TEST cases and"
echo -e "\ttest files and directories excluding hooks/ directory unless --hooks"
echo -e "\toption is used.\n"
echo    "   -f <FILE_NAME>, --filename <FILE_NAME>"
echo -e "\tPrint all test case files for <FILE_NAME> after running FVT-setup.sh"
echo -e "\tand SA-setup.sh excluding hooks/ directory unless --hooks option is used.\n"
echo    "        --add" #  #29  --add option add default test cases
echo -e "\t     Create default test case directory (TEST/<FILE_NAME>/) for <FILE_NAME>"
echo -e "\t     and install scripts SA-setup.sh, SA-cleanup.sh, and"
echo -e "\t     SA-shellcheck-001.expected.\n"
echo    "   --hooks, -hooks"
echo -e "\tInclude files and test cases in hooks/ directory.  This option can"
echo -e "\tbe used with one of these options -a, -c, -n, or -f.  It can be set"
echo -e "\tby using the environment variable, ALL_TEST_CASES.\n"
echo    "   -n, --none"
echo -e "\tPrint all files that do NOT have TEST cases except hooks/ directory"
echo -e "\tunless --hooks option is used.\n"

###  Production standard 6.3.547  Architecture tree
echo -e "\n${BOLD}ARCHITECTURE TREE${NORMAL}"  # STORAGE & CERTIFICATION
echo    "<GIT_RESPOITORY>/                      <-- <GIT_RESPOITORY>"
echo    "├── <FILE_NAME-1>                      <-- FILE_NAME-1 to test"
echo    "└── TEST/                              <-- TEST case directory"
echo    "    ├── <FILE_NAME-1>/                 <-- Test case directory for FILE_NAME-1"
echo    "    │   ├── SA-setup.sh                <-- Test case SA-setup.sh script"
echo    "    │   ├── SA-cleanup.sh              <-- Test case SA-cleanup.sh script"
echo    "    │   ├── SA-shellcheck-001          <-- Test case SA-shellcheck-001"
echo    "    │   ├── SA-shellcheck-001.expected <-- Expected output file from"
echo    "    │   │                                  test case SA-shellcheck-001 when"
echo    "    │   │                                  testing <FILE_NAME-1>"
echo    "    │   ├── SA-permission-775-001      <-- Test case SA-permission-775-001"
echo    "    │   └── <TEST_CASE>/               <-- Other test cases for <FILE_NAME-1>"
echo    "    └── <FILE_NAME-2>/                 <-- Test case directory for FILE_NAME-2"

echo -e "\n${BOLD}DOCUMENTATION${NORMAL}"
echo    "   https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md"

echo -e "\n${BOLD}EXAMPLES${NORMAL}"
echo -e "   List files in TEST case directories including hooks/ directory\n\t${BOLD}${COMMAND_NAME} --hooks${NORMAL}\n" # 3.550
echo -e "   Setup default SA- test cases for file sample.sh without test cases\n\t${BOLD}${COMMAND_NAME} --filename sample.sh --add${NORMAL}\n"        # 3.550
echo -e "   Check test case depth for file sample.sh (option -f)\n\t${BOLD}${COMMAND_NAME} -f sample.sh${NORMAL}\n"        # 3.550

echo -e "\n${BOLD}SEE ALSO${NORMAL}"                                                        # 3.550
echo    "   setup-git-TEST-cases.sh (https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#description)"  # 3.550
echo    "   uninstall-git-TEST-cases.sh (https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#description)"  # 3.550

echo -e "\n${BOLD}AUTHOR${NORMAL}"                                                          # 3.550
echo    "   ${COMMAND_NAME} was written by Bradley Allen <allen.bradley@ymail.com>"         # 3.550

echo -e "\n${BOLD}REPORTING BUGS${NORMAL}"                                                  # 3.550
echo    "   Report ${COMMAND_NAME} bugs https://github.com/BradleyA/git-TEST-commit-automation/issues/new/choose"  # 3.550

###  Production standard 5.3.559 Copyright                                            # 3.559
echo -e "\n${BOLD}COPYRIGHT${NORMAL}"                                                       # 3.550
echo    "   Copyright (c) 2020 Bradley Allen"                                               # 3.550
echo    "   MIT License is online in the repository as a file named LICENSE"          # 3.559
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
#    Assumptions for the next two lines of code:  The second line in this script includes the script path & name as the second item and
#    the script version as the third item separated with space(s).  The tool I use is called 'markit'. See example line below:
#       template/template.sh  3.517.783  2019-09-13T18:20:42.144356-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.516  
SCRIPT_NAME=$(head -2 "${0}" | awk '{printf $2}')  #  Different from ${COMMAND_NAME}=$(echo "${0}" | sed 's/^.*\///'), SCRIPT_NAME = includes Git repository directory and can be used any where in script (for dev, test teams)
SCRIPT_VERSION=$(head -2 "${0}" | awk '{printf $3}')
if [[ "${SCRIPT_NAME}" == "" ]] ; then SCRIPT_NAME="${0}" ; fi
if [[ "${SCRIPT_VERSION}" == "" ]] ; then SCRIPT_VERSION="v?.?" ; fi

#    GID
GROUP_ID=$(id -g)

###  Production standard 2.3.529 log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)
new_message() {  #  $1="${LINENO}"  $2="DEBUG INFO ERROR WARN"  $3="message"
  get_date_stamp
  echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${SCRIPT_NAME}[$$] ${SCRIPT_VERSION} ${1} ${USER} ${UID}:${GROUP_ID} ${BOLD}[${2}]${NORMAL}  ${3}"
}

#    INFO
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "  Started..." 1>&2 ; fi

#    Added following code because USER is not defined in crobtab jobs
if ! [[ "${USER}" == "${LOGNAME}" ]] ; then  USER=${LOGNAME} ; fi
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Setting USER to support crobtab...  USER >${USER}<  LOGNAME >${LOGNAME}<" 1>&2 ; fi

#    DEBUG
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Name_of_command >${SCRIPT_NAME}< Name_of_arg1 >${1}< Name_of_arg2 >${2}< Name_of_arg3 >${3}<  Version of bash ${BASH_VERSION}" 1>&2 ; fi

###  Production standard 7.0 Default variable value
#    Order of precedence: CLI argument, environment variable, default code
if [[ "${ALL_TEST_CASES}" == "" ]] ; then ALL_TEST_CASES=${DEFAULT_ALL_TEST_CASES} ; fi

###  Production standard 9.3.562 Parse CLI options and arguments
while [[ "${#}" -gt 0 ]] ; do
  case "${1}" in
    --help|-help|help|-h|h|-\?)  display_help | more ; exit 0 ;;
    --usage|-usage|usage|-u)  display_usage ; exit 0  ;;
    --version|-version|version|-v)  echo "${SCRIPT_NAME} ${SCRIPT_VERSION}" ; exit 0  ;;
    -a|--all)   if [[ "${CLI_OPTION}" != "" ]] ; then
        echo -e "\n${BOLD}    Only one of these option -a, --all, -c, --clean, -f, --filename, -n, or --none can be selected.${NORMAL}\n" ; exit 1
      else
        CLI_OPTION="a" ; shift
      fi ;;
    --add) DEFAULT_ADD_TEST_CASE="YES" ; shift ;;  #  #29
    -c|--clean) if [[ "${CLI_OPTION}" != "" ]] ; then
        echo -e "\n${BOLD}    Only one of these option -a, --all, -c, --clean, -f, --filename, -n, or --none can be selected.${NORMAL}\n" ; exit 1
      else
        CLI_OPTION="c" ; shift 
      fi ;;
    -f|--filename) if [[ "${CLI_OPTION}" != "" ]] ; then
        echo -e "\n${BOLD}    Only one of these option -a, --all, -c, --clean, -f, --filename, -n, or --none can be selected.${NORMAL}\n" ; exit 1
      else
        CLI_OPTION="f"
        #    Check if FILE_NAME is missing
        if [[ "${2}" == "" ]]    ; then echo -e "\n${BOLD}    Argument for ${1} is not found on command line\n" ; exit 1 ; fi
        #    Check if option (-) is next not FILE_NAME
        if [[ ${2:0:1} == "-" ]] ; then echo -e "\n${BOLD}    Argument for ${1} is not found on command line\n" ; exit 1 ; fi
        FILE_NAME=${2} ; shift 2
      fi ;;
    --hooks|-hooks) ALL_TEST_CASES="YES" ; shift ;;
    -n|--none) if [[ "${CLI_OPTION}" != "" ]] ; then  #  #18
        echo -e "\n${BOLD}    Only one of these option -a, --all, -c, --clean, -f, --filename, -n, or --none can be selected.${NORMAL}\n" ; exit 1
      else
        CLI_OPTION="n" ; shift 
      fi ;;
    *)  echo -e "\n${BOLD}    Option, ${YELLOW}${1}${WHITE}, is not supported.  Try  ${YELLOW}${COMMAND_NAME} --usage${NORMAL}\n" ; exit 1 ; ;;
  esac
done
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Variable... CLI_OPTION >${CLI_OPTION}< FILE_NAME >${FILE_NAME}< ALL_TEST_CASES >${ALL_TEST_CASES}<" 1>&2 ; fi

###  Production standard 10.0 TESTing

if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  ${BOLD}${YELLOW}REPOSITORY_DIR  >${REPOSITORY_DIR}<${NORMAL}" 1>&2 ; fi
cd "${REPOSITORY_DIR}"
if [[ "${CLI_OPTION}" == "f" ]]  ; then
  if [[ "${FILE_NAME}" =~ / ]] ; then new_message "${LINENO}" "${RED}ERROR${WHITE}" "  Filename ${FILE_NAME}, contains '/'" 1>&2 ; exit 1 ; fi

  if [[ "${DEFAULT_ADD_TEST_CASE}" == "YES" ]] ; then  #  #29  --add default SA files
    TMP1=$(find . -type f -name "${FILE_NAME}")
    if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Directory with FILE_NAME >${TMP1}< FILE_NAME >${FILE_NAME}<" 1>&2 ; fi
    if [[ "${TMP1}" == "" ]] ; then echo -e "${BOLD}${YELLOW}\n    INFO:  ${WHITE}Filename ${YELLOW}${FILE_NAME}${WHITE}, NOT found.  Check spelling of filename\n    or try  ${YELLOW}${COMMAND_NAME} --help${NORMAL}" 1>&2 ; exit 1 ; fi
    DIR_COUNT=$(awk -F'/' '{print NF-2}' <<< $TMP1)
    cd "$(dirname "${TMP1}")"  #  change to directory with ${FILE_NAME}
    mkdir -p TEST/"${FILE_NAME}"/
    EXAMPLE_DIR="../../hooks/EXAMPLES"
    if [[ ${DIR_COUNT} != 0 ]] ; then
      while [[ ${DIR_COUNT} != 0 ]] ; do DIR_COUNT=$((DIR_COUNT - 1)) ; EXAMPLE_DIR="../${EXAMPLE_DIR}" ; done
    fi
    if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  EXAMPLE_DIR >${EXAMPLE_DIR}<" 1>&2 ; fi
    ln -sf "${EXAMPLE_DIR}/SA-setup.sh"   "TEST/${FILE_NAME}/SA-setup.sh"
    ln -sf "${EXAMPLE_DIR}/SA-cleanup.sh" "TEST/${FILE_NAME}/SA-cleanup.sh"
    touch "TEST/${FILE_NAME}/SA-shellcheck-001.expected"
    git add "TEST/${FILE_NAME}/SA-shellcheck-001.expected" "TEST/${FILE_NAME}/SA-setup.sh" "TEST/${FILE_NAME}/SA-cleanup.sh"
    git commit -m 'initial commit' "TEST/${FILE_NAME}/SA-shellcheck-001.expected" "TEST/${FILE_NAME}/SA-setup.sh" "TEST/${FILE_NAME}/SA-cleanup.sh"
  fi  #  #29
  cd "$(find . -type d -name "${FILE_NAME}")"
  if [[ -x "FVT-setup.sh" ]]  ; then ./FVT-setup.sh ; fi
  if [[ -x "SA-setup.sh"  ]]  ; then ./SA-setup.sh  ; fi
  cd "${REPOSITORY_DIR}"
  if [[ "${ALL_TEST_CASES}" == "YES" ]] ; then
    echo -e "${BOLD}${YELLOW}\n    INFO:  ${WHITE}If filename is not found.  Check spelling of filename\n    or try  ${YELLOW}${COMMAND_NAME} --help${NORMAL}\n" 1>&2
    find . -print | grep --color=auto "${FILE_NAME}"
  else
    echo -e "${BOLD}${YELLOW}\n    INFO:  ${WHITE}If filename is not found.  Check spelling of filename\n    or try  ${YELLOW}${COMMAND_NAME} --filename <FILE_NAME> --hooks\n    ${WHITE}or try  ${YELLOW}${COMMAND_NAME} --help${NORMAL}\n" 1>&2
    find . -print | grep -v 'hooks/' | grep --color=auto "${FILE_NAME}"
  fi
  cd "$(find . -type d -name "${FILE_NAME}")"
  if [[ -x "FVT-cleanup.sh" ]]  ; then ./FVT-cleanup.sh ; fi
  if [[ -x "SA-cleanup.sh"  ]]  ; then ./SA-cleanup.sh  ; fi
else
  if [[ "${CLI_OPTION}" == "n" ]] ; then  #  #18
    TMP_GITALLFILES=$(mktemp /tmp/GITALLFILESXXXXXX)                       #  create temporary file for all files in repository
    TMP_GITALLFILES_NO_TESTDIR=$(mktemp /tmp/GITALLFILES_NOTESTDIRXXXXXX)  #  create temporary file for all files in repository that have a /TEST/<filename>/ directory
    TMP_GITALL_TEST_CASE_LIST=$(mktemp /tmp/GIT_TEST_CASE_LISTXXXXXX)      #  create temporary file for all files in repository that do have test cases
    if [[ "${ALL_TEST_CASES}" == "YES" ]] ; then
      find . -type f | grep -v './\.git/*\|./*/images/*\|./*/TEST/*\|./*.md' | sed 's!.*/!!' > "${TMP_GITALLFILES}"
      find . -type d -name TEST -exec ls -1 {} \; > "${TMP_GITALLFILES_NO_TESTDIR}"
      TMP_GITALL_TEST_CASE_LIST=$(cat "${TMP_GITALLFILES}"  "${TMP_GITALLFILES_NO_TESTDIR}" | sort | uniq -u)
    else
      find . -type f | grep -v './\.git/*\|./*/images/*\|./*/TEST/*\|./*.md\|hooks/' | sed 's!.*/!!' > "${TMP_GITALLFILES}"
      find . -path ./hooks -prune -o -type d -name TEST -exec ls -1 {} \; > "${TMP_GITALLFILES_NO_TESTDIR}"
      TMP_GITALL_TEST_CASE_LIST=$(cat "${TMP_GITALLFILES}"  "${TMP_GITALLFILES_NO_TESTDIR}" | sort | uniq -u)
    fi
    for l in ${TMP_GITALL_TEST_CASE_LIST} ; do
      find . -name "${l}"
    done
    rm /tmp/GITALL*
  else
    DIR_LIST=$(find . -type d -name TEST)  #  create list of TEST directories
    if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  \${DIR_LIST} >${DIR_LIST=}<" 1>&2 ; fi
    for i in $DIR_LIST ; do
      if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  TEST directory >${i}<" 1>&2 ; fi
      if [[ ! $(ls -1A "${i}") ]] ; then continue ; fi  #  Skip no test case in directoy 
      TEST_CASE_DIR_LIST=$(ls -1d "${i}"/* | cut -c 3-)
      for j in ${TEST_CASE_DIR_LIST} ; do 
        if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Directory >${j}<" 1>&2 ; fi
        if [[ $j == *"hooks"* ]] && [[ "${ALL_TEST_CASES}" == "NO" ]] ; then continue ; fi  #  Skip to the next j in for loop
        TEST_CASE_DIR_END=$(echo "${j}" | rev | cut -d '/' -f 1 | rev)
        TEST_CASE_DIR_START="${j//${TEST_CASE_DIR_END}/}"
        printf "${TEST_CASE_DIR_START}${BOLD}${YELLOW}${TEST_CASE_DIR_END}${NORMAL}\n"
        if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Run FVT-setup.sh and SA-setup.sh if -a or --all" 1>&2 ; fi
        if [[ "${CLI_OPTION}" == "a" ]] && [[ -x "FVT-setup.sh" ]]  ; then ./FVT-setup.sh  "${REPOSITORY_DIR}" ; fi
        if [[ "${CLI_OPTION}" == "a" ]] && [[ -x "SA-setup.sh"  ]]  ; then ./SA-setup.sh   "${REPOSITORY_DIR}" ; fi
        if [[ "${CLI_OPTION}" == "c" ]]  ; then
          if [[ -x "FVT-cleanup.sh" ]]  ; then ./FVT-cleanup.sh ; fi
          if [[ -x "SA-cleanup.sh"  ]]  ; then ./SA-cleanup.sh  ; fi
        fi
        cd "${REPOSITORY_DIR}"
        printf "${BOLD}${GREEN} $(ls -1  "${j}" | grep -v "\." | sed 's/^/\t/')${NORMAL}\n"
        printf "${BOLD}${CYAN} $(ls -1  "${j}" | grep "cleanup.sh" | sed 's/^/\t/')${NORMAL}\n"
        printf "${BOLD}${CYAN} $(ls -1  "${j}" | grep "setup.sh" | sed 's/^/\t/')${NORMAL}\n"
      done
    done
  fi
fi

if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "INFO" "  Operation finished..." 1>&2 ; fi
###
