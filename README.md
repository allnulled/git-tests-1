# Gitano shortcuts


## 1. Description
*Gitano shortcuts* is just set of easy to use and remember shortcuts for common **Git** tasks, written in **Bash Scripting**.
## 2. Prerequisites
You need a **Linux** distro and the **bash** interpreter to run the *Gitano commands*.
And the **Git** command line tool, of course.
## 3. Installation
You can add the lines of the *Gitano commands* file (gitanoCommands.sh) directly in your **.bashrc** or similar to always have them reacheable in your terminals since you boot your machine. 

## 4. Documentation
To see all the available *Gitano commands*, in your Terminal, you can type:

    ~$ gitano

And then press [TAB] instead of [ENTER], so you can obtain a list of the available Gitano commands.

## 5. Usage
All the commands are available, at least, without any parameter. They'll try, in these cases, to ask directly to the user what it needs to know to do the specified task, if any.

Just, for example, to create a repository:

    ~$ gitanocreaterepository

Or to create a branch in your local repository:

	
    ~$ gitanocreatebranch

Or, for example, to change between branches:

    ~$ gitanochangebranch

Or to commit your changes:

    ~$ gitanocommit

Or to commit and push them:

    ~$ gitanopush

And so on.

All of these commands, that are only some examples, can be used without arguments, and the program will assist the user to achieve the demanded tasks.

But in case that you were thinking: `why do not you put a list of them?`, here it is:

*`gitanosettingsinfo`*: executes a `git config --list`

*`gitanolistrepositories`*: executes a `git remote -v`

*`gitanologin`*: executes, one after the other, and asking for the user's input:

	git config user.name "$USERNAME"

	git config user.email "$EMAIL"
	
	git config user.password "$PASSWORD"
	
	git config credential.helper store
	
	git config --list

*`gitanocreaterepository`*: executes, one after the other, and asking for the user's input:

	git add README.md

	git commit -m "First commit"

	git remote add origin $REPOSITORY_URL

	git push -u origin master

*`gitanosetrepositoryurl`*: executes, one after the other, and asking for the user's input:

	git remote -v

	git remote set-url $REPOSITORY_NAME $REPOSITORY_URL

*`gitanoinitialize`*: executes one after the other:
	
	git init
    
	gitanologin
    
	gitanocreaterepository

*`gitanoupdatebranches`*: executes `git fetch --all`.

*`gitanoupdatebranch`*: executes `git pull`.

*`gitanocommit`*: executes `git commit`.

*`gitanopush`*: executes, asking for the user's input:

	gitanodifferences
	
	git commit 
	
	git push -u origin "$(gitanobranch)".

*`gitanoaddfiles`*: executes `git add $file`. 

*To be continued...*

*`gitanodeletefiles`*: executes `...`. 

*`gitanodeletebranch`*: executes `...`. 

*`gitanodeletebranches`*: executes `...`. 

*`gitanoclean`*: executes `...`. 

*`gitanobranch`*: executes `...`. 

*`gitanouser`*: executes `...`. 

*`gitanoemail`*: executes `...`. 

*`gitanorepository`*: executes `...`. 

*`gitanocommitmessage`*: executes `...`. 

*`gitanocreatelocalbranch`*: executes `...`. 

*`gitanochangebranch`*: executes `...`. 

*`gitanocreatebranch`*: executes `...`. 

*`gitanobranches`*: executes `...`. 

*`gitanohistory`*: executes `...`. 

*`gitanodifferences`*: executes `...`. 

*`gitanosolvedifferences`*: executes `...`. 

*`gitanodifferences`*: executes `...`. 

*`gitanosolvedifferences`*: executes `...`. 

*`gitanocommitinformation`*: executes `...`. 

*`gitanomixbranch`*: executes `...`. 

*`gitano`*: executes `...`. 

*`gitanoremovefiles`*: executes `...`. 

*`gitanoremoveremotefiles`*: executes `...`. 

*`gitanorevertfiles`*: executes `...`. 

*`gitanorevertcommit`*: executes `...`. 

*`gitanoclone`*: executes `...`. 

*`gitanomovefile`*: executes `...`. 


## 6. Why?

Because it's easier this way. I do not need to remember all the commands and their options, and also I can create combos of commands, and reduce the amount of options that git gives, while I can still use the normal git command. It's wonderful for me.
