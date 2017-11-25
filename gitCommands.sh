#!/usr/bin/env bash

# ALREADY WORKING!!

# ------------ Git-Settings-Info ----------
function gitanoSettingsInfo () {
	echo " (*) Your current settings [git config --list]:"
    git config --list
}
alias gitanoSettingsInfo="gitanoSettingsInfo"

# ------------ Git-List-Repositories-URL ---------
function gitanoListRepositories () {
	echo " (*) Your current repositories [git remote -v]"
	git remote -v
}
alias gitanoListRepositories="gitanoListRepositories"

# ------------ Git-Login ---------------
function gitanoLogin () {
    echo " (*) Asking for credentials' data"
    local USERNAME EMAIL PASSWORD
    read -p  " - Type the user's @name: " USERNAME 
    read -p  " - Type the user's @email: " EMAIL 
    read -sp " - Type the user's @password: " PASSWORD 
    echo " (*) Setting username in git configs [git config user.name $USERNAME]"
    git config user.name "$USERNAME"
    echo " (*) Setting email in git configs [git config user.email $EMAIL]"
    git config user.email "$EMAIL"
    echo " (*) Setting password in git configs [git config user.password XXX]"
    git config user.password "$PASSWORD"
    echo " (*) Saving this data in cache [git config credential.helper store]"
    git config credential.helper store
    echo " (*) Your current settings [git config --list]:"
    git config --list
}
alias gitanoLogin="gitanoLogin"

# ------------ Git-Create-Repository-URL ---------
function gitanoCreateRepository () {
	echo " (*) Asking for repository's data...:"
	local REPOSITORY_URL
	read -p " - First remote repository will be 'origin'."
	read -p " - And first local branch will be 'master'."
	read -p " - So, type the @URL of the repository (usually ending with *.git): " REPOSITORY_URL
	echo " (*) Creating remote repository 'origin' from local branch 'master' in remote git server $REPOSITORY_URL"
	touch README.md
	echo ""
	git remote add origin $REPOSITORY_URL
	git push -u origin master
}
alias gitanoCreateRepository="gitanoCreateRepository"

# ------------ Git-Set-Repository-URL ---------
function gitanoSetRepositoryURL () {
	echo " (*) Listing current repositories"
	git remote -v
	echo " (*) Asking for the repository you want to change its URL"
	local REPOSITORY_NAME
	read -p " - Type the remote repository @name which you'd want to change its URL (origin): " REPOSITORY_NAME
	local REPOSITORY_URL
	read -p " - Type the new repository @URL (*.git): " REPOSITORY_URL
	echo " (*) Set repository's new URL [git remote set-url $REPOSITORY_NAME $REPOSITORY_URL]"
	git remote set-url $REPOSITORY_NAME $REPOSITORY_URL
}
alias gitanoSetRepositoryURL="gitanoSetRepositoryURL"

#------------- Git-Create-Branch -------
function gitanoCreateBranch () {
    local BRANCH BRANCH_ORIGIN
    echo " (*) Asking for branch-creation details"
    read -p " - Type the name of the new branch you want to create: " BRANCH
    read -p " - Type the name of the brand you want to extend: " BRANCH_ORIGIN
    echo " (*) Creating branch [git checkout -b $BRANCH $BRANCH_ORIGIN]"
    git checkout -b $BRANCH $BRANCH_ORIGIN
}
alias gitanoCreateBranch="gitanoCreateBranch"



# NOT WORKING YET...

#------------- Git-Initialize ----------
function gitanoInitialize () {
    echo " (*) This process will go by:"
    echo " (1) GIT Project Initialization"
    echo " (2) GIT Login"
    echo " (3) GIT Create Repository"
    git init
    gitLogin
    gitCreateRepository
}
alias gitanoInitialize="gitanoInitialize"

