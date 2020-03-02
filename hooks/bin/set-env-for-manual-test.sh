#!/bin/bash
# 	hooks/bin/set-env-for-manual-test.sh  3.1.4.1507  2020-03-02T16:32:36.424277-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.3  
# 	   hooks/bin/set-env-for-manual-test.sh   testing manual script to set REPOSITORY_DIR and REPOSITORY_DIR_COUNT environment variables 
#86# hooks/bin/set-env-for-manual-test.sh
#    Run this script when manually testing test cases 
#    This script sets REPOSITORY_DIR and REPOSITORY_DIR_COUNT environment variables which are normally set when poet-commit is run
#    This is required because post-commit is has not run before manually testing a test case
###    

REPOSITORY_DIR=$(git rev-parse --show-toplevel)
export REPOSITORY_DIR  #  export REPOSITORY_DIR so test scripts can use it
echo    "  export REPOSITORY_DIR  >${REPOSITORY_DIR}<"
REPOSITORY_DIR_COUNT=$(awk -F"/" '{print NF-1}' <<< "${REPOSITORY_DIR}")  #
REPOSITORY_DIR_COUNT=$((REPOSITORY_DIR_COUNT+1))
export REPOSITORY_DIR_COUNT  #  export number of directories + 1
echo    "  export REPOSITORY_DIR_COUNT  >${REPOSITORY_DIR_COUNT}<"

###
