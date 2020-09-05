#!/bin/bash
# 	hooks/bin/set-env-for-manual-test.sh  3.1.93.1652  2020-09-05T07:57:20.901435-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  master  uadmin  five-rpi3b.cptx86.com 3.1.92-1-g500781d  
# 	   hooks/bin/set-env-for-manual-test.sh -->   correct typo in help comment  
#86# hooks/bin/set-env-for-manual-test.sh
#    Run this script when manually testing test cases    . hooks/bin/set-env-for-manual-test.sh  OR    source hooks/bin/set-env-for-manual-test.sh
#    This script sets REPOSITORY_DIR and REPOSITORY_DIR_COUNT environment variables which are normally set when post-commit is run
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
