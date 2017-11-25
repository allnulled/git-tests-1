#!/usr/bin/env bash


# ------------ Git-Login ---------------
function gitLogin () {
	echo "LOGIN"
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
    echo "LOGIN"
}
alias gitLogin="gitLogin"

# ------------ Git-Login-Info ----------
function gitLoginInfo () {
	echo "LOGIN INFO"
	git config
	echo "LOGIN INFO"
}
alias gitLoginInfo="gitLoginInfo"

#------------- Git-Initialize ----------

function gitInitialize () {
	echo "INITIALIZE"
    git init
	echo "INITIALIZE"
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
    read -p " - You want to switch to the new branch? " 
   
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


function gitDeleteBranch () {
    echo "Deleting branch"
    echo "Deleting branch $1"
    echo "Deleting branch $1 in its version $2"

}
function gitHistory () {
    echo "Checking history"
    echo "Checking history of file $1"
}
function gitDifferences () {
    echo "Differentiating"
    echo "Differentiating file $1"
    echo "Differentiating with program Melt"
}
function gitCommit () {
    echo "Commiting"
    echo "Commiting with message $1"
    echo "Commiting branch: x"
    echo "Commiting message: x"
    echo "Commiting files: x"
    echo "Is it okay? (Y/n)"
}
function gitPush () {
    echo "Pushing"
}
function gitMixBranch () {
    echo "Mixing"   
    echo "Mixing with branch $1"    
}
function gitStatus () {
    echo "Showing status"
    echo "Showing status of file $1"
}
function gitAddFile () {
    echo "Adding file"
    echo "Adding file $1"
}
function gitRemoveFile () {
    echo "Removing file"
    echo "Removing file $1"
}
function gitRevertFile () {
    echo "Reverting file $1 to version $2"
}
function gitRevertBranch () {
    echo "Reverting branch $1 to version $2"
}
function gitClone () {
    echo "Cloning project"
    echo "Cloning project $1"
    echo "Cloning project $1 in version $2"
}
alias gitDeleteBranch="gitDeleteBranch"
alias gitHistory="gitHistory"
alias gitDifferences="gitDifferences"
alias gitCommit="gitCommit"
alias gitPush="gitPush"
alias gitMixBranch="gitMixBranch"
alias gitStatus="gitStatus"
alias gitAddFile="gitAddFile"
alias gitRemoveFile="gitRemoveFile"
alias gitRevertFile="gitRevertFile"
alias gitRevertBranch="gitRevertBranch"
alias gitClone="gitClone"

