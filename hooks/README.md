# git-TEST-commit-automation  [![Release Status](https://img.shields.io/badge/Status_-Beta--3-red.svg)](https://github.com/BradleyA/git-TEST-commit-automation/releases/tag/3.1.1)

[![GitHub Release](https://img.shields.io/badge/Release-3.1.1-blue.svg)](https://github.com/BradleyA/git-TEST-commit-automation/releases/tag/3.1.1)
[![GitHub Release Date](https://img.shields.io/github/release-date/BradleyA/git-TEST-commit-automation?color=blue)](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/CHANGELOG.md)
[![GitHub Commits Since](https://img.shields.io/github/commits-since/BradleyA/git-TEST-commit-automation/3.1.1?color=orange)](https://github.com/BradleyA/git-TEST-commit-automation/commits/)
[![GitHub Last Commits](https://img.shields.io/github/last-commit/BradleyA/git-TEST-commit-automation.svg)](https://github.com/BradleyA/git-TEST-commit-automation/commits/)

[![Open GitHub Issue](https://img.shields.io/badge/Open_new-Issue-brightgreen.svg)](https://github.com/BradleyA/git-TEST-commit-automation/issues/new/choose)
[![GitHub Open Issues](https://img.shields.io/github/issues/BradleyA/git-TEST-commit-automation?color=purple)](https://github.com/BradleyA/git-TEST-commit-automation/issues?q=is%3Aopen+is%3Aissue)
[![GitHub Closed Issues](https://img.shields.io/github/issues-closed/BradleyA/git-TEST-commit-automation?color=purple)](https://github.com/BradleyA/git-TEST-commit-automation/issues?q=is%3Aclosed+is%3Aissue)

[<img alt="GitHub Clones" src="https://img.shields.io/static/v1?label=Clones&message=358&color=blueviolet">](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/images/clone.table.md)
[<img alt="GitHub Views" src="https://img.shields.io/static/v1?label=Views&message=3675&color=blueviolet">](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/images/view.table.md)
[![GitHub Size](https://img.shields.io/github/repo-size/BradleyA/git-TEST-commit-automation.svg)](https://github.com/BradleyA/git-TEST-commit-automation/)
![Language Bash](https://img.shields.io/badge/%20Language-bash-blue.svg)
[![MIT License](http://img.shields.io/badge/License-MIT-blue.png)](LICENSE)

## Goal
Assist running something, and checking something, then reporting something; when you commit something.

#### If you like this repository, select in the upper-right corner, [![GitHub stars](https://img.shields.io/github/stars/BradleyA/git-TEST-commit-automation.svg?style=social&label=Star&maxAge=2592000)](https://GitHub.com/BradleyA/git-TEST-commit-automation/stargazers/), thank you.

## Table of content
<details>

- [Description](#Description)
- [Test Case Types](#Test-Case-Types)
- [Objectives](#Objectives)
- [Quick Start Tutorials](#Quick-Start-Tutorials)
- [Command Descriptions](#Command-Descriptions)
- [ARCHITECTURE TREE](#ARCHITECTURE-TREE)
- [Future Objectives](#Future-Objectives)
----
- [Contribute](#Contribute)
- [Author](#Author)
- [Tested OS](#Tested-OS)
- [Design Principles](#Design-Principles)
- [License](#License)

</details>

----

## Description

After entering the following command:

    git commit -m 'latest changes' <COMMIT_FILE_NAME>
    
Git runs any Git hooks found in \<REPOSITORY-NAME>/.git/hooks/ directory.  Git hooks are scripts that Git executes before and/or after events. Two local Git hooks are included with git-TEST-commit-automation (pre-commit, post-commit).

**pre-commit** creates a file (${REPOSITORY-NAME}/hooks/COMMIT_FILE_LIST) which includes files being commited. 

**post-commit** searches for a TEST/\<filename>/ directory in the directory where the commited filename is located. If found **post-commit** runs TEST/\<filename>/SA-setup.sh and/or TEST/\<filename>/FVT-setup.sh then searches for files beginning with SA- of FVT- and runs them.

TL;DR - Why did I create git-TEST-commit-automation when there are so many great open software and enterprise level testing solutions available.  I needed something that would run some basic Static Analysis Tests (SA) and Funciotnal Verification Tests (FVT) with minimal learning curve.  A solution that would inform, not impede code development.  That would encourage 'git commit -m 'message', not exit 1 if there is any code incident.  A solution that allows basic test cases to be included with code in a Git repository.  A solution that could be setup and uninstall without effecting the code being developed.  A solution that would support adding other test solutions to this solution with minimal changes.

TL;DR - During code design, a software developer's focus is on how to solve parts of a bigger solution.  A developer may throw out a couple to dozens of lines of code.  It did not matter that those lines of code did or didn't meet every test requirement.  As a design matures it is increasingly important to have code PASS tests.  It is also important for a developer to design SA and FVT test cases for their new code.  At that time their code is ready for additional testing using open software and enterprise level testing solutions.

[Return to top](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#git-TEST-commit-automation)

## Test Case Types

[**Funciotnal Verification Test (FVT)**](https://en.wikipedia.org/wiki/Functional_testing) is defined as the process of verifying that the design meets its specification from a functional perspective. ... Functional verification establishes that the design under test (DUT) implements the functionality of the specification correctly.

[**Static Analysis (SA)**](https://en.wikipedia.org/wiki/Static_program_analysis) is the examination of code prior to the program’s execution SA is code analysis, syntax, permission, code inspection, code review, etc.

[Return to top](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#git-TEST-commit-automation)

## Objectives

<details>
	
* Quick setup with default test cases for any Git repository (in seconds)
* Quick uninstall on any Git repository
* Quick check of test case depth for a file (option -f) and all files for any Git repository (option -a)
* Quick setup of default SA- test cases for a file (options --filename sample.sh --add)
* Quick upgrade of default test cases and git-TEST-commit-automation commands (git-setup-TEST-cases.sh)
* Quick reduction of untracked TEST case files (option -c)

[Return to top](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#git-TEST-commit-automation)

</details>

## Quick Start Tutorials
	
#### [Install/evaluate git-TEST-commit-automation solution](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-EVALUTE.md)

#### [Uninstall git-TEST-commit-automation solution](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-UNINSTALL.md)

#### [View test case depth for a file](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-CHECK-DEPTH.md)

#### [Setup default SA- test cases for a new file](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-SETUP-DEFAULT-SA-TEST-CASES.md)

#### [Create custom test cases for a file](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-CREATE-TEST-CASES.md)

[Return to top](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#git-TEST-commit-automation)

## Command Descriptions

**pre-commit** - Creates \<REPOSITORY-NAME>/hooks/**COMMIT_FILE_LIST** with a list of \<REPOSITORY-NAME>/\<FILE> being committed.

**post-commit** 
- Loop through committed files found in \<REPOSITORY-NAME>/hooks/**COMMIT_FILE_LIST**
- if COMMIT_FILE has a \<REPOSITORY-NAME>/\<PATH>/TEST/\<COMMIT_FILE>/' directory run FVT-setup.sh and/or SA-setup.sh
- Loop through and run \<REPOSITORY-NAME>/\<PATH>/TEST/\<COMMIT_FILE>/SA-<TEST_CASE> and/or FVT-<TEST_CASE>
- Report output as **PASS** or **FAIL** or **ERROR**, through stdout 
      . . . some methed will notify someone of the results. (not sure which method is going to work for me and you? 
      . . . stdout, logs-scrape, tables, email, twitter, slack, call a friand, etc.)
 
**git-TEST-cases.sh** - lists and manages files in TEST case directories in current Git repository

**git-setup-TEST-cases.sh** - setup git-TEST-commit-automation in top directory of current repository

**uninstall-git-TEST-cases.sh** - uninstall git-TEST-commit-automation in current repository

#### ARCHITECTURE TREE

    /usr/local/bin/                           <-- <BIN_DIR>
    ├── git-TEST-cases.sh
    ├── git-setup-TEST-cases.sh
    └── uninstall-git-TEST-cases.sh>

[Return to top](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#git-TEST-commit-automation)

**hooks directory**  The \<REPOSITORY-NAME>/hooks directory was created for two reasons.  1) all git-TEST-commit-automation files are in one location to allow for quick removal without effecting other \<REPOSITORY-NAME>/ files.  2) the default \<REPOSITORY-NAME>/.git/hooks/files are not tracked and I wanted to track changes.  A symbolic link from \<REPOSITORY-NAME>/.git/hooks to this \<REPOSITORY-NAME>/hooks directory that are managed in this repository using [markit](https://github.com/BradleyA/markit/blob/master/README.md). 

Place the expected results from the test case into a file with the same test case name but add '.expected' ('dot'expected).  Pipe the output from the test case into a file with the same name but add '.test-case-output'. 

#### [ARCHITECTURE_TREE_REPOSITORY](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/ARCHITECTURE_TREE_REPOSITORY.md)

[Return to top](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#git-TEST-commit-automation)

#### Future Objectives 

**WARNING**: These instructions are incomplete. Consider them as notes quickly drafted on a napkin rather than proper documentation!

- <COMMIT_FILE_NAME>.test-case-input - Add support   #12
- Design for quick test case git branch merge (include steps)
- Quick test case branch merge from test team's custom test cases without merge conflicts (include steps)

      git remote --verbose
      git remote add origin https://github.com/BradleyA/git-TEST-commit.git
      git remote --verbose
      git push -u origin master

      git-TEST-cases.sh -c --hooks

      git branch -a
      git branch git-TEST-commit-#1

      git push origin git-TEST-commit-#1
      git branch -a
      
      #  create a branch
      git pull                      #  get latest pushed commits
      git checkout -b development   #  create development branch
      git push --set-upstream origin development   #  create github development branch upstream (github)
        #  or
      git push -u origin development
        #  write code in development branch
        #  create README on github master branch
      git pull origin master        #  pull chnages to master bransh to development bransh
        #  write code in development branch
 
  - challenge is SA-setup.sh & FVT-setup.sh could be changed by development and test teams 
  - Quick backup of all test cases in repository (\<FILE-NAME>.tar) (code is in uninstall-) (option: --backup --restore)
  - Include support for other test or CI solutions ... Scan for Credentials, BATS, Travis CI, ...

[Return to top](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#git-TEST-commit-automation)

 * Rquirements:
   * Linux
   * git
   * Internet access to GitHub
   
----

#### Contribute
Please do contribute!  Issues and pull requests are welcome.  Thank you for your help improving software.

[Return to top](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#git-TEST-commit-automation)

#### Author
[<img id="github" src="https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/images/github.png" width="50" a="https://github.com/BradleyA/">](https://github.com/BradleyA/)    [<img src="https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/images/linkedin.png" style="max-width:100%;" >](https://www.linkedin.com/in/bradleyhallen) [<img id="twitter" src="https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/images/twitter.png" width="50" a="twitter.com/bradleyaustintx/">](https://twitter.com/bradleyaustintx/)       <a href="https://twitter.com/intent/follow?screen_name=bradleyaustintx"> <img src="https://img.shields.io/twitter/follow/bradleyaustintx.svg?label=Follow%20@bradleyaustintx" alt="Follow @bradleyaustintx" />    </a>          [![GitHub followers](https://img.shields.io/github/followers/BradleyA.svg?style=social&label=Follow&maxAge=2592000)](https://github.com/BradleyA?tab=followers)

[Return to top](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#git-TEST-commit-automation)

#### Tested OS
 * Raspbian GNU/Linux 10 (buster)
 * Ubuntu 14.04.3 LTS (amd64,armv7l)
 * Ubuntu 16.04.7 LTS (amd64,armv7l)
 * Ubuntu 18.04.5 LTS (amd64,armv7l)

[Return to top](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#git-TEST-commit-automation)

#### Design Principles
 * Have a simple setup process and a minimal learning curve
 * Be usable as non-root
 * Be easy to install and configure

[Return to top](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#git-TEST-commit-automation)

#### License
MIT License

Copyright (c) 2020 [Bradley Allen](https://www.linkedin.com/in/bradleyhallen)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[Return to top](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/README.md#git-TEST-commit-automation)
