#!/bin/bash

# Set your source and destination directories
source_directory="/home/dakamakat/.config/nvim/"
destination_directory="/home/dakamakat/Projects/nvim-config/"

# Set your commit message
commit_message="minor automatic config update"

# Copy files with replacements
rsync -r --exclude=.git --exclude=node_modules "$source_directory/" "$destination_directory/"

# Change to the destination directory
cd "$destination_directory"

# Add all changes to Git
git add .

# Commit changes with the specified message
git commit -m "$commit_message"

# Push changes to the remote repository
git push origin main
