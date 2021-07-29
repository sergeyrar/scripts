#!/bin/bash
#
# Script to find a the occurrences of a string in a tar.gz file (That itself might include more tar.gz...)
# WARNING: This script will extract tar.gz archives and remove original tar.gz files.

OUTPUT=$(find . | grep tar.gz)
while [ -n "$OUTPUT" ]
do
        echo "New tar file found..."
        echo ${OUTPUT}
        for f in ${OUTPUT} 
        do
                echo "extracting $f..."
                tar -zxf "$f" 1>&2 2>/dev/null
                echo "deleting $f..."
                rm -f "$f" 2>/dev/null
        done
        OUTPUT=$(find . | grep tar.gz)
done


if [ $# -eq 0 ] 
then
        printf "Usage: %s \"string_to_search\"\n" "$0"
else
        printf "Searching for files that contain \"%s\" string...\n" "$1"
        find . | xargs zgrep -l "$1" 
        echo -e "\n\n"

        echo "Matching output:"
        find . | xargs zgrep -a "$1" 2>/dev/null
        echo -e "\n\n"
fi

