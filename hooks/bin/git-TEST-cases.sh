#!/bin/bash
# 	hooks/bin/git-TEST-cases.sh  3.1.266.2024  2020-12-04T16:32:22.424800-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.265  
# 	   hooks/bin/git-TEST-cases.sh -->   testing  
# 	hooks/bin/git-TEST-cases.sh  3.1.262.2018  2020-12-04T16:11:34.317893-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.261-2-g768e620 
# 	   hooks/bin/git-TEST-cases.sh -->   Production standard 1.3.614 DEBUG variable  Production standard 2.3.614 Log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)  
# 	hooks/bin/git-TEST-cases.sh  3.1.261.2015  2020-12-04T15:38:57.475022-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.260-1-g9a58e43  
# 	   hooks/bin/git-TEST-cases.sh -->   ipdate SEE ALSO section  
# 	hooks/bin/git-TEST-cases.sh  3.1.132.1847  2020-11-18T22:44:28.728514-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.131  
# 	   hooks/bin/git-TEST-cases.sh -->   add support for -f=*|--filename=*)  
# 	hooks/bin/git-TEST-cases.sh  3.1.130.1843  2020-11-18T15:47:45.471017-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.129  
# 	   hooks/bin/git-TEST-cases.sh -->   Production standard 9.3.607 Parse CLI options and arguments  
# 	hooks/bin/git-TEST-cases.sh  3.1.126.1834  2020-11-18T13:46:54.581167-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.125 
# 	   hooks/bin/git-TEST-cases.sh hooks/bin/git-setup-TEST-cases.sh hooks/bin/uninstall-git-TEST-cases.sh -->   rename git-TEST-setup-cases.sh -> git-setup-TEST-cases.sh  
# 	hooks/bin/git-TEST-cases.sh  3.1.2.1494  2020-02-03T23:24:09.832614-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.1-1-g16879e3  
# 	   hooks/bin/git-TEST-cases.sh   close #36   Beta-3 
#86# hooks/bin/git-TEST-cases.sh  -  lists and manages files in TEST case directories
#       git-TEST-cases.sh --all   -  runs FVT-setup.sh and SA-setup.sh to create symbolic links to EXAMPLES before listing all test cases
#       git-TEST-cases.sh --clean -  remove symbolic links from TEST/<command>/ directories
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
NORMAL=$(tput -Txterm sgr0)
RED=$(tput    setaf 1)
GREEN=$(tput  setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput   setaf 6)
WHITE=$(tput  setaf 7)

###  Production standard 7.0 Default variable value
DEFAULT_ALL_TEST_CASES="NO"
DEFAULT_ADD_TEST_CASE="NO"
CLI_OPTION=""

