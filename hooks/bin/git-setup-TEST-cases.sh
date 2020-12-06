#!/bin/bash
# 	hooks/bin/git-setup-TEST-cases.sh  3.1.283.2052  2020-12-06T09:36:13.686413-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.282  
# 	   hooks/bin/git-setup-TEST-cases.sh -->   Production standard 1.3.614 DEBUG variable  Production standard 2.3.614 Log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)  
# 	hooks/bin/git-setup-TEST-cases.sh  3.1.126.1834  2020-11-18T13:46:54.839190-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.125  
# 	   hooks/bin/git-TEST-cases.sh hooks/bin/git-setup-TEST-cases.sh hooks/bin/uninstall-git-TEST-cases.sh -->   rename git-TEST-setup-cases.sh -> git-setup-TEST-cases.sh  
# 	hooks/bin/git-setup-TEST-cases.sh  3.1.125.1833  2020-11-18T12:53:01.253438-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.124  
# 	   hooks/bin/git-setup-TEST-cases.sh -->   rename git-TEST-setup-cases.sh -> git-setup-TEST-cases.sh  
# 	hooks/bin/setup-git-TEST-cases.sh  3.1.94.1653  2020-09-05T08:15:28.202095-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.93  
# 	   hooks/bin/setup-git-TEST-cases.sh -->   update No --help  
# 	hooks/bin/setup-git-TEST-cases.sh  2.281.1134  2020-01-22T11:42:58.546653-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  dev  uadmin  five-rpi3b.cptx86.com 2.280  
# 	   hooks/bin/setup-git-TEST-cases.sh   Production standard 5.3.559 Copyright, Production standard 1.3.550 DEBUG variable,  Production standard 2.3.529 log format 
# 	hooks/bin/setup-git-TEST-cases.sh  2.117.621  2019-09-20T22:02:03.774879-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.116-1-g58bd437  
# 	   close #2   hooks/bin/setup-git-TEST-cases.sh  met all four objectives
#86# hooks/bin/git-setup-TEST-cases.sh  -  setup git TEST cases in current repository
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

#    No --help  # 0.3.583
if [[ "${1}" != "" ]] ; then
  new_message "${LINENO}" "${RED}ERROR${WHITE}" "  ${SCRIPT_NAME} does not support arguements." 1>&2  # 1.3.614
  echo -e "    For more information:\n${BOLD}${YELLOW}    ${UNDERLINE}https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/docs/STEPS-TO-EVALUTE.md#installevaluate-git-test-commit-automation-solution \n${NORMAL}" # 0.3.583
  exit 1
fi

if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "${BOLD}  REPOSITORY_ABSOLUTE_PATH >${BOLD}${CYAN}${REPOSITORY_ABSOLUTE_PATH}${NORMAL}<  REPOSITORY_DIR_COUNT  >${BOLD}${CYAN}${REPOSITORY_DIR_COUNT}${NORMAL}<  EXAMPLES_DIRECTORY >${BOLD}${CYAN}${EXAMPLES_DIRECTORY}${NORMAL}<" 1>&2 ; fi  # 1.3.614

###

