**Notes:** Use the following example to guide you to; How to download an earlier release.

    git clone https://github.com/BradleyA/<REPOSITORY>.git --branch 2.42

## Next Version Under Construction {Version  3.2.????}  <img id="Construction" src="images/construction-icon.gif" width="120">
#### Release Name  Beta-4
#### Release Date  ????
* Brief description
* sub-repository
  * Brief description

### Features Added
* git-TEST-commit-automation/hooks/bin/EXAMPLES
  * added the following test cases
    * FVT-exit-code-error-0-001
    * FVT-exit-code-error-1-001
    * FVT-exit-code-error-124-001
    * FVT-exit-code-error-124-002
    * FVT-exit-code-error-126-001
    * FVT-exit-code-error-127-001
    * FVT-exit-code-error-128-001
    * FVT-exit-code-error-130-001
    * FVT-exit-code-error-2-001
    * FVT-option-clean-hooks-001
    * FVT-option-clean-hooks-002
    * FVT-option-clean-hooks-003
    * FVT-option-clean-hooks-004

### Features Changes
### Features Deprecations
### Issues
* close #8  hooks/EXAMPLES/SA-permission-txt-001 - add test case
* close #27 hooks/bin/uninstall-git-TEST-cases.sh - add option & environment variable for git push
* close #28 hooks/bin/setup-git-TEST-cases.sh - add option & environment variable for git push
* close #43 hooks/EXAMPLES/SA-??? test with git-secrets, git-hound, and truffleHog
* close #44 hooks/post-commit - if test case not found error message

### Misc

# Latest Release -->  Version 3.1.1.1492
#### Release Name  Beta-3
#### Release Date  2020-02-03T22:58:57.875468-06:00 (CST)

* Create custom FVT- test cases to test the options used by git-TEST-cases.sh

### Features Added
* git-TEST-commit-automation/hooks/bin/EXAMPLES
  * close #36 added the following test cases
    * FVT-option-add-001
    * FVT-option-all-001
    * FVT-option-all-002
    * FVT-option-all-hooks-001
    * FVT-option-all-hooks-002
    * FVT-option-clean-001
    * FVT-option-clean-002
    * FVT-option-filename-001
    * FVT-option-filename-002
    * FVT-option-filename-003
    * FVT-option-filename-004
    * FVT-option-filename-005
    * FVT-option-filename-006
    * FVT-option-filename-hooks-001
    * FVT-option-filename-hooks-002
    * FVT-option-filename-hooks-003
    * FVT-option-filename-hooks-004
    * FVT-option-filename-hooks-005
    * FVT-option-filename-hooks-006
    * FVT-option-filename-hooks-007
    * FVT-option-filename-hooks-008
    * FVT-option-filename-hooks-009
    * FVT-option-filename-hooks-010
    * FVT-option-filename-hooks-011
    * FVT-option-filename-hooks-012
    * FVT-option-none-001
    * FVT-option-none-002
    * FVT-option-none-hooks-001
    * FVT-option-none-hooks-002
    * FVT-option-none-hooks-003
    * FVT-option-none-hooks-004
    * FVT-option-usage-004
    * FVT-option-version-004
* git-TEST-commit-automation/hooks/EXAMPLES/FVT-*
  * Added user hint that script does not support -* or help or usage or version
* git-TEST-commit-automation/hooks/EXAMPLES/SA-*
  * Added user hint that script does not support -* or help or usage or version
* git-TEST-commit-automation/hooks/bin/{setup-git-TEST-cases.sh, uninstall-git-TEST-cases.sh}
  * Added user hint that script does not support -* or help or usage or version
* git-TEST-commit-automation/hooks/EXAMPLES/FVT-cleanup.sh
  * Remove FVT-test-case.expected that has a size of zero
* git-TEST-commit-automation/hooks/EXAMPLES/SA-cleanup.sh
  * Remove SA-test-case.expected that has a size of zero

### Feature Changes
* git-TEST-commit-automation/hooks/EXAMPLES/FVT-*
  * Production standard 5.3.559 Copyright
  * Production standard 1.3.550 DEBUG variable,
  * Production standard 2.3.529 log format
  * Shorten text length user messages for PASS and FAIL
* git-TEST-commit-automation/hooks/EXAMPLES/SA-*
  * Production standard 5.3.559 Copyright
  * Production standard 1.3.550 DEBUG variable,
  * Production standard 2.3.529 log format
  * Shorten text length user messages for PASS and FAIL
