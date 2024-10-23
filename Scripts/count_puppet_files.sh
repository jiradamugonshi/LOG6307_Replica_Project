#!/bin/bash

# Check if the directory is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Check if the given argument is a valid directory
if [ ! -d "$1" ]; then
  echo "Error: '$1' is not a valid directory"
  exit 1
fi

# Count the files recursively in the directory
file_count=$(find "$1" -type f | wc -l)
file_puppet_count=$(find "$1" -type f -name "*.pp" | wc -l)
if [ "$file_count" -ne 0 ]; then
	ratio=$(awk "BEGIN {printf \"%.2f\", $file_puppet_count / $file_count}")
else
	ratio=0.00
fi

treshold=0.11

if awk "BEGIN {exit !($ratio >= $treshold)}"; then
  echo "*$1*"
fi

# Print the result
#echo "Ratio of puppet files in '$1': $ratio"