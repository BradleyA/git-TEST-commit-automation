#!/bin/bash
# 	hooks/bin/git-set-env-for-manual-test.sh  3.1.153.1884  2020-11-24T12:26:14.068388-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.152  
# 	   hooks/EXAMPLES/SA-setup.sh hooks/bin/git-set-env-for-manual-test.sh -->   begin testing REPOSITORY_RELATIVE_PATH in hooks/EXAMPLES/SA-setup.sh  
#86# hooks/bin/git-set-env-for-manual-test.sh
#    Run this script when manually testing test cases    . hooks/bin/git-set-env-for-manual-test.sh  OR  source hooks/bin/git-set-env-for-manual-test.sh
#    This script sets REPOSITORY_DIR and REPOSITORY_DIR_COUNT environment variables which are normally set when post-commit is run
#    This is required because post-commit is has not run before manually testing a test case
###    
#
BOLD=$(tput -Txterm bold)
UNDERLINE=$(tput -Txterm sgr 0 1)  # 0.3.583
NORMAL=$(tput -Txterm sgr0)
RED=$(tput    setaf 1)
YELLOW=$(tput setaf 3)
WHITE=$(tput  setaf 7)

#    No --help  # 0.3.610
if [[ "${1}" != "" ]] ; then
  echo    "${LINENO}" "${RED}ERROR${WHITE}" "  Arguements and options are not supported." 1>&2  # 0.3.610
  echo -e "    ${BOLD}For more information:\n    ${UNDERLINE}${BOLD}${YELLOW}https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md\n${NORMAL}"  # 0.3.610
  exit 1
fi

echo -e "\nRun this script before manually testing git-TEST-commit-automation test cases:\n\n\t${BOLD}${YELLOW}source  hooks/bin/git-set-env-for-manual-test.sh${NORMAL}\n"
echo    "This script sets ${BOLD}REPOSITORY_DIR${NORMAL} and ${BOLD}REPOSITORY_DIR_COUNT${NORMAL} environment variables"
echo    "which are normally set when post-commit is run.  This is required because"
echo -e "post-commit has not run before manually testing a test case.${BOLD}"

REPOSITORY_DIR=$(git rev-parse --show-toplevel)
export REPOSITORY_DIR  #  export REPOSITORY_DIR so test scripts can use it
echo    "  export REPOSITORY_DIR  >${REPOSITORY_DIR}<"
REPOSITORY_DIR_COUNT=$(awk -F"/" '{print NF-1}' <<< "${REPOSITORY_DIR}")  #
REPOSITORY_DIR_COUNT=$((REPOSITORY_DIR_COUNT+1))
export REPOSITORY_DIR_COUNT  #  export number of directories + 1
echo    "  export REPOSITORY_DIR_COUNT  >${REPOSITORY_DIR_COUNT}<"
#
REPOSITORY_RELATIVE_PATH=$(git rev-parse --show-cdup)  #  path of the top-level directory relative to the current directory or AN EMPTY STRING
export REPOSITORY_RELATIVE_PATH
echo    "  export REPOSITORY_RELATIVE_PATH  >${REPOSITORY_RELATIVE_PATH}<"

###
