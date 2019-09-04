**WARNING**: These instructions are incomplete. Consider them as notes quickly drafted on a napkin rather than proper documentation!

# in development 
(8/2019 - 9/2019)
# git-TEST-commit-automation

Scripts to assist running something, and checking something, then reporting something; when you commit something. 

#### Strategy:

- This design offers quick feed back to file commits and test case commits in a Git repository. 
  - If you are notified that there is an incident with your file when something was entered using version 3.498.
      - It has been 1 minute or 12 days, which of these two scenarios would take less time to resolution.
- Continuous Testing (CT) at every level, in every silo is required to reduce business risk and improve quality.

#### Objectives:
- Quick setup with default test cases for any Git repository (in seconds)
- Quick uninstall on any Git repository (in seconds)
- Quick check of test case depth for each file TESTed for any Git repository (in seconds) (option: all)
- Quick reduction of untracked TEST case files (in seconds) (option: clean)
- Include hooks/ in repostory because .git/hooks is not pushed to GitHub (need to retest)
- Maintain test cases in repository (you know all in one repository) with repository files being TESTed . . .  custom TEST cases
   
   **Work needed here**
    - Design for quick test case git branch merge (include steps)
    - Quick upgrade of default test cases and test case code fixes (include steps)
    - Quick test branch merge from test team's custom test cases (no merge conflicts)  (include steps)
    - Quick configuration of FVT and SA test case for command in \<REPOSITORY>/\<PATH>/TEST/\<COMMIT_FILE_NAME>/{FVT-setup.sh, SA-setup.sh, FVT-cleanup.sh, SA-cleanup.sh}
    - Quick backup of all test cases in repository (\<FILE-NAME>.tar) (code in uninstall and option for backup)
    - Allow support in design for additional test case type (FVT,SA)
    - support several types of files
    - support BATS

How is that?

    git commit -m 'latest changes' <COMMIT_FILE_NAME>

After entering the above command, Git runs any Git hooks found in \<REPOSITORY-NAME>/.git/hooks/ directory.  Git hooks are scripts that Git executes before and/or after events. Two local Git hooks are included with git-TEST-commit-automation. 

- hooks/pre-commit  - Creates \<REPOSITORY>/hooks/COMMIT_FILE_LIST with a list of \<REPOSITORY-PATH>/\<FILE> being committed
- hooks/post-commit - Run production standard TESTing  

     **Production standard TESTing** - run test cases if found in \<REPOSITORY>/hooks/COMMIT_FILE_LIST
  - Loop through committed files found in COMMIT_FILE_LIST
  - Check if COMMIT_FILE has a 'TEST' directory
  - Create links to EXAMPLES/\<TEST_CASE> and \<TEST_CASE>.expected (test case output) and other test case files
  - Create list of test cases found in \<REPOSITORY>/\<PATH>/TEST/\<COMMIT_FILE_NAME>/ directory
  - Loop through \<REPOSITORY>/\<PATH>/TEST/\<TEST_CASE>
  - Run \<REPOSITORY>/\<PATH>/TEST/\<TEST_CASE>

**PASS** or **FAIL** or **ERROR**, some methed will notify someone of the results. (not sure which method is going to work for me and you? . . . stdout, logs-scrape, tables, email, twitter, slack, tall a friand, etc.)
 
**hooks directory**

There are two GitHub commit hooks that support running of **test cases**.  The pre-commit GitHub hook bash script creates a list of committed files with repository subdirectory.  The post-commit GitHub hook bash script runs found FVT test case(s) for a committed file.  The hooks directory was created because I wanted to modify the GitHub hooks and track changes per repository.

**start review and merge here**

**Functional Verification** is defined as the process of verifying that the design meets its specification from a functional perspective. ... Functional verification establishes that the design under test (DUT) implements the functionality of the specification correctly.
verifying that the design meets its specification from a functional perspective. ... Functional verification establishes that the design under test (DUT) implements the functionality of the specification correctly.


[Learn more about how to setup test cases.](hooks/README.md)

**Note**   I found out about hooks and need to remember and add to the README why I added a hooks directory in the repository so the hooks can be managed by the repository . . .Hooks are per-repository and are not designed to be pushed but can be pushed. Similarly, the repo config isn't pushed either, nor is anything in .git/info , or a number of other things. Pushing and pulling only exchanges branches/tags and commit objects (and anything reachable from a commit, e.g. trees, blobs**

