#!/bin/bash

# Check if the parent directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <parent_directory> <script_to_run>"
  exit 1
fi

# Check if the script is provided
if [ -z "$2" ]; then
  echo "Error: Please specify the script to run."
  exit 1
fi

# Assign arguments to variables
parent_directory=$1
script_to_run=$2
output_file="results.txt"

# Clear or create the output file
> "$output_file"

# Loop through all directories inside the parent directory
for dir in "$parent_directory"/*/; do
  if [ -d "$dir" ]; then
    #echo "Executing script in directory: $dir" | tee -a "$output_file"
    
    # Execute the script and append output to the file
    bash "$script_to_run" "$dir" >> "$output_file" 2>&1
    
    # Add a separator for clarity
    #echo "----------------------------" >> "$output_file"
  fi
done

echo "All scripts executed. Results saved in $output_file."