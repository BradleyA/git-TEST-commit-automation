#!/bin/bash
# 	hooks/bin/uninstall-git-TEST-cases.sh  2.29.310  2019-09-02T13:35:03.468980-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.28  
# 	   hooks/bin/setup-git-TEST-cases.sh  change code to support design requirement - download the latest git-TEST-commit-automation/hooks 
# 	hooks/bin/teardown-TEST-cases.sh  3.340.579  2019-08-19T14:22:23.253592-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.339  
# 	   hooks/bin/setup-TEST-cases.sh hooks/bin/teardown-TEST-cases.sh changed file permission 
# 	hooks/bin/teardown-TEST-cases.sh  3.339.578  2019-08-19T14:15:31.503381-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.338  
# 	   hooks/bin/setup-TEST-cases.sh hooks/bin/teardown-TEST-cases.sh initial commit 
###



git rm -r hooks
git commit -m 'remove git-TEST-commit-automation  hooks recursively'
git push
