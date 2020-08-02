#!/bin/bash
#
# Script to replace string1 with string2 in workspace
#

if [ "$#" -ne 2 ]; then
	echo "usage $0 source_string dest_string"
else
	git grep -n "$1"
	read -p "Are you sure you want to replace $1 instances with $2 in workspace ?" -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		git grep -l "$1" | xargs sed -i "s/$1/$2/g"
	fi
fi