###  Production standard 8.3.541 --usage
COMMAND_NAME=$(echo "${0}" | sed 's/^.*\///')                                               # 3.541
display_usage() {
echo -e "\n${NORMAL}${COMMAND_NAME}\n   lists and manages files in TEST case directories"
echo -e "\n${BOLD}USAGE${NORMAL}"
echo    "   ${COMMAND_NAME} [-a | --all | -c | --clean | -n | --none | -f <PATH>/<FILE_NAME> | --filename <PATH>/<FILE_NAME>] [--hooks]"
echo -e "                     [--filename <PATH>/<FILE_NAME> --add]\n"
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
echo -e "Order of precedence: CLI options, environment variable, default value.\n"     # 3.572
echo    "   --help, -help, help, -h, h, -?"                                            # 3.572
echo -e "\tOn-line brief reference manual\n"                                           # 3.572
echo    "   --usage, -usage, -u"                                                       # 3.572
echo -e "\tOn-line command usage\n"                                                    # 3.572
echo    "   --version, -version, -v"                                                      # 0.3.579
echo -e "\tOn-line command version\n"                                                  # 3.572
#
echo    "   -a, --all"
echo -e "\tPrint all test case files after running FVT-setup.sh and SA-setup.sh"
echo -e "\texcluding hooks/ directory unless --hooks option is used.\n"
echo    "   -c, --clean"
echo -e "\tRun FVT-cleanup.sh & SA-cleanup.sh to remove linked TEST cases and"
echo -e "\ttest files and directories excluding hooks/ directory unless --hooks"
echo -e "\toption is used.\n"
echo    "   -f <PATH>/<FILE_NAME>, --filename <PATH>/<FILE_NAME>"
echo -e "\tPrint all test case files for <PATH>/<FILE_NAME> after running FVT-setup.sh"
echo -e "\tand SA-setup.sh excluding hooks directory unless --hooks option is used.\n"
echo    "        --add" #  #29  --add option add default test cases
echo -e "\t     Create default test case directory (TEST/<FILE_NAME>/) for"
echo -e "\t     <FILE_NAME> and install scripts SA-setup.sh, SA-cleanup.sh, and"
echo -e "\t     SA-shellcheck-001.expected.\n"
echo    "   --hooks, -hooks"
echo -e "\tInclude files and test cases in hooks/ directory.  This option can"
echo -e "\tbe used with one of these options -a, -c, -n, or -f.  It can be set"
echo -e "\tby using the environment variable, ALL_TEST_CASES.\n"
echo    "   -n, --none"
echo -e "\tPrint all files that do NOT have TEST cases except hooks/ directory"
echo -e "\tunless --hooks option is used."

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
echo    "   ${BOLD}git-set-env-for-manual-test.sh${NORMAL}  (https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#description)"  # 3.550
echo    "   ${BOLD}git-setup-TEST-cases.sh${NORMAL}  (https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#description)"  # 3.550
echo    "   ${BOLD}git-uninstall-TEST-cases.sh${NORMAL}  (https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#description)"  # 3.550
echo    "   ${BOLD}markit${NORMAL}  (https://github.com/BradleyA/markit/blob/master/README.md#markit------)"  # 3.550

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

###  Production standard 2.3.614 Log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)
new_message() {  #  $1="${LINENO}"  $2="DEBUG INFO ERROR WARN"  $3="message"
  get_date_stamp
  echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${BOLD}${CYAN}${SCRIPT_NAME}${NORMAL}[$$] ${BOLD}${BLUE}${SCRIPT_VERSION} ${PURPLE}${1}${NORMAL} ${USER} ${UID}:${GROUP_ID} ${BOLD}[${2}]${NORMAL}  ${3}"  # 2.3.614
}

#    INFO
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "${BOLD}${CYAN}  Started...${NORMAL}" 1>&2 ; fi  # 1.3.614

#    Added following code because USER is not defined in crobtab jobs
if ! [[ "${USER}" == "${LOGNAME}" ]] ; then  USER=${LOGNAME} ; fi
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  Setting USER to support crobtab...  USER >${BOLD}${CYAN}${USER}${NORMAL}<  LOGNAME >${BOLD}${CYAN}${LOGNAME}${NORMAL}<" 1>&2 ; fi  # 1.3.614

#    DEBUG
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  Name_of_command >${BOLD}${CYAN}${SCRIPT_NAME}${NORMAL}< Name_of_arg1 >${BOLD}${CYAN}${1}${NORMAL}< Name_of_arg2 >${BOLD}${CYAN}${2}${NORMAL}< Name_of_arg3 >${BOLD}${CYAN}${3}${NORMAL}<  Version of bash >${BOLD}${CYAN}${BASH_VERSION}${NORMAL}<" 1>&2 ; fi  # 1.3.614

###  Production standard 7.0 Default variable value
#    Order of precedence: CLI argument, environment variable, default code
if [[ "${ALL_TEST_CASES}" == "" ]] ; then ALL_TEST_CASES=${DEFAULT_ALL_TEST_CASES} ; fi

###  Production standard 9.3.607 Parse CLI options and arguments
while [[ "${#}" -gt 0 ]] ; do
  case "${1}" in
    --help|-help|help|-h|h|-\?)  display_help | more ; exit 0 ;;
    --usage|-usage|usage|-u)  display_usage ; exit 0  ;;
    --version|-version|version|-v)  echo "${SCRIPT_NAME} ${SCRIPT_VERSION}" ; exit 0  ;;
