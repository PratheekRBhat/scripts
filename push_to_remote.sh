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
    echo "Pushing to origin..."
    git push origin "$branch"
else
    echo "More than 1 branch found. Add a more specific search term."
fi