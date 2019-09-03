**WARNING**: These instructions are incomplete. Consider them as notes quickly drafted on a napkin rather than proper documentation!

# in development (8/2019 - 9/2019)
# git-TEST-commit-automation

Scripts to assist running something, and checking something, then reporting something; when you commit something. 

#### Strategy:

- Running tests on code with quick turn around helps when finishing a desgin or fixing an incident.  
- If you are notified that there is an incident after something when something was entered on version 3.498.  If you just pushed that version 1 minutes ago or if you pushed it 12 days ago, which of these two scenarios would take you less time to resolution.
- This design offers quick feed back to code commits and test case commits.
- Continuous Testing (CT) at every level, in every silo is required to reduce risk.  These scripts add to CT strategy.
- Quick setup and uninstall on any git repository
- Quick check of test cases for testing depth

How is that?

    git commit -m 'latest changes' <COMMIT_FILE_NAME>

After entering the above command, Git runs any Git hooks found in <repository/.git/hooks/ directory.  Git hooks are scripts that Git executes before or after events. Two local Git hooks are included with git-TEST-commit-automation. 

- hooks/pre-commit  - Creates <REPOSITORY>/hooks/COMMIT_FILE_LIST with a list of <REPOSITORY-PATH>/<FILE> being committed
- hooks/post-commit - Run production standard TESTing using .git/hooks
  
    **Production standard TESTing** - run test cases if found on <REPOSITORY>/hooks/COMMIT_FILE_LIST
  - Loop through committed files found in COMMIT_FILE_LIST
  - Check if COMMIT_FILE has a 'TEST' directory
  - Create links to EXAMPLES/<TEST_CASE> and <TEST_CASE>.expected (test case output) and other test case setup
  - Create list of test cases found in <REPOSITORY>/<PATH>/TEST/<COMMIT_FILE_NAME>/ directory
  - Loop through <TEST_CASE>
  - Run <TEST_CASE>




**PASS** or **FAIL**, some methed will notify someone of the results. (not sure which method is going to work for me and you? . . . stdout, logs-scrape, tables, email, twitter, slack, tall a friand, etc.)

**start review and merge here**
Functional Verification is defined as the process of verifying that the design meets its specification from a functional perspective. ... Functional verification establishes that the design under test (DUT) implements the functionality of the specification correctly.
verifying that the design meets its specification from a functional perspective. ... Functional verification establishes that the design under test (DUT) implements the functionality of the specification correctly.

 
**hooks directory**, there are two GitHub commit hooks that support running of **test cases**.  The pre-commit GitHub hook bash script creates a list of committed files with repository subdirectory.  The post-commit GitHub hook bash script runs found FVT test case(s) for a committed file.  The hooks directory was created because I wanted to modify the GitHub hooks and track changes per repository.  [Learn more about how to setup test cases.](hooks/README.md)

**Note I found about hooks I need to remember and add to the readme why I added a hooks directory so the hooks can be managed by the repository . . .Hooks are per-repository and are never pushed. Similarly, the repo config isn't pushed either, nor is anything in .git/info , or a number of other things. Pushing and pulling only exchanges branches/tags and commit objects (and anything reachable from a commit, e.g. trees, blobs**

**setup an environment for all tests to be run, creating directories for output, setting environment variables ... include clean section to remove and unset environment variables**

## Setup Test Cases

    git clone https://github.com/BradleyA/user-files.git
    
    cd user-files/hooks
    ln -s ../../hooks/post-commit ../.git/hooks/post-commit
    ln -s ../../hooks/pre-commit ../.git/hooks/pre-commit
    
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

note: update SA-setup.sh : find ./hooks/ -type f -name SA-setup.sh -exec vi {} \;

note:      
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
     $ cp hooks/EXAMPLES/SA-setup.sh !$
cp hooks/EXAMPLES/SA-setup.sh TEST/dmonitor


Add something about creating a symbolic link from ../.git/hooks to this hooks directory that are managed in this repository using markit.


Need to add something here but what?

====>>>
====>>>


You can turn a folder within a Git repository into a brand new repository.

If you create a new clone of the repository, you won't lose any of your Git history or changes when you split a folder into a separate repository.

    Open Terminal.

    Change the current working directory to the location where you want to create your new repository.

    Clone the repository that contains the subfolder.

    >  git clone https://github.com/USERNAME/REPOSITORY-NAME

git clone https://github.com/BradleyA/user-files.git

    Change the current working directory to your cloned repository.

    $ cd REPOSITORY-NAME

cd user-files

    To filter out the subfolder from the rest of the files in the repository, run git filter-branch, supplying this information:

        FOLDER-NAME: The folder within your project that you'd like to create a separate repository from.

        BRANCH-NAME: The default branch for your current project, for example, master or gh-pages.

        $ git filter-branch --prune-empty --subdirectory-filter FOLDER-NAME  BRANCH-NAME 
          # Filter the specified branch in your directory and remove empty commits
          > Rewrite 48dc599c80e20527ed902928085e7861e6b3cbe6 (89/89)
          > Ref 'refs/heads/BRANCH-NAME' was rewritten

git filter-branch --prune-empty --subdirectory-filter hooks master

    The repository should now only contain the files that were in your subfolder.
    Create a new repository on GitHub.

    At the top of your new GitHub repository's Quick Setup page, click to copy the remote repository URL. 
    Copy remote repository URL field

    Tip: For information on the difference between HTTPS and SSH URLs, see "Which remote URL should I use?"
    
    Check the existing remote name for your repository. For example, origin or upstream are two common choices.  

    $ git remote -v
    > origin  https://github.com/USERNAME/REPOSITORY-NAME.git (fetch)
    > origin  https://github.com/USERNAME/REPOSITORY-NAME.git (push)

git remote -v

    Set up a new remote URL for your new repository using the existing remote name and the remote repository URL you copied in step 7.

    git remote set-url origin https://github.com/USERNAME/NEW-REPOSITORY-NAME.git

git remote set-url origin https://github.com/BradleyA/git-TEST-commit-automation.git

    Verify that the remote URL has changed with your new repository name.

    $ git remote -v
    # Verify new remote URL
    > origin  https://github.com/USERNAME/NEW-REPOSITORY-NAME.git (fetch)
    > origin  https://github.com/USERNAME/NEW-REPOSITORY-NAME.git (push)

git remote -v

    Push your changes to the new repository on GitHub.

    git push -u origin BRANCH-NAME

git push -u origin master