**setup an environment for all tests to be run, creating directories for output, setting environment variables ... include clean section to remove and unset environment variables**

## Setup Test Cases

First do this then 

    git clone https://github.com/BradleyA/git-TEST-commit-automation.git
 
 **setup-git-TEST-cases.sh**
 
    cd git-TEST-commit-automation/hooks
    ln -s ../../hooks/post-commit ../.git/hooks/post-commit
    ln -s ../../hooks/pre-commit ../.git/hooks/pre-commit

How to edit this shit FVT-setup.sh and SA-setup.sh . . . ore make a script or option
    cd ..
    mkdir TEST/<FILE_TO_BE_TESTED>/
    cd TEST/<FILE_TO_BE_TESTED>/

Create a test case in directory, TEST/<file_to_be_tested>/, and name the file 'FVT-<test-case-name-no-dot-001>' (example: FVT-option-help-001).  Place the expected results from the test case into a file with the same name but add '.expcted' ('dot'expected).  In your test case, pipe the output into a file with the same name but add '.test-case-output'.  Append the following lines into your test case:

    #
    diff "${0}".expected "${0}".test-case-output >/dev/null 2>&1
    RETURN_CODE=${?}
    if [ ${RETURN_CODE} -eq 0 ] ; then
           echo "${BOLD}Test case --->${NORMAL} ${0} ${1} ${RETURN_CODE} - No difference with expected output - ${BOLD}PASS - PASS${NORMAL}"
    elif [ ${RETURN_CODE} -eq 1 ] ; then
           echo "${BOLD}Test case --->${NORMAL} ${0} ${1} ${RETURN_CODE} - Differences with expected output - ${BOLD}FAIL - FAIL${NORMAL}"
           diff -y "${0}".expected "${0}".test-case-output
    else
           echo "${BOLD}Test case --->${NORMAL} ${0} ${1} ${RETURN_CODE} - Test script ERROR - ${BOLD}FAIL - FAIL${NORMAL}"
    fi


# Memo:

Note: 
edit  all SA-setup.sh:

    find ./hooks/ -type f -name SA-setup.sh -exec vi {} \;

Note:  

    $ git status
    On branch master
    Your branch is up-to-date with 'origin/master'.
    Untracked files:
      (use "git add <file>..." to include in what will be committed)

	hooks/

nothing added to commit but untracked files present (use "git add" to track)
 
     021452 uadmin@three-rpi3b: /tmp/dmonitor
         $ ls -al
    total 32
    drwxrwxr-x 5 uadmin uadmin 4096 Sep  2 14:37 .
    drwxrwxrwt 9 root   root   4096 Sep  2 14:52 ..
    -rwxrwxr-x 1 uadmin uadmin 1606 Sep  2 14:36 dmonitor
    drwxrwxr-x 8 uadmin uadmin 4096 Sep  2 14:52 .git
    drwxrwxr-x 5 uadmin uadmin 4096 Sep  2 13:40 hooks
    drwxrwxr-x 2 uadmin uadmin 4096 Sep  2 14:36 images
    -rw-rw-r-- 1 uadmin uadmin 1070 Sep  2 14:36 LICENSE
    -rw-rw-r-- 1 uadmin uadmin 4038 Sep  2 14:36 README.md

    021452 uadmin@three-rpi3b: /tmp/dmonitor
         $ mkdir -p TEST/dmonitor
    021453 uadmin@three-rpi3b: /tmp/dmonitor
         $ cp hooks/EXAMPLES/SA-setup.sh TEST/dmonitor


Add something about creating a symbolic link from ../.git/hooks to this hooks directory that are managed in this repository using markit.  . . .  covered earlier WTF

Need to add something here but what?

====>>>

[BradleyA/git-TEST-commit-automation] hooks/bin/setup-git-TEST-cases.sh - setup git TEST cases in current repository (#2)
after setup-git-TEST-cases.sh is run some additions steps are needed

git add hooks - if you want to include the tools in your repository remembering you can always upgrade to a later level without losing custom scripts or remove it

git add hooks
git commit -m 'install git-TEST-commit-automation'


====>>>

You can turn a folder within a Git repository into a brand new repository.    **find that doc I printed to complete this section

add branch marge what ever 




