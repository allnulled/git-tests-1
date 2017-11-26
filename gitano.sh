#!/usr/bin/env bash

# ALREADY WORKING!!

# ------------ Git-Settings-Info ----------
function gitanosettingsinfo () {
	echo " (*) Your current settings [git config --list]:"
    git config --list
}
alias gitanosettingsinfo="gitanosettingsinfo"

# ------------ Git-List-Repositories-URL ---------
function gitanolistrepositories () {
	echo " (*) Your current repositories [git remote -v]"
	git remote -v
}
alias gitanolistrepositories="gitanolistrepositories"

# ------------ Git-Login ---------------
function gitanologin () {
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
alias gitanologin="gitanologin"

# ------------ Git-Create-Repository-URL ---------
function gitanocreaterepository () {
	echo " (*) Asking for repository's data...:"
	local REPOSITORY_URL
	echo " (*) First remote repository will be 'origin'."
	echo " (*) And first local branch will be 'master'."
	read -p " - URL of the repository (*.git): " REPOSITORY_URL
	echo " (*) Creating default README.md file [touch README.md]"
	touch README.md
	echo "# Read this file" >> README.md
	echo " (*) Adding README.md to commit [git add README.md]"
	git add README.md
	echo " (*) Commiting changes with message 'First commit' [git commit -m 'First commit']"
	git commit -m "First commit"
	echo " (*) Creating remote repository 'origin' at URL $REPOSITORY_URL [git remote add origin $REPOSITORY_URL]"
	git remote add origin $REPOSITORY_URL
	echo " (*) Pushing the first branch 'master' to 'origin' [git push -u origin master]"
	git push -u origin master
}
alias gitanocreaterepository="gitanocreaterepository"

# ------------ Git-Set-Repository-URL ---------
function gitanosetrepositoryurl () {
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
alias gitanosetrepositoryurl="gitanosetrepositoryurl"

#------------- Git-Create-Branch -------
function gitanocreatebranch () {
    local BRANCH BRANCH_ORIGIN
    echo " (*) Asking for branch-creation details"
    read -p " - Type the name of the new branch you want to create: " BRANCH
    read -p " - Type the name of the brand you want to extend: " BRANCH_ORIGIN
    echo " (*) Creating branch [git checkout -b $BRANCH $BRANCH_ORIGIN]"
    git checkout -b $BRANCH $BRANCH_ORIGIN
}
alias gitanocreatebranch="gitanocreatebranch"



# NOT WORKING YET...

#------------- Git-Initialize ----------
function gitanoinitialize () {
    echo " (*) This process will go by:"
    echo " (1) GIT Project Initialization"
    echo " (2) GIT Login"
    echo " (3) GIT Create Repository"
    git init
    gitanologin
    gitanocreaterepository
}
alias gitanoinitialize="gitanoinitialize"

#------------- Git-Change-Branch -------
function gitanochangebranch () {
	local BRANCH
    echo " (*) Current branch: $(gitanobranch)"
    echo " (*) Available branches: [git branch]"
    git branch
    read -p " - Type the branch's name to switch to: " BRANCH
    echo " (*) Switching current branch $(gitanobranch) to $BRANCH [git checkout $BRANCH]"
    git checkout "$BRANCH_ORIGIN"
}
alias gitanochangebranch="gitanochangebranch"
#------------- Git-Exists-Branch -------
function gitanoexistsbranch () {
	local BRANCH BRANCH_ID
	echo " (*) Available branches: [git branch]"
	git branch
	read -p " - Type the name of the branch you want to know if exists: " BRANCH
	echo " (*) Checking the branch UUID [git rev-parse --verify $BRANCH]"
	BRANCH_ID=$(git rev-parse --verify "$BRANCH")
	if [[ "$BRANCH_ID" == "" ]]; then
		echo "No, the branch $BRANCH does not exists."
	else
		echo "The branch is: $BRANCH_ID"
	fi
}
#------------- Git-Delete-Branch -------
function gitanodeletebranch () {
    echo " (*) Deleting branch"
    echo " (*) Deleting branch $1"
    echo " (*) Deleting branch $1 in its version $2"
}
alias gitanodeletebranch="gitanodeletebranch"
#------------- Git-History-Branch -------
function gitanohistory () {
	if [ -z "$1" ]
	then
		echo " (*) Checking history of current branch [git log]"
		git log
	else
		echo " (*) Checking history of file [git log $1]"
		git log "$1"
	fi
}
alias gitanohistory="gitanohistory"
#------------- Git-Differences -------
function gitanodifferences () {
    echo " (*) Showing differences between current commit and previous commit:"

}
alias gitanodifferences="gitanodifferences"
#------------- Git-Solve-Differences -------
function gitanosolvedifferences () {
    echo " (*) Solving differences"
    git difftool --prompt
}
alias gitanodifferences="gitanodifferences"
#------------- Git-Commit -------
function gitanocommit () {
    echo " (*) Commiting"
    echo " (*) Commiting with message $1"
    echo " (*) Commiting branch: x"
    echo " (*) Commiting message: x"
    echo " (*) Commiting files: x"
    read -p "Is it okay? (y/N)" -n 1 -r
	echo  
	if [[ ! $REPLY =~ ^[YyEeSs]?$ ]]
	then 
		echo " (*) Abort commit."
	else 
	    echo " (*) Commiting changes to local"
	    git commit
	fi
}
alias gitanocommit="gitanocommit"
#------------- Git-Push -------
function gitanopush () {
    echo " (*) Pushing"
    echo
    echo " (*) Push Info:"
    echo " (*) Current branch: $(gitanobranch)"
    echo " (*) Current user: $(gitanouser)"
    echo " (*) Current email: $(gitanoemail)"
    echo " (*) Current repository: $(gitanorepository)"
    echo " (*) Current commit message:"
    echo 
    echo " ---------------------------"
    gitanocommitmessage
    echo " ---------------------------"
    echo 
    echo " (*) Current commit differences:"
    echo
    gitanodifferences
    echo
	echo
	echo
    read -p " - ¿COMMIT BRANCH $(gitanobranch) NOW? (y/N)" -n 1 -r
	if [[ ! $REPLY =~ ^[YyEeSs]$ ]]
	then
		echo 
		echo 
		echo " (*) Abort commit."
		return 0
	else 
		echo 
		echo 
	    echo " (*) Commiting changes to local [git commit]"
	    git commit 
	fi
	echo
	echo
	echo
	echo " (*) Final commit message: "
	echo "$(gitanocommitmessage)"
	echo " (*) Current repository: $(gitanorepository)"
	echo " (*) Current branch: $(gitanobranch)"
	echo
	echo
	echo
	read -p " - ¿PUSH CHANGES OF BRANCH '$(gitanobranch)'? (y/N)" -n 1 -r 
	if [[ ! $REPLY =~ ^[YyEeSs]$ ]]
	then 
		echo 
		echo 
		echo " (*) Abort push."
		return 0
	else
		echo
		echo
	    echo "Okay, 'yes' but..."
	fi
	echo
	echo
	echo
	read -p " - ¿Are you sure? (y/N)" -n 1 -r 
	if [[ ! $REPLY =~ ^[YyEeSs]$ ]]
	then
		echo " (*) Abort push."
		return 0
	else 
	    echo " (*) Pushing changes to remote /origin/$(gitanobranch) [git push origin $(gitanobranch)]"
	    git push -u origin "$(gitanobranch)"
	fi
    echo
}
alias gitanopush="gitanopush"
#------------- Git-Current-Branch -------
function gitanobranch () {
	git symbolic-ref --short HEAD
}
alias gitanobranch="gitanobranch"
#------------- Git-Current-User -------
function gitanouser () {
	git config user.name
}
alias gitanouser="gitanouser"
#------------- Git-Current-Email -------
function gitanoemail () {
	git config user.email
}
alias gitanoemail="gitanoemail"
#------------- Git-Current-Repository -------
function gitanorepository () {
	basename `git rev-parse --show-toplevel`
}
alias gitanorepository="gitanorepository"
#------------- Git-Current-Commit-Message -------
function gitanocommitmessage () {
	git log -1
}
alias gitanocommitmessage="gitanocommitmessage"
#------------- Git-Current-Differences -------
function gitanodifferences () {
	git diff --name-only --diff-filter=U
}
alias gitanodifferences="gitanodifferences"
#------------- Git-Solve-Differences -------------
function gitanosolvedifferences () {
	echo " (*) Solving pending differences between last pushed file and current commited file [git difftool --prompt"
	git difftool --prompt
}
alias gitanosolvedifferences="gitanosolvedifferences"
#------------- Git-Current-Commit-Information -------
function gitanocommitinformation () {
	gitanobranch
	gitanouser
	gitanoemail
	gitanorepository
	gitanocommitMessage
	gitanodifferences
}
alias gitanocommitinformation="gitanocommitinformation"
#------------- Git-Mix-Branch- -------
function gitanomixbranch () {
    echo " (*) Mixing current branch"   
    echo " (*) Mixing current branch with branch $1"
    echo " (1) Copy current branch in a temporary folder" 
    echo " (2) Delete current branch" 
    echo " (3) Create same-named branch, but from the branch we want to mix"
    echo " (4) Add branch files to current same-named branch" 
}
alias gitanomixbranch="gitanomixbranch"
#------------- Git-Status -------
function gitanostatus () {
    echo " (*) Showing commit status"
    echo " (*) Showing commit status of file $1"
}
alias gitanostatus="gitanostatus"
#------------- Git-Add-File -------
function gitanoaddfiles () {
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
alias gitanoaddfiles="gitanoaddfiles"
#------------- Git-Remove-File -------
function gitanoremovefile () {
    echo " (*) Removing file"
    echo " (*) Removing file $1"
}
alias gitanoremovefile="gitanoremovefile"
#------------- Git-Revert-File -------
function gitanorevertfile () {
    echo " (*) Reverting file $1 to version $2"
}
alias gitanorevertfile="gitanorevertfile"
#------------- Git-Revert-Commit -------
function gitanorevertcommit () {
    echo " (*) Reverting commit $1 "
}
alias gitanorevertcommit="gitanorevertcommit"
#------------- Git-Revert-Branch -------
function gitanorevertbranch () {
    echo " (*) Reverting branch"
    read -p " - Current branch"
}
alias gitanorevertbranch="gitanorevertbranch"
#------------- Git-Clone -------
function gitanoclone () {
    echo " (*) Cloning project"
    echo " (*) Cloning project $1"
    echo " (*) Cloning project $1 in version $2"
}
alias gitanoclone="gitanoclone"