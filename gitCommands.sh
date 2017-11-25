#!/usr/bin/env bash
# ------------ Git-Login ---------------
function gitConfiguration () {
	echo "GIT Configuration"
    echo "Asking for your credentials"
    local USERNAME EMAIL PASSWORD
    read -p  " - Type the user's @name: " USERNAME 
    read -p  " - Type the user's @email: " EMAIL 
    read -sp " - Type the user's @password: " PASSWORD 
    echo "Setting user.name to $USERNAME"
    git config user.name "$USERNAME"
    echo "Setting user.mail to $EMAIL"
    git config user.email "$EMAIL"
    echo "Setting user.password to $PASSWORD"
    git config credential.helper store
    echo "The credentials have been saved now for 1 day or so"
    echo "This is your new configuration now:"
    git config --list
    echo "Thank you"
}
alias gitConfiguration="gitConfiguration"
# ------------ Git-Configuration-Info ----------
function gitConfigurationInfo () {
	echo "GIT Configuration Info"
	git config --list
	echo "Thank you"
}
alias gitLoginInfo="gitLoginInfo"
#------------- Git-Initialize ----------
function gitInitialize () {
	echo "GIT Initialize"
    git init
	echo "Thank you"
}
alias gitInitialize="gitInitialize"
#------------- Git-Create-Branch -------
function gitCreateBranch () {
    local BRANCH BRANCH_VERSION BRANCH_ORIGIN BRANCH_ORIGIN_VERSION
    echo "Asking for branch-creation details"
    read -p " - Type the branch's name: " BRANCH
    read -p " - Type the branch's version (default: last): " BRANCH_VERSION
    read -p " - Type the branch's name you want to extend: " BRANCH_ORIGIN
    read -p " - Type the branch's version (default: last): " BRANCH_ORIGIN_VERSION
    echo "Creating branch $BRANCH. Wait, please..."
    git checkout $BRANCH $BRANCH_ORIGIN
    local CHANGE_BRANCH
    read -p " - You want to switch to the new branch? " $CHANGE_BRANCH
	echo "Thank you"
   
}
alias gitCreateBranch="gitCreateBranch"
#------------- Git-Change-Branch -------
function gitChangeBranch () {
	local BRANCH BRANCH_ORIGIN
    echo "Changing to branch"
    read -p " - Type the branch's name to switch to: " BRANCH
    read -p " - Type the branch's version (default: last branch): " BRANCH_VERSION
    echo "Switching to branch $BRANCH extending branch $BRANCH_ORIGIN"
   
}
alias gitChangeBranch="gitChangeBranch"
#------------- Git-Delete-Branch -------
function gitDeleteBranch () {
    echo "Deleting branch"
    echo "Deleting branch $1"
    echo "Deleting branch $1 in its version $2"
}
alias gitDeleteBranch="gitDeleteBranch"
#------------- Git-History-Branch -------
function gitHistory () {
    echo "Checking history"
    echo "Checking history of file $1"
}
alias gitHistory="gitHistory"
#------------- Git-Differences -------
function gitDifferences () {
    echo "Differentiating"
    echo "Differentiating file $1"
    echo "Differentiating with program Melt"
}
alias gitDifferences="gitDifferences"
#------------- Git-Commit -------
function gitCommit () {
    echo "Commiting"
    echo "Commiting with message $1"
    echo "Commiting branch: x"
    echo "Commiting message: x"
    echo "Commiting files: x"
    echo "Is it okay? (Y/n)"
}
alias gitCommit="gitCommit"
#------------- Git-Push -------
function gitPush () {
    echo "Pushing"
}
alias gitPush="gitPush"
#------------- Git-Mix-Branch -------
function gitMixBranch () {
    echo "Mixing current branch"   
    echo "Mixing current branch with branch $1"
    echo "1. Copy current branch in a temporary folder" 
    echo "2. Delete current branch" 
    echo "3. Create same-named branch, but from the branch we want to mix"
    echo "4. Add branch files to current same-named branch" 
}
alias gitMixBranch="gitMixBranch"
#------------- Git-Status -------
function gitStatus () {
    echo "Showing commit status"
    echo "Showing commit status of file $1"
}
alias gitStatus="gitStatus"
#------------- Git-Add-File -------
function gitAddFile () {
    echo "Adding file"
    echo "Adding file $1"
}
alias gitAddFile="gitAddFile"
#------------- Git-Remove-File -------
function gitRemoveFile () {
    echo "Removing file"
    echo "Removing file $1"
}
alias gitRemoveFile="gitRemoveFile"
#------------- Git-Revert-File -------
function gitRevertFile () {
    echo "Reverting file $1 to version $2"
}
alias gitRevertFile="gitRevertFile"
#------------- Git-Revert-Branch -------
function gitRevertBranch () {
    echo "Reverting branch $1 to version $2"
}
alias gitRevertBranch="gitRevertBranch"
#------------- Git-Clone -------
function gitClone () {
    echo "Cloning project"
    echo "Cloning project $1"
    echo "Cloning project $1 in version $2"
}
alias gitClone="gitClone"
