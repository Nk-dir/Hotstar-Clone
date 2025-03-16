#!/bin/bash
# Script to execute all shell scripts in the current directory

echo "Executing all .sh files in the current directory..."

# Loop through each .sh file and execute it
for script in *.sh; do
    if [ -x "$script" ]; then
        echo "Running $script..."
        ./"$script"
        echo "$script execution completed!"
    else
        echo "Skipping $script (no execute permission)"
    fi
done

echo "All scripts executed!"
