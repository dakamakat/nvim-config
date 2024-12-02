#!/bin/bash

# Set your source and destination directories
source_directory="/home/dakamakat/.config/nvim/"
destination_directory="/home/dakamakat/projects/nvim-config/"

# Use the first positional argument as the commit message, or provide a default message
commit_message="${1:-default automatic minor update}"

# Copy files with replacements
rsync -rP --exclude=.git --exclude=node_modules "$source_directory/" "$destination_directory/"

# Change to the destination directory
cd "$destination_directory" || exit

# Add all changes to Git
git add .

# Commit changes with the specified message
git commit -m "$commit_message"

# Push changes to the remote repository
git push origin 2.0-main