* git-TEST-commit-automation/hooks/bin/git-TEST-cases.sh
  * Production standard 0.3.550 --help
  * Production standard 1.3.550 DEBUG variable
  * Production standard 2.3.529 log format
  * Production standard 4.3.550 Documentation Language
  * Production standard 5.3.559 Copyright
  * Production standard 6.3.547 Architecture tree
  * Production standard 8.3.541 --usage
  * Production standard 9.3.562 Parse CLI options and arguments
  * Production standard 10.0    TESTing
  * close #42 Set REPOSITORY_DIR, exit if NOT a git repository
* git-TEST-commit-automation/hooks/bin/{setup-git-TEST-cases.sh, uninstall-git-TEST-cases.sh}
  * Production standard 1.3.550 DEBUG variable
  * Production standard 2.3.529 log format
  * Production standard 5.3.559 Copyright
* git-TEST-commit-automation/hooks/README
  * Update

### Issues
* close #36 git-TEST-commit-automation/hooks/bin/EXAMPLES/ - custom test cases for FVT options
* close #42 hooks/bin/git-TEST-cases.sh - command should have exit if not in git repository
* close #45 hooks/EXAMPLES/FVT-option-filename-hooks-001-012 - finsh test
* clone #46 hooks/EXAMPLES/FVT-option-filename-005-6 - finish testing with git-TEST-cases.sh

## Version 2.211.959
#### Release Name Beta-2
#### Release Date  2020-01-08T22:52:15.469894-06:00 (CST)

* Create scripts to assist running something, and checking something, then reporting something; when you commit something.

### Features
* close #1  hooks/bin/list-git-TEST-cases.sh Rename SAST to SA for Static Analysis #1 
* close #2  hooks/bin/setup-git-TEST-cases.sh - setup git TEST cases in current Git repository #2 
* close #3  hooks/bin/git-TEST-cases.sh - add support for clean file #3 
* close #4  hooks/post-commit - total number of errors per error wrong #4 
* close #5  template/template.sh - add DEBUG 4 Exit command when a non-zero exit status #5 
* close #6  hooks/EXAMPLES/SA-permission-own-10000-001 - add #6 
* close #7  hooks/EXAMPLES/SA-permission-grp-10000-001 - add #7 
* close #10 hooks/post-commit - review adding additional options #10 
* close #11 hooks/EXAMPLES/FVT-setup.sh - allow to be run without post-commit #11 
* clsoe #13 hooks/EXAMPLES/SA-setup.sh - allow to be run without post-commit #13 
* close #14 hooks/bin/setup-git-TEST-cases.sh - consider adding a user hint #14 
* clsoe #15 hooks/bin/uninstall-git-TEST-cases.sh - consider adding a user hint #15 
* close #16 hooks/EXAMPLES/FVT-exit-code-error-0-001 - add #16 
* close #17 hooks/EXAMPLES/FVT-exit-code-error-1-001 #17 
* close #18 hooks/bin/git-TEST-cases.sh - add support to list non tested files #18 
* close #19 hooks/bin/git-TEST-cases.sh - add option to show TEST cases for hooks/ default is not show #19 
* close #20 hooks/bin/uninstall-git-TEST-cases.sh - correct incident with not removing TEST directory #20 
* close #21 hooks/bin/git-TEST-cases.sh - finish display_help #21 
* close #22 hooks/bin/git-TEST-cases.sh - add user hint #22 
* close #23 hooks/EXAMPLES/SA-shellcheck-001 - add code to compare code after #86# #23
* close #24 finish README.md #24 
* close #25 hooks/EXAMPLES/SA-setup.sh - open tickets for additional test cases #25 
* close #29 hooks/bin/git-TEST-cases.sh - add option --add default SA- #29 
* close #34 hooks/bin/EXAMPLES - ALL test cases updated NO -x ${1} exit ERROR 126 #34 
* close #35 hooks/bin/EXAMPLES/TEST/SA-shellcheck-001/SA-shellcheck-001 #35 
* close #37 hooks/bin/EXAMPLES/SA-* FVT-* - add color to all test cases #37 
* close #38 hooks/post-commit - remove test cases after running them #38 
* close $40 hooks/bin/git-TEST-cases.sh - add git add & commit when creating default test case #40


## EXAMPLE: Next Version Under Construction {Version  X.X.????}  <img id="Construction" src="images/construction-icon.gif" width="120">
# EXAMPLE: Latest Release -->  Version  X.X.????
#### Release Name  {unreleased rc-# alpha-# beta prerelease latest}
#### Release Date  ????
* Brief description
* sub-repository
  * Brief description

### Features Added
* Update feature||file
* Added the following test cases
    * hooks/bin/EXAMPLES/FVT-exit-code-error-0-001
* sub-repository
  * directory/command   git commit message
  * directory/command   git commit message close #XX

### Features Changes
### Features Deprecations
### Issues
* close #X  directory/command   git commit message
* sub-repository
  * close #XX directory/command git commit message
  
### Misc