#
    -a|--all)  if [[ "${CLI_OPTION}" != "" ]] ; then echo -e "\n${BOLD}    Only one of these option -a, --all, -c, --clean, -f, --filename, -n, or --none can be selected.${NORMAL}\n" ; exit 1 # 9.3.596
      else CLI_OPTION="a" ; shift ; fi ;;  # 9.3.596
    --add)  DEFAULT_ADD_TEST_CASE="YES" ; shift ;;  #  #29
    -c|--clean)  if [[ "${CLI_OPTION}" != "" ]] ; then echo -e "\n${BOLD}    Only one of these option -a, --all, -c, --clean, -f, --filename, -n, or --none can be selected.${NORMAL}\n" ; exit 1 # 9.3.596
      else CLI_OPTION="c" ; shift ; fi ;;  # 9.3.596
    -f|--filename)  if [[ "${CLI_OPTION}" != "" ]] ; then echo -e "\n${BOLD}    Only one of these option -a, --all, -c, --clean, -f, --filename, -n, or --none can be selected.${NORMAL}\n" ; exit 1 # 9.3.596
      else CLI_OPTION="f"
        #    Check if FILE_NAME is missing. # 9.3.558
        if [[ "${2}" == "" ]]    ; then echo -e "\n${BOLD}    Argument for ${YELLOW}${1}${WHITE} is not found on command line.${NORMAL}\n" ; exit 1 ; fi # 9.3.558  9.3.561  9.3.562  9.3.607
        #    Check if option (-) is next not FILE_NAME # 9.3.558
        if [[ ${2:0:1} == "-" ]] ; then echo -e "\n${BOLD}    Argument for ${YELLOW}${1}${WHITE} is not found on command line.${NORMAL}\n" ; exit 1 ; fi # 9.3.558  9.3.561  9.3.562  9.3.607
        FILE_NAME=${2} ; shift 2 ; fi ;;  # 9.3.596
    -f=*|--filename=*)  if [[ "${CLI_OPTION}" != "" ]] ; then echo -e "\n${BOLD}    Only one of these option -a, --all, -c, --clean, -f, --filename, -n, or --none can be selected.${NORMAL}\n" ; exit 1  # 9.3.608
      else CLI_OPTION="f"  # 9.3.608
        FILE_NAME="${1#*=}"  # 9.3.608
        #    Check if FILE_NAME is missing.  # 9.3.608
        if [[ "${FILE_NAME}" == "" ]]    ; then echo -e "\n${BOLD}    Argument for ${YELLOW}${1}${WHITE} is not found on command line.${NORMAL}\n" ; exit 1 ; fi  # 9.3.608
        #    Check if option (-) is next not FILE_NAME  # 9.3.608
        if [[ ${FILE_NAME:0:1} == "-" ]] ; then echo -e "\n${BOLD}    Argument for ${YELLOW}${1}${WHITE} is not found on command line.${NORMAL}\n" ; exit 1 ; fi  # 9.3.608
        shift ; fi ;;  # 9.3.608
    --hooks|-hooks)  ALL_TEST_CASES="YES" ; shift ;;
    -n|--none)  if [[ "${CLI_OPTION}" != "" ]] ; then echo -e "\n${BOLD}    Only one of these option -a, --all, -c, --clean, -f, --filename, -n, or --none can be selected.${NORMAL}\n" ; exit 1 # 18  # 9.3.596
      else CLI_OPTION="n" ; shift ; fi ;; # 9.3.596
    *)  echo -e "\n${BOLD}    Invalid option, ${YELLOW}${1}${WHITE}, try ${YELLOW}--usage${NORMAL}\n" ; exit 1 ; ;; # 9.3.607
  esac
done

if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  Variable... CLI_OPTION >${BOLD}${CYAN}${CLI_OPTION}${NORMAL}< FILE_NAME >${BOLD}${CYAN}${FILE_NAME}${NORMAL}< ALL_TEST_CASES >${BOLD}${CYAN}${ALL_TEST_CASES}${NORMAL}<" 1>&2 ; fi  # 1.3.614

###  Production standard 10.0 TESTing

if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  REPOSITORY_ABSOLUTE_PATH >${BOLD}${CYAN}${REPOSITORY_ABSOLUTE_PATH}${NORMAL}<" 1>&2 ; fi  # 1.3.614

