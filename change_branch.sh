#!/bin/bash

gitBranch=$(git branch)

if [[ $# -eq 0 ]]; then 
	echo "No arguments passed."
	exit 1
fi

branches=$(echo "$gitBranch" | grep -i "$1")
noOfBranches=$(echo "$branches" | grep -vc "^$" | tr -d ' ')

if [ "$noOfBranches" -eq 0 ]; then
	echo "No branches found."
	exit 2
elif [ "$noOfBranches" -eq 1 ]; then
	branch=$(echo "$branches" | tr -d '* ')
	echo "Branch found: $branch"
	echo "Checking out to branch..."
	git checkout "$branch"
else
	echo "More than 1 branch found. Please add a more specific search term."
	
	read -rp "Do you wish to see all matching branches? [y/n]" yesOrNo
	if [[ "$yesOrNo" =~ ^([Yy])$ ]]; then
		echo "Branches found:" 
		echo "$branches"
	else
		exit 3;
	fi
fi 
