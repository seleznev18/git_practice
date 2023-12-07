#!/bin/bash
check= $(git diff --cached --name-only --diff-filter=ACMR) | grep ".txt\$"

if [ -z "$check" ]
then
	echo "No txt files found"
	exit 0

fi

set -e

flake8 $check
black --check $check

echo "All files arr fine"