if [[ "${REPOSITORY_ABSOLUTE_PATH}" == "" ]] ; then
  REPOSITORY_ABSOLUTE_PATH=$(git rev-parse --show-toplevel) || { new_message "${LINENO}" "${RED}ERROR${WHITE}" "  Not a git repository (or any of the parent directories)" 1>&2 ; exit 1 ; } 
fi
cd "${REPOSITORY_ABSOLUTE_PATH}"

TMP_FILE_NAME=$(echo "${FILE_NAME}" | sed 's/^.*\///')  # parse file name if directory included

if [[ "${CLI_OPTION}" == "f" ]]  ; then
#    Check if file exists and has a size greater than zero || if file exists and is readable
  if [[ ! -s "${FILE_NAME}" ]] || [[ ! -r "${FILE_NAME}" ]] ; then
    new_message "${LINENO}" "${RED}ERROR${WHITE}" "  ${FILE_NAME} file is not found or is empty or is not readable" 1>&2
    exit 1
  fi
  if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  File name with directory path: >${BOLD}${CYAN}${FILE_NAME}${NORMAL}<  DEFAULT_ADD_TEST_CASE >${BOLD}${CYAN}${DEFAULT_ADD_TEST_CASE}${NORMAL}<" 1>&2 ; fi  # 1.3.614
  if [[ "${DEFAULT_ADD_TEST_CASE}" == "YES" ]] ; then  #  #29  --add default SA files
    if [[ "${FILE_NAME}" != $(basename "${FILE_NAME}") ]] ; then  #  Is there a sub-directory included
      cd "$(dirname "${FILE_NAME}")"
      DIR_COUNT=$(echo "${FILE_NAME}" | grep -o '/' | wc -l)  # count number of '/'
    else 
      DIR_COUNT=0  # NO sub-directory included
    fi
    if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  DIR_COUNT  >${BOLD}${CYAN}${DIR_COUNT}${NORMAL}< FILE_NAME  >${BOLD}${CYAN}${FILE_NAME}${NORMAL}<  pwd  >${BOLD}${CYAN}$(pwd)${NORMAL}<" 1>&2 ; fi  # 1.3.614
    mkdir -p TEST/"${TMP_FILE_NAME}"/
    EXAMPLES_DIRECTORY="../../hooks/EXAMPLES"
    if [[ ${DIR_COUNT} != 0 ]] ; then
      while [[ ${DIR_COUNT} != 0 ]] ; do  DIR_COUNT=$((DIR_COUNT - 1)) ; EXAMPLES_DIRECTORY="../${EXAMPLES_DIRECTORY}" ; done
    fi
    if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  EXAMPLES_DIRECTORY >${BOLD}${CYAN}${EXAMPLES_DIRECTORY}${NORMAL}<" 1>&2 ; fi  # 1.3.614
    ln -sf "${EXAMPLES_DIRECTORY}/SA-setup.sh"   "TEST/${TMP_FILE_NAME}/SA-setup.sh"
    ln -sf "${EXAMPLES_DIRECTORY}/SA-cleanup.sh" "TEST/${TMP_FILE_NAME}/SA-cleanup.sh"
    touch "TEST/${TMP_FILE_NAME}/SA-shellcheck-001.expected"
    git add "TEST/${TMP_FILE_NAME}/SA-shellcheck-001.expected" "TEST/${TMP_FILE_NAME}/SA-setup.sh" "TEST/${TMP_FILE_NAME}/SA-cleanup.sh"
    git commit -m 'initial commit' "TEST/${TMP_FILE_NAME}/SA-shellcheck-001.expected" "TEST/${TMP_FILE_NAME}/SA-setup.sh" "TEST/${TMP_FILE_NAME}/SA-cleanup.sh"
    cd "${REPOSITORY_ABSOLUTE_PATH}"
  fi  #  #29
  if [[ "${FILE_NAME}" != $(basename "${FILE_NAME}") ]] ; then  #  Is there a directory included
    cd "$(dirname "${FILE_NAME}")"
  fi
  cd TEST/"${TMP_FILE_NAME}"
  if [[ -x "FVT-setup.sh" ]]  ; then ./FVT-setup.sh ; fi
  if [[ -x "SA-setup.sh"  ]]  ; then ./SA-setup.sh  ; fi
