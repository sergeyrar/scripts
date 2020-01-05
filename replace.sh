#!/bin/bash
#
# Script to replace string1 with string2 in workspace
#

if [ "$#" -ne 2 ]; then
	echo "usage $0 source_string dest_string"
else
	echo "replacing $1 with $2 in workspace"
	git grep -l "$1" | xargs sed -i "s/$1/$2/g"
fi
