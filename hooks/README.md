# git-TEST-commit-automation  [![Stable Release](https://img.shields.io/badge/Release-2.59-blue.svg)](https://github.com/BradleyA/git-TEST-commit-automation/releases/tag/2.59)    [![GitHub commits](https://img.shields.io/github/commits-since/BradleyA/git-TEST-commit-automation/2.59.svg)](https://github.com/BradleyA/git-TEST-commit-automation/commits/)

**In development** ...(8/2019 - 9/2019)   **In test** ...............(9/7/2019 - )
 
**WARNING**: These instructions are incomplete. Consider them as notes quickly drafted on a napkin rather than proper documentation!

#### Strategy:
Scripts to assist running something, and checking something, then reporting something; when you commit something. 

#### About

git-TEST-commit-automation runs pre-commit and post-commit when "git commit -m 'message' " is executed. Pre-commit creates a file (${REPOSITORY_DIR}/hooks/COMMIT_FILE_LIST) which incluses files being commited. Post-commit searches in the same directory as the commited filename for a TEST/\<filename>/ directory. If found post-commit runs TEST/<filename>/SA-setup.sh and/or TEST/<filename>/FVT-setup.sh then searches for files beginning with SA- of FVT- and runs them.

#### Objectives:
1) Quick setup with default test cases for any Git repository (in seconds)
2) Quick uninstall on any Git repository (in seconds)
3) Quick check of test case depth for a file (option -f) and all files for any Git repository (option -a)
4) Quick setup of default SA- test cases for a file (git-TEST-cases.sh --filename sample.sh --add)
5) Quick upgrade of default test cases with test case code fixes (setup-git-TEST-cases.sh)
6) Quick reduction of untracked TEST case files (option -c)

#### Future Objectives 

- <COMMIT_FILE_NAME>.test-case-input - Add support   #12
- Design for quick test case git branch merge (include steps)
- Quick test case branch merge from test team's custom test cases without merge conflicts (include steps)
  - challenge is SA-setup.sh & FVT-setup.sh could be changed by development and test teams 
- Quick backup of all test cases in repository (\<FILE-NAME>.tar) (code is in uninstall-) (option: --backup --restore)
- Include support for custom test cases or intergration with other test or CI solutions 
- Support several types of files (support additional test case types (FVT,SA)
	
#### [Install/evaluate git-TEST-commit-automation solution](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-EVALUTE.md)

#### [Uninstall git-TEST-commit-automation solution](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-UNINSTALL.md)

#### [View test case depth for a file](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-CHECK-DEPTH.md)

#### [Setup default SA- test cases for a new file](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-SETUP-DEFAULT-SA-TEST-CASES.md)

#### [Create custom test cases for git-TEST-commit-automation solution](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-CUSTON-TEST-CASES.md)
  
**Start editing from here:  These notes are cut and paste of information and make some since once I finsh design**
  
#### Types of Test Cases

**Funciotnal Verification (FVT)** is defined as the process of verifying that the design meets its specification from a functional perspective. ... Functional verification establishes that the design under test (DUT) implements the functionality of the specification correctly.

**Static Analysis (SA)** is the examination of code prior to the program’s execution SA is code analysis, syntax, permission, code inspection, code review, etc.
	
Place the expected results from the test case into a file with the same test case name but add '.expected' ('dot'expected).  Pipe the output from the test case into a file with the same name but add '.test-case-output'. 

====>>>  Moved from above

    git commit -m 'latest changes' <COMMIT_FILE_NAME>

After entering the above command, Git runs any Git hooks found in \<REPOSITORY-NAME>/.git/hooks/ directory.  Git hooks are scripts that Git executes before and/or after events. Two local Git hooks are included with git-TEST-commit-automation. 

**pre-commit** - Creates \<REPOSITORY>/hooks/COMMIT_FILE_LIST with a list of \<REPOSITORY-PATH>/\<FILE> being committed.

**post-commit** 
- run test cases for files found in \<REPOSITORY>/hooks/COMMIT_FILE_LIST
- Loop through committed files found in COMMIT_FILE_LIST
- Check if COMMIT_FILE has a 'TEST' directory
- Create links to EXAMPLES/\<TEST_CASE> and \<TEST_CASE>.expected and other test case files (FVT-setup.sh, SA-setup.sh)
- Create list of test cases found in \<REPOSITORY>/\<PATH>/TEST/\<COMMIT_FILE_NAME>/ directory (files starting with SA-, FVT-)
- Loop through \<REPOSITORY>/\<PATH>/TEST/\<COMMIT_FILE_NAME>/SA-<TEST_CASE>
- Run \<REPOSITORY>/\<PATH>/TEST/\<COMMIT_FILE_NAME>/SA-<TEST_CASE>
- Loop through \<REPOSITORY>/\<PATH>/TEST/\<COMMIT_FILE_NAME>/FVT-<TEST_CASE>
    - Run \<REPOSITORY>/\<PATH>/TEST/\<COMMIT_FILE_NAME>/FVT-<TEST_CASE>

**git-TEST-cases.sh** - search from top of repository to list TEST directory test cases and manage test cases

**setup-git-TEST-cases.sh** - setup git TEST cases in current repository

**uninstall-git-TEST-cases.sh** - uninstall git TEST cases in current repository
  
**PASS** or **FAIL** or **ERROR**, some methed will notify someone of the results. (not sure which method is going to work for me and you? . . . stdout, logs-scrape, tables, email, twitter, slack, tall a friand, etc.)
 
**hooks directory**  The hooks directory was created because I wanted to modify the GitHub hooks and track changes per repository.  Include hooks/ in repostory because .git/hooks is not pushed and hooks change and these changes need to be tracked in a Git repository. (need to retest)

**Note**   I found out about hooks and need to remember and add to the README why I added a hooks directory in the repository so the hooks can be managed by the repository . . .Hooks are per-repository and are not designed to be pushed but can be pushed. Similarly, the repo config isn't pushed either, nor is anything in .git/info , or a number of other things. Pushing and pulling only exchanges branches/tags and commit objects (and anything reachable from a commit, e.g. trees, blobs** Add something about creating a symbolic link from ../.git/hooks to this hooks directory that are managed in this repository using markit. 

 #### Author
[<img id="twitter" src="hooks/images/twitter.png" width="50" a="twitter.com/bradleyaustintx/">
](https://twitter.com/bradleyaustintx/)   [<img id="github" src="hooks/images/github.png" width="50" a="https://github.com/BradleyA/">
](https://github.com/BradleyA/)    [<img src="hooks/images/linkedin.png" style="max-width:100%;" >](https://www.linkedin.com/in/bradleyhallen)

#### System OS script tested
 * Ubuntu 16.04.6 LTS (GNU/Linux 4.4.38-v7+ armv7l)
 * Ubuntu 14.04.6 LTS (GNU/Linux 4.4.0-148-generic x86_64)

#### Design Principles
 * Have a simple setup process and a minimal learning curve
 * Be usable as non-root
 * Be easy to install and configure

## License
MIT License

Copyright (c) 2019 [Bradley Allen](https://www.linkedin.com/in/bradleyhallen)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
