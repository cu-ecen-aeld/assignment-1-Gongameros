#!/bin/sh

if [ $# -ne 2 ]
then
    echo "Input should be: $0 writefile writestr"
    exit 1
fi

WRITEFILE=$1
WRITESTR=$2

if [ -z "$WRITEFILE" ] || [ -z "$WRITESTR" ]
then
  echo "writefile and writestr arguments are required"
  exit 1
fi

sudo mkdir -p "$(dirname "$WRITEFILE")"

if [ $? -ne 0 ]; then
  echo "Error: Could not create directory for file $WRITEFILE"
  exit 1
fi

echo "$WRITESTR" > "$WRITEFILE"

if [ $? -ne 0 ]; then
  echo "Error: Could not write to file $WRITEFILE"
  exit 1
fi

exit 0