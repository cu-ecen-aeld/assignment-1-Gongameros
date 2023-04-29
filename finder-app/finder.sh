#!/bin/sh
# Author: [Markiian Hoiinets]

set -e
set -u

if [ $# -ne 2 ]
then
    echo "Usage: $0 filesdir searchstr"
    exit 1
fi

FILESDIR=$1
SEARCHSTR=$2

if [ ! -d "$FILESDIR" ]
then
    echo "$FILESDIR is not directory"
    exit 1
fi

XFILES=$(grep -r -l "$SEARCHSTR" "$FILESDIR" | wc -l)
YMATCH=$(grep -r "$SEARCHSTR" "$FILESDIR" | wc -l)

echo "The number of files are ${XFILES} and the number of matching lines are ${YMATCH}"