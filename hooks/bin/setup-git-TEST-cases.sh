#!/bin/bash
# 	hooks/bin/setup-git-TEST-cases.sh  2.1.269  2019-09-01T12:52:19.200878-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 'No-parent-git-tag-found-in-repository'  
# 	   hooks/bin/setup-git-TEST-cases.sh  add ruff notes about linking commands 
###
#	after clone  repository
#      after tar, copy, or clone  repository
#	copy commands to /usr/local/bin
#
cd git-TEST-commit-automation/hooks
ln -s ../../hooks/post-commit ../.git/hooks/post-commit
ln -s ../../hooks/pre-commit ../.git/hooks/pre-commit
#	
#	need to determine where to start after copying commands
#
#
#
#
