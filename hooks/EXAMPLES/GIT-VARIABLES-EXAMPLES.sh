#!/bin/bash
# 	hooks/EXAMPLES/GIT-VARIABLES-EXAMPLES.sh  2.275.1075  2020-01-21T15:52:58.251718-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  dev  uadmin  five-rpi3b.cptx86.com 2.274  
# 	   hooks/EXAMPLES/GIT-VARIABLES-EXAMPLES.sh   test changes 
# 	hooks/EXAMPLES/GIT-VARIABLES-EXAMPLES.sh  2.273.1073  2020-01-21T15:32:17.263779-06:00 (CST)  https://github.com/BradleyA/git-TEST-commit-automation.git  dev  uadmin  five-rpi3b.cptx86.com 2.272  
# 	   hooks/EXAMPLES/GIT-VARIABLES-EXAMPLES.sh   Production standard 5.3.559 Copyright 
###  I use this file to help debug hooks during development
###  Production standard 3.0 shellcheck
###  Production standard 5.3.559 Copyright                                    # 3.559
#    Copyright (c) 2020 Bradley Allen                                                # 3.555
#    MIT License is online in the repository as a file named LICENSE"         # 3.559
###
echo "GIT_AUTHOR_DATE >${GIT_AUTHOR_DATE}<"
echo "GIT_AUTHOR_NAME >${GIT_AUTHOR_NAME}<"
echo "GIT_AUTHOR_EMAIL >${GIT_AUTHOR_EMAIL}<"
echo "GIT_REFLOG_ACTION >${GIT_REFLOG_ACTION}<"
echo "GIT_INDEX_FILE >${GIT_INDEX_FILE}<"
echo "\$GIT_DIR >${GIT_DIR}<"
echo "\$(git rev-parse --git-dir) >$(git rev-parse --git-dir)<"
echo "\$(git rev-parse --show-toplevel) >$(git rev-parse --show-toplevel)<"
echo "pwd >$(pwd)<"
echo "GIT_WORK_TREE >${GIT_WORK_TREE}<"
hook="$(git rev-parse --git-path hooks/post-commit)"
echo "hook >${hook}<"