#------------- Git-Change-Branch -------
function gitanoChangeBranch () {
	local BRANCH BRANCH_ORIGIN
    echo " (*) Changing to branch"
    read -p " - Type the branch's name to switch to: " BRANCH
    echo " (*) Switching to branch $BRANCH [git checkout -p $BRANCH_ORIGIN]"
    git checkout -p "$BRANCH_ORIGIN"
}
alias gitanoChangeBranch="gitanoChangeBranch"
#------------- Git-Delete-Branch -------
function gitanoDeleteBranch () {
    echo " (*) Deleting branch"
    echo " (*) Deleting branch $1"
    echo " (*) Deleting branch $1 in its version $2"
}
alias gitanoDeleteBranch="gitanoDeleteBranch"
#------------- Git-History-Branch -------
function gitanoHistory () {
	if [ -z "$1" ]
	then
		echo " (*) Checking history of current branch [git log]"
		git log
	else
		echo " (*) Checking history of file [git log $1]"
		git log "$1"
	fi
}
alias gitanoHistory="gitanoHistory"
#------------- Git-Differences -------
function gitanoDifferences () {
    echo " (*) Showing differences between current commit and previous commit:"

}
alias gitanoDifferences="gitanoDifferences"
#------------- Git-Solve-Differences -------
function gitanoSolveDifferences () {
    echo " (*) Solving differences"
    git difftool --prompt
}
alias gitanoDifferences="gitanoDifferences"
#------------- Git-Commit -------
function gitanoCommit () {
    echo " (*) Commiting"
    echo " (*) Commiting with message $1"
    echo " (*) Commiting branch: x"
    echo " (*) Commiting message: x"
    echo " (*) Commiting files: x"
    read -p "Is it okay? (y/N)" -n 1 -r
	echo  
	if [[ ! $REPLY =~ ^[YyEeSs]?$ ]]
	then
	    echo " (*) Commiting changes to local"
	    git commit 
	else 
		echo " (*) Abort commit."
	fi
}
alias gitanoCommit="gitanoCommit"
#------------- Git-Push -------
function gitanoPush () {
    echo " (*) Pushing"
    echo
    echo " (*) Push Info:"
    echo " (*) Current branch: $(gitCurrentBranch)"
    echo " (*) Current user: $(gitCurrentUser)"
    echo " (*) Current email: $(gitCurrentEmail)"
    echo " (*) Current repository: $(gitCurrentRepository)"
    echo " (*) Current commit message:"
    echo 
    echo " ---------------------------"
    gitCurrentCommitMessage
    echo " ---------------------------"
    echo 
    echo " (*) Current commit differences:"
    echo
    gitDifferences
    echo
    read -p "Do you want to push it now? (y/N)" -n 1 -r
	echo  
	if [[ ! $REPLY =~ ^[YyEeSs]?$ ]]
	then
	    echo " (*) Commiting changes to local"
	    git commit 
	else 
		echo " (*) Abort commit."
	fi
    echo
    echo
    echo "You are $IS_SURE. Ok."
}
alias gitanoPush="gitanoPush"
#------------- Git-Current-Branch -------
function gitanoCurrentBranch () {
	git symbolic-ref --short HEAD
}
alias gitanoCurrentBranch="gitanoCurrentBranch"
#------------- Git-Current-User -------
function gitanoCurrentUser () {
	git config user.name
}
alias gitanoCurrentUser="gitanoCurrentUser"
#------------- Git-Current-Email -------
function gitanoCurrentEmail () {
	git config user.email
}
alias gitanoCurrentEmail="gitanoCurrentEmail"
#------------- Git-Current-Repository -------
function gitanoCurrentRepository () {
	git config user.name
}
alias gitanoCurrentRepository="gitanoCurrentRepository"
#------------- Git-Current-Commit-Message -------
function gitanoCurrentCommitMessage () {
	git log -1
}
alias gitanoCurrentCommitMessage="gitanoCurrentCommitMessage"
#------------- Git-Current-Differences -------
function gitanoCurrentDifferences () {
	git diff --name-only --diff-filter=U
}
alias gitanoCurrentDifferences="gitanoCurrentDifferences"
#------------- Git-Solve-Differences -------------
function gitanoSolveDifferences () {
	echo " (*) Solving pending differences between last pushed file and current commited file [git difftool --prompt"
	git difftool --prompt
}
alias gitanoSolveDifferences="gitanoSolveDifferences"
#------------- Git-Current-Commit-Information -------
function gitanoCurrentCommitInformation () {
	gitCurrentBranch
	gitCurrentUser
	gitCurrentEmail
	gitCurrentRepository
	gitCurrentCommitMessage
	gitCurrentDifferences
}
alias gitanoCurrentCommitInformation="gitanoCurrentCommitInformation"
#------------- Git-Mix-Branch- -------
function gitanoMixBranch () {
    echo " (*) Mixing current branch"   
    echo " (*) Mixing current branch with branch $1"
    echo " (1) Copy current branch in a temporary folder" 
    echo " (2) Delete current branch" 
    echo " (3) Create same-named branch, but from the branch we want to mix"
    echo " (4) Add branch files to current same-named branch" 
}
alias gitanoMixBranch="gitanoMixBranch"
#------------- Git-Status -------
function gitanoStatus () {
    echo " (*) Showing commit status"
    echo " (*) Showing commit status of file $1"
}
alias gitanoStatus="gitanoStatus"
#------------- Git-Add-File -------
function gitanoAddFiles () {
    if [ $# -eq 0 ]
	then
		echo " (*) Listing differences: $@"
		git diff
	else 
		echo " (*) Adding files: $@"
	fi
    for file in "$@"
    do
	echo " (*) Adding file: $file"
	git add $file
    done
}
alias gitanoAddFiles="gitanoAddFiles"
#------------- Git-Remove-File -------
function gitanoRemoveFile () {
    echo " (*) Removing file"
    echo " (*) Removing file $1"
}
alias gitanoRemoveFile="gitanoRemoveFile"
#------------- Git-Revert-File -------
function gitanoRevertFile () {
    echo " (*) Reverting file $1 to version $2"
}
alias gitanoRevertFile="gitanoRevertFile"
#------------- Git-Revert-Commit -------
function gitanoRevertCommit () {
    echo " (*) Reverting commit $1 "
}
alias gitanoRevertCommit="gitanoRevertCommit"
#------------- Git-Revert-Branch -------
function gitanoRevertBranch () {
    echo " (*) Reverting branch"
    read -p " - Current branch"
}
alias gitanoRevertBranch="gitanoRevertBranch"
#------------- Git-Clone -------
function gitanoClone () {
    echo " (*) Cloning project"
    echo " (*) Cloning project $1"
    echo " (*) Cloning project $1 in version $2"
}
alias gitanoClone="gitanoClone"