if git -C . rev-parse 2> /dev/null ; then  #  currect directory in a git repository
  cd "$(git rev-parse --show-toplevel || echo '.')"  #  change to top git repository directory 
  REPOSITORY_NAME=$(git rev-parse --show-toplevel | rev | cut -d / -f 1 | rev)
  curl -L https://api.github.com/repos/BradleyA/git-TEST-commit-automation/tarball | tar -xzf - --wildcards BradleyA-git-TEST-commit-automation-*/hooks
  cd ./BradleyA-git-TEST-commit-automation-*
  tar -cf - ./hooks/ | (cd .. && tar -xf -)
  cd ..
  rm -rf  BradleyA-git-TEST-commit-automation-*
  cd hooks
  if [[ -x "post-commit" ]] && [[ -x "pre-commit" ]]  ; then  # do files exist and execute permission
    if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  Link pre-commit and post-commit" 1>&2 ; fi  # 1.3.614
    ln -fs ../../hooks/pre-commit  ../.git/hooks/pre-commit
    ln -fs ../../hooks/post-commit ../.git/hooks/post-commit
  else
    new_message "${LINENO}" "${RED}ERROR${WHITE}" "  ${BOLD}Unable to link ${YELLOW}${REPOSITORY_NAME}/hooks/{pre-commit,post-commit}${NORMAL}${BOLD} to ${REPOSITORY_NAME}/.git/hooks/{pre-commit,post-commit} because {pre-commit,post-commit} is NOT found in current directory ($(pwd)) or does not have execute permission.${NORMAL}" 1>&2  # 1.3.614
    exit 2
  fi
  if [[ -x "bin/git-TEST-cases.sh" ]] && [[ -x bin/git-setup-TEST-cases.sh ]]  && [[ -x bin/git-uninstall-TEST-cases.sh ]]  && [[ -x bin/git-set-env-for-manual-test.sh ]] && [[ -w /usr/local/bin ]] ; then
    if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}DEBUG${WHITE}" "  Copy git-TEST-cases.sh, git-setup-TEST-cases.sh, git-uninstall-TEST-cases.sh, & git-set-env-for-manual-test.sh to /usr/local/bin" 1>&2 ; fi  # 1.3.614
    cp -f -p bin/git-TEST-cases.sh              /usr/local/bin/git-TEST-cases.sh
    cp -f -p bin/git-setup-TEST-cases.sh        /usr/local/bin/git-setup-TEST-cases.sh
    cp -f -p bin/git-uninstall-TEST-cases.sh    /usr/local/bin/git-uninstall-TEST-cases.sh
    cp -f -p bin/git-set-env-for-manual-test.sh /usr/local/bin/git-set-env-for-manual-test.sh
  else
    new_message "${LINENO}" "${YELLOW}WARN${WHITE}" "  Copy ${REPOSITORY_NAME}/hooks/bin/{git-TEST-cases.sh,git-setup-TEST-cases.sh,git-uninstall-TEST-cases.sh,git-set-env-for-manual-test.sh} to /usr/local/bin because git-TEST-cases.sh or git-setup-TEST-cases.sh or git-uninstall-TEST-cases.sh or git-set-env-for-manual-test.sh is NOT found or does not have execute permission or /usr/local/bin is not writable." 1>&2  # 1.3.614
  fi
else
  EXIT_CODE=${?}
  new_message "${LINENO}" "${RED}ERROR${WHITE}" "  The current directory, ${BOLD}${YELLOW}$(pwd)${NORMAL}, is Not a git repository or any of the parent directories." 1>&2  # 1.3.614
  exit ${EXIT_CODE}
fi

#>>>  other than create output and change the status of all test case directories
#>>>  I do not understand the value of running the following two lines, thus comment out next two lines
#>>>  because the download should already have been cleaned before pushed to the remote git repository
#	cd "$(git rev-parse --show-toplevel || echo '.')"  #  change to top git repository directory
#	git-TEST-cases.sh --clean --hooks

#>>>  git add hooks  #  These steps would be my default most of the time
#>>>  but I would prefer to enter this manually until it is determined;
#>>>  this IS the default .. reasons are sometime I would like to just test the code
#>>>    ---- sometimes want to get latest test cases
#    git commit -m 'install latest git-TEST-commit-automation/hooks'
#    git push   #28
#>>>

#    Answer that question, what now (WTF)  . . .  shit I forgot what this does, hadn't done this in six months, quick what is the answer!
echo -e "    ${BOLD}For more information:${YELLOW}"
echo    "    https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/docs/STEPS-TO-EVALUTE.md#installevaluate-git-test-commit-automation-solution"
echo    "    git-setup-TEST-cases.sh has installed or upgraded git-TEST-commit-automation"
echo    "    in the current Git repository.  The following commands git-TEST-cases.sh,"
echo    "    git-setup-TEST-cases.sh, git-set-env-for-manual-test.sh, and"
echo    "    git-uninstall-TEST-cases.sh  have been copied to /usr/local/bin.  Test"
echo    "    scripts have been updated with the latest test scipts from the remote git"
echo    "    repository.  git-TEST-commit-automation runs pre-commit & post-commit hooks"
echo    "    when git commit -m 'message' is executed.${NORMAL}"

#
new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "${BOLD}${CYAN}  Operation finished...${NORMAL}" 1>&2  # 1.3.614
###