# >>> >>>  cd "${REPOSITORY_ABSOLUTE_PATH}"
# >>>  if [[ "${ALL_TEST_CASES}" == "YES" ]] ; then
# >>>    echo -e "${BOLD}${YELLOW}\n    INFO:  ${WHITE}If filename is not found.  Check spelling of filename\n    or try  ${YELLOW}${COMMAND_NAME} --help${NORMAL}\n" 1>&2
# >>>    find . -print | grep --color=auto "${FILE_NAME}"
# >>>  else
# >>>    echo -e "${BOLD}${YELLOW}\n    INFO:  ${WHITE}If filename is not found.  Check spelling of filename\n    or try  ${YELLOW}${COMMAND_NAME} --filename <PATH>/<FILE_NAME> --hooks\n    ${WHITE}or try  ${YELLOW}${COMMAND_NAME} --help${NORMAL}\n" 1>&2
# >>>    find . -print | grep -v 'hooks/' | grep --color=auto "${FILE_NAME}"
# >>>  fi
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
    if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  DIR_LIST >${BOLD}${CYAN}${DIR_LIST}${NORMAL}<" 1>&2 ; fi  # 1.3.614
    for i in $DIR_LIST ; do
      if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  TEST directory >${BOLD}${CYAN}${i}${NORMAL}<" 1>&2 ; fi  # 1.3.614
      if [[ ! $(ls -1A "${i}") ]] ; then continue ; fi  #  Skip no test case in directoy 
      TEST_CASE_DIR_LIST=$(ls -1d "${i}"/* | cut -c 3-)
      for j in ${TEST_CASE_DIR_LIST} ; do 
        if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  Directory >${BOLD}${CYAN}${j}${NORMAL}<" 1>&2 ; fi  # 1.3.614
        if [[ $j == *"hooks"* ]] && [[ "${ALL_TEST_CASES}" == "NO" ]] ; then continue ; fi  #  Skip to next j in for loop if 
        TEST_CASE_DIR_END=$(echo "${j}" | rev | cut -d '/' -f 1 | rev)
        TEST_CASE_DIR_START="${j//${TEST_CASE_DIR_END}/}"
        printf "${TEST_CASE_DIR_START}${BOLD}${YELLOW}${TEST_CASE_DIR_END}${NORMAL}\n"
        if [[ "${CLI_OPTION}" == "a" ]]  ; then
          if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  Run FVT-setup.sh and SA-setup.sh if -a or --all" 1>&2 ; fi  # 1.3.614
          if [[ -e "${j}/FVT-setup.sh" ]]    ; then $(cd "${j}" ; ./FVT-setup.sh   "${REPOSITORY_ABSOLUTE_PATH}") ; fi
          if [[ -e "${j}/SA-setup.sh"  ]]    ; then $(cd "${j}" ; ./SA-setup.sh    "${REPOSITORY_ABSOLUTE_PATH}") ; fi
        fi
        if [[ "${CLI_OPTION}" == "c" ]]  ; then
          if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  Run FVT-cleanup.sh and SA-cleanup.sh if -c or --clean" 1>&2 ; fi  # 1.3.614
          if [[ -e "${j}/FVT-cleanup.sh" ]]  ; then $(cd "${j}" ; ./FVT-cleanup.sh "${REPOSITORY_ABSOLUTE_PATH}") ; fi
          if [[ -e "${j}/SA-cleanup.sh"  ]]  ; then $(cd "${j}" ; ./SA-cleanup.sh  "${REPOSITORY_ABSOLUTE_PATH}") ; fi
        fi
        cd "${REPOSITORY_ABSOLUTE_PATH}"
        printf "${BOLD}${GREEN} $(ls -1  "${j}" | grep -v "\." | sed 's/^/\t/')${NORMAL}\n"
        printf "${BOLD}${CYAN} $(ls -1  "${j}" | grep "cleanup.sh" | sed 's/^/\t/')${NORMAL}\n"
        printf "${BOLD}${CYAN} $(ls -1  "${j}" | grep "setup.sh" | sed 's/^/\t/')${NORMAL}\n"
      done
    done
  fi
fi

if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "${BOLD}${CYAN}  Operation finished...${NORMAL}" 1>&2 ; fi  # 1.3.614
###